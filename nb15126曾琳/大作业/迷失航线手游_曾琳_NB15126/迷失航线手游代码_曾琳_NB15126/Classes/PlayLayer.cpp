#include "PlayLayer.h"

USING_NS_CC;


Scene* GamePlayLayer::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::createWithPhysics();
	PhysicsWorld* phyWorld = scene->getPhysicsWorld();
	//phyWorld->setDebugDrawMask(PhysicsWorld::DEBUGDRAW_ALL);
	//0,0不受到重力的影响
	phyWorld->setGravity(Vect(0, 0));

	// 'layer' is an autorelease object
	auto layer = GamePlayLayer::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool GamePlayLayer::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	this->initBG();

	return true;
}

void GamePlayLayer::onEnter()
{
	Layer::onEnter();

	Size visibleSize = Director::getInstance()->getVisibleSize();

	//初始化暂停按钮.
	auto pauseSprite = Sprite::createWithSpriteFrameName("gameplay.button.pause.png");
	auto pauseMenuItem = MenuItemSprite::create(pauseSprite, pauseSprite,
		CC_CALLBACK_1(GamePlayLayer::menuPauseCallback, this));
	auto pauseMenu = Menu::create(pauseMenuItem, NULL);
	pauseMenu->setPosition(Vec2(30, visibleSize.height - 28));
	this->addChild(pauseMenu, 20, 999);

	//添加陨石1.
	auto stone1 = Enemy::createWithEnemyTypes(EnemyTypeStone);
	stone1->setVelocity(Vec2(0, -100));
	this->addChild(stone1, 10, GameSceneNodeBatchTagEnemy);

	//添加行星.
	auto planet = Enemy::createWithEnemyTypes(EnemyTypePlanet);
	planet->setVelocity(Vec2(0, -50));
	this->addChild(planet, 10, GameSceneNodeBatchTagEnemy);

	//添加敌机1.
	auto enemyFighter1 = Enemy::createWithEnemyTypes(EnemyTypeEnemy1);
	enemyFighter1->setVelocity(Vec2(0, -80));
	this->addChild(enemyFighter1, 10, GameSceneNodeBatchTagEnemy);

	//添加敌机2.
	auto enemyFighter2 = Enemy::createWithEnemyTypes(EnemyTypeEnemy2);
	enemyFighter2->setVelocity(Vec2(0, -100));
	this->addChild(enemyFighter2, 10, GameSceneNodeBatchTagEnemy);

	//玩家的飞机.
	this->fighter = Fighter::createWithSpriteFrameName("gameplay.fighter.png");
	this->fighter->setHitPoints(5);
	this->fighter->setPosition(Vec2(visibleSize.width / 2, 70));
	this->addChild(this->fighter, 10, GameSceneNodeTagFighter);

	//注册 触摸飞机事件监听器
	touchFighterlistener = EventListenerTouchOneByOne::create();
	touchFighterlistener->setSwallowTouches(true);

	//移动飞机.
	touchFighterlistener->onTouchBegan = [](Touch* touch, Event* event){
		return true;
	};

	touchFighterlistener->onTouchMoved = [](Touch* touch, Event* event){
		auto target = event->getCurrentTarget();
		target->setPosition(target->getPosition() + touch->getDelta());
	};

	//// 添加 触摸飞机事件监听器
	EventDispatcher* eventDispatcher = Director::getInstance()->getEventDispatcher();
	eventDispatcher->addEventListenerWithSceneGraphPriority(touchFighterlistener, this->fighter);



	//注册 碰撞事件监听器
	contactListener = EventListenerPhysicsContact::create();
	contactListener->onContactBegin = [this](PhysicsContact& contact)
	{
		auto spriteA = contact.getShapeA()->getBody()->getNode();
		auto spriteB = contact.getShapeB()->getBody()->getNode();
		Node* enemy1 = nullptr;

		////////////////////////////检测 飞机与敌人的碰撞 start//////////////////////////////////
		log("A = %d  ------------ B = %d", spriteA->getTag(), spriteB->getTag());
		if (spriteA->getTag() == GameSceneNodeTagFighter && spriteB->getTag() == GameSceneNodeBatchTagEnemy)
		{
			enemy1 = spriteB;
		}
		if (spriteA->getTag() == GameSceneNodeBatchTagEnemy && spriteB->getTag() == GameSceneNodeTagFighter)
		{
			enemy1 = spriteA;
		}
		if (enemy1 != nullptr) {//发生碰撞
			this->handleFighterCollidingWithEnemy((Enemy*)enemy1);
			return false;
		}
		/////////////////////////检测 飞机与敌人的碰撞 end/////////////////////////////////////

		////////////////////////////检测 炮弹与敌人的碰撞 start////////////////////////////////
		Node* enemy2 = nullptr;

		if (spriteA->getTag() == GameSceneNodeBatchTagBullet &&
			spriteB->getTag() == GameSceneNodeBatchTagEnemy)
		{
			//不可见的炮弹不发生碰撞
			if (!spriteA->isVisible())
				return false;
			//使得炮弹消失
			spriteA->setVisible(false);
			enemy2 = spriteB;
		}
		if (spriteA->getTag() == GameSceneNodeBatchTagEnemy
			&& spriteB->getTag() == GameSceneNodeBatchTagBullet)
		{
			//不可见的炮弹不发生碰撞
			if (!spriteB->isVisible())
				return false;
			//使得炮弹消失
			spriteB->setVisible(false);
			enemy2 = spriteA;
		}
		if (enemy2 != nullptr) {//发生碰撞

			this->handleBulletCollidingWithEnemy((Enemy*)enemy2);
			return false;
		}
		/////////////////////////检测 炮弹与敌人的碰撞 end/////////////////////////////////////

		return false;
	};


	eventDispatcher->addEventListenerWithFixedPriority(contactListener, 1);

	//每0.2s 调用shootBullet函数发射1发炮弹.
	this->schedule(schedule_selector(GamePlayLayer::shootBullet), 0.2f);

	this->score = 0;
	this->scorePlaceholder = 0;

	//在状态栏中设置玩家的生命值
	this->updateStatusBarFighter();
	//在状态栏中显示得分
	this->updateStatusBarScore();


}

void GamePlayLayer::onEnterTransitionDidFinish()
{
	Layer::onEnterTransitionDidFinish();
	log("GamePlayLayer onEnterTransitionDidFinish");
	UserDefault *defaults = UserDefault::getInstance();
	if (defaults->getBoolForKey(MUSIC_KEY)) {
		SimpleAudioEngine::getInstance()->playBackgroundMusic(bg_music_2, true);
	}
}

void GamePlayLayer::onExit()
{
	Layer::onExit();
	//停止调用 shootBullet函数.
	this->unschedule(schedule_selector(GamePlayLayer::shootBullet));
	//注销事件监听器.
	Director::getInstance()->getEventDispatcher()->removeEventListener(touchFighterlistener);
	Director::getInstance()->getEventDispatcher()->removeEventListener(contactListener);

	auto nodes = this->getChildren();
	for (const auto& node : nodes) {
		//如果是背景不进行remove
		if (node->getTag() != GameSceneNodeBatchTagBackground)
		{
			this->removeChild(node);
		}
	}
}

//初始化游戏背景.
void GamePlayLayer::initBG()
{
	Size visibleSize = Director::getInstance()->getVisibleSize();
	//添加背景地图.
	auto bg = TMXTiledMap::create("map/blue_bg.tmx");
	this->addChild(bg, 0, GameSceneNodeBatchTagBackground);

	//放置发光粒子背景
	ParticleSystem *ps = ParticleSystemQuad::create("particle/light.plist");
	ps->setPosition(Vec2(visibleSize.width, visibleSize.height) / 2);
	this->addChild(ps, 0, GameSceneNodeBatchTagBackground);

	//添加背景精灵1.
	auto sprite1 = Sprite::createWithSpriteFrameName("gameplay.bg.sprite-1.png");
	sprite1->setPosition(Vec2(-50, -50));
	addChild(sprite1, 0, GameSceneNodeBatchTagBackground);

	FiniteTimeAction * ac1 = (FiniteTimeAction *)MoveBy::create(20, Vec2(500, 600));
	FiniteTimeAction * ac2 = ((FiniteTimeAction *)ac1)->reverse();
	ActionInterval * as1 = Sequence::create(ac1, ac2, NULL);
	sprite1->runAction(RepeatForever::create(EaseSineInOut::create(as1)));

	//添加背景精灵2.
	auto sprite2 = Sprite::createWithSpriteFrameName("gameplay.bg.sprite-2.png");
	sprite2->setPosition(Vec2(visibleSize.width, 0));
	addChild(sprite2, 0, GameSceneNodeBatchTagBackground);

	FiniteTimeAction * ac3 = (FiniteTimeAction *)MoveBy::create(10, Vec2(-500, 600));
	FiniteTimeAction * ac4 = ((FiniteTimeAction *)ac3)->reverse();
	ActionInterval * as2 = Sequence::create(ac3, ac4, NULL);
	sprite2->runAction(RepeatForever::create(EaseExponentialInOut::create(as2)));

}

//飞机发射炮弹
void GamePlayLayer::shootBullet(float dt)
{
	if (fighter && fighter->isVisible()) {
		Bullet* bullet = Bullet::createWithSpriteFrameName("gameplay.bullet.png");
		bullet->setVelocity(Vec2(0, GameSceneBulletVelocity));
		this->addChild(bullet, 0, GameSceneNodeBatchTagBullet);
		bullet->shootBulletFromFighter(fighter);
	}
}


//在状态栏中设置玩家的生命值
void GamePlayLayer::updateStatusBarFighter()
{
	Size visibleSize = Director::getInstance()->getVisibleSize();
	//先移除上次的精灵
	Node* n1 = this->getChildByTag(GameSceneNodeTagStatusBarFighterNode);
	if (n1) {
		this->removeChildByTag(GameSceneNodeTagStatusBarFighterNode);
	}
	Sprite* fg = Sprite::createWithSpriteFrameName("gameplay.life.png");
	fg->setPosition(Vec2(visibleSize.width - 60, visibleSize.height - 28));
	this->addChild(fg, 20, GameSceneNodeTagStatusBarFighterNode);

	//添加生命值 x 5
	Node* n2 = this->getChildByTag(GameSceneNodeTagStatusBarLifeNode);
	if (n2) {
		this->removeChildByTag(GameSceneNodeTagStatusBarLifeNode);
	}
	if (this->fighter->getHitPoints() < 0)
		this->fighter->setHitPoints(0);

	__String * life = __String::createWithFormat("x %d", this->fighter->getHitPoints());
	auto lblLife = Label::createWithTTF(life->getCString(), "fonts/hanyi.ttf", 18);
	lblLife->setColor(Color3B(123, 123, 255));
	lblLife->setPosition(fg->getPosition() + Vec2(30, 0));
	this->addChild(lblLife, 20, GameSceneNodeTagStatusBarLifeNode);

}

//在状态栏中显示得分
void GamePlayLayer::updateStatusBarScore()
{
	Size visibleSize = Director::getInstance()->getVisibleSize();
	Node* n = this->getChildByTag(GameSceneNodeTagStatusBarScore);
	if (n) {
		this->removeChildByTag(GameSceneNodeTagStatusBarScore);
	}

	if (this->score <0)
		this->score = 0;

	__String * score = __String::createWithFormat("%d", this->score);
	auto lblScore = Label::createWithTTF(score->getCString(), "fonts/hanyi.ttf", 18);
	lblScore->setColor(Color3B(123,123,255));
	lblScore->setPosition(Vec2(visibleSize.width / 2, visibleSize.height - 28));
	this->addChild(lblScore, 20, GameSceneNodeTagStatusBarScore);

}


void GamePlayLayer::menuPauseCallback(Ref* pSender)
{
	log("menuPauseCallback");
	if (UserDefault::getInstance()->getBoolForKey(SOUND_KEY)) {
		SimpleAudioEngine::getInstance()->playEffect(sound_1);
	}

	//暂停当前层中的node
	this->pause();

	for (const auto& node : this->getChildren())
	{
		node->pause();
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();

	//返回主菜单
	auto backNormal = Sprite::createWithSpriteFrameName("gameplay.button.back.png");
	auto backSelected = Sprite::createWithSpriteFrameName("gameplay.button.back-on.png");

	auto backMenuItem = MenuItemSprite::create(backNormal, backSelected,
		CC_CALLBACK_1(GamePlayLayer::menuBackCallback, this));

	//继续游戏菜单
	auto resumeNormal = Sprite::createWithSpriteFrameName("gameplay.button.resume.png");
	auto resumeSelected = Sprite::createWithSpriteFrameName("gameplay.button.resume-on.png");

	auto resumeMenuItem = MenuItemSprite::create(resumeNormal, resumeSelected,
		CC_CALLBACK_1(GamePlayLayer::menuResumeCallback, this));

	menu = Menu::create(backMenuItem, resumeMenuItem, NULL);
	menu->alignItemsVertically();
	menu->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2));

	addChild(menu, 20, 1000);

}

void GamePlayLayer::menuBackCallback(Ref* pSender)
{
	log("menuBackCallback");
	Director::getInstance()->popScene();
	if (UserDefault::getInstance()->getBoolForKey(SOUND_KEY)) {
		SimpleAudioEngine::getInstance()->playEffect(sound_1);
	}
}

void GamePlayLayer::menuResumeCallback(Ref* pSender)
{
	log("menuResumeCallback");
	if (UserDefault::getInstance()->getBoolForKey(SOUND_KEY)) {
		SimpleAudioEngine::getInstance()->playEffect(sound_1);
	}
	this->resume();

	for (const auto& node : this->getChildren())
	{
		node->resume();
	}
	removeChild(menu);
}

//处理玩家与敌人的碰撞检测
void GamePlayLayer::handleFighterCollidingWithEnemy(Enemy* enemy)
{
	Size visibleSize = Director::getInstance()->getVisibleSize();

	Node *node = this->getChildByTag(GameSceneNodeTagExplosionParticleSystem);
	if (node) {
		this->removeChild(node);
	}
	ParticleSystem *explosion = ParticleSystemQuad::create("particle/explosion.plist");
	explosion->setPosition(fighter->getPosition());
	this->addChild(explosion, 2, GameSceneNodeTagExplosionParticleSystem);
	if (UserDefault::getInstance()->getBoolForKey(SOUND_KEY)) {
		SimpleAudioEngine::getInstance()->playEffect(sound_2);
	}
	//设置敌人消失
	enemy->setVisible(false);
	enemy->spawn();

	//设置玩家消失
	fighter->setHitPoints(fighter->getHitPoints() - 1);
	this->updateStatusBarFighter();
	//游戏结束
	if (fighter->getHitPoints() <= 0) {

		log("GameOver");

		auto gameOverLayer = GameOverLayer::createWithScore(score);
		auto gameOverScene = Scene::create();
		gameOverScene->addChild(gameOverLayer);

		auto tsc = TransitionFade::create(1.0f, gameOverScene);
		Director::getInstance()->pushScene(tsc);

	}
	else {
		fighter->setPosition(Vec2(visibleSize.width / 2, 70));
		auto ac1 = Show::create();
		auto ac2 = FadeIn::create(1.0f);
		auto seq = Sequence::create(ac1, ac2, NULL);
		fighter->runAction(seq);
	}

}


//炮弹与敌人的碰撞检测
void GamePlayLayer::handleBulletCollidingWithEnemy(Enemy* enemy)
{
	enemy->setHitPoints(enemy->getHitPoints() - 1);

	if (enemy->getHitPoints() <= 0) {
		//爆炸和音效
		Node *node = this->getChildByTag(GameSceneNodeTagExplosionParticleSystem);
		if (node) {
			this->removeChild(node);
		}
		ParticleSystem *explosion = ParticleSystemQuad::create("particle/explosion.plist");
		explosion->setPosition(enemy->getPosition());
		this->addChild(explosion, 2, GameSceneNodeTagExplosionParticleSystem);
		if (UserDefault::getInstance()->getBoolForKey(SOUND_KEY)) {
			SimpleAudioEngine::getInstance()->playEffect(sound_2);
		}

		switch (enemy->getEnemyType()) {
		case EnemyTypeStone:
			score += EnemyStone_Score;
			scorePlaceholder += EnemyStone_Score;
			break;
		case EnemyTypeEnemy1:
			score += Enemy1_Score;
			scorePlaceholder += Enemy1_Score;
			break;
		case EnemyTypeEnemy2:
			score += Enemy2_Score;
			scorePlaceholder += Enemy2_Score;
			break;
		case EnemyTypePlanet:
			score += EnemyPlanet_Score;
			scorePlaceholder += EnemyPlanet_Score;
			break;
		}
		//每次获得1000分数，生命值 加一，scorePlaceholder恢复0.
		if (scorePlaceholder >= 1000) {
			fighter->setHitPoints(fighter->getHitPoints() + 1);
			this->updateStatusBarFighter();
			scorePlaceholder -= 1000;
		}

		this->updateStatusBarScore();
		//设置敌人消失
		enemy->setVisible(false);
		enemy->spawn();
	}

}
