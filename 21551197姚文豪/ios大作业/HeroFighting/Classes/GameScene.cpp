#include "GameScene.h"
#include "extensions/cocos-ext.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "GameTiledMap.h"
#include "GameConfig.h"
#include "MainScene.h"
#include "SimpleAudioEngine.h"


USING_NS_CC;
using namespace std;
using namespace cocostudio::timeline;
using namespace cocos2d::ui;
using namespace CocosDenshion;

GameScene::GameScene() : m_gameMap(nullptr), m_player(nullptr), m_voidNode(nullptr), m_winSize(0, 0), m_winXLeft(0), m_winXRight(0)
{

}

GameScene::~GameScene()
{
	SimpleAudioEngine::end();
}

Scene* GameScene::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = GameScene::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool GameScene::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}
	m_winSize = Director::getInstance()->getVisibleSize();
	m_winXLeft = 0;
	m_winXRight = m_winSize.width;
	m_voidNode = ParallaxNode::create();
	addChild(m_voidNode, -1);
	auto pNode = Node::create();
	pNode->setName("pNode");//map, player, tauren's parent
	m_voidNode->addChild(pNode, 0, Vec2(1, 0), Vec2(0, 0));//in ParallaxNode, we can't change the child's positon

	m_gameMap = GameTiledMap::createGameMap(1);
	//addChild(m_gameMap, GAMEMAP_ZORDER);
	//m_voidNode->addChild(m_gameMap, GAMEMAP_ZORDER,Vec2(1,0),Vec2(0,0));
	pNode->addChild(m_gameMap, GAMEMAP_ZORDER);
	

	auto object = m_gameMap->getTiledMap()->getObjectGroup("objects");
	auto playerObject = object->getObject("player");
	auto playerX = playerObject.at("x").asFloat();
	auto playerY = playerObject.at("y").asFloat();

	m_player = Player::createPlayer();
	m_player->setPosition(Vec2(playerX, playerY));
	m_skillCD = PLAYER_SKILL_CD;
	//addChild(m_playerNode, PLAYER_ZORDER);
	//m_voidNode->addChild(m_playerNode, PLAYER_ZORDER,Vec2(1,0),Vec2(playerX,playerY));
	////////pNode->addChild(m_player, PLAYER_ZORDER);

	m_roleManager = RoleManager::create();
	m_roleManager->bindMap(m_gameMap);
	m_roleManager->bindPlayer(m_player);
	m_roleManager->addChild(m_player);//add m_player as child
	m_player->setOrderOfArrival(PLAYER_LOCAL_ZORDER);
	m_roleManager->initMonster();
	pNode->addChild(m_roleManager, ROLEMANAGER_ZORDER);

	auto dirLayout = CSLoader::createNode("DirectionScene.csb");
	dirLayout->setAnchorPoint(Vec2(0.5, 0.5));
	dirLayout->setPosition(m_winSize.width / 4, 60);
	dirLayout->setName("dirLayout");
	addChild(dirLayout);

	auto skillLayout = CSLoader::createNode("SkillScene.csb");
	skillLayout->setAnchorPoint(Vec2(0.5,0.5));
	skillLayout->setPosition(m_winSize.width / 4 * 3, 60);
	skillLayout->setName("skillLayout");
	addChild(skillLayout);

	auto btnUp = static_cast<Button *>(dirLayout->getChildByName("BtnUp"));
	auto btnDown = static_cast<Button *>(dirLayout->getChildByName("BtnDown"));
	auto btnLeft = static_cast<Button *>(dirLayout->getChildByName("BtnLeft"));
	auto btnRight = static_cast<Button *>(dirLayout->getChildByName("BtnRight"));

	auto btnAttack = static_cast<Button *>(skillLayout->getChildByName("BtnAttack"));
	auto btnSkill = static_cast<Button *>(skillLayout->getChildByName("BtnSkill"));

	btnUp->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnDirection,this,"up"));
	btnDown->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnDirection, this, "down"));
	btnLeft->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnDirection, this, "left"));
	btnRight->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnDirection, this, "right"));
	btnAttack->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnAttack, this));
	btnSkill->addTouchEventListener(CC_CALLBACK_2(GameScene::onBtnSkill, this));

	auto playerHPState = CSLoader::createNode("PlayerHP.csb");
	m_playerHP = static_cast<LoadingBar*>(playerHPState->getChildByName("LoadingBar_hp"));
	playerHPState->setAnchorPoint(Vec2(0.5f, 0.5f));
	playerHPState->setPosition(m_winSize.width/6, m_winSize.height - 50);
	m_playerHP->setPercent(100);
	addChild(playerHPState);
	m_roleManager->bindPlayerHP(m_playerHP);

	m_isPlayBkgMusic = UserDefault::getInstance()->getBoolForKey("BkgMusic");

	if (m_isPlayBkgMusic)
	{
		SimpleAudioEngine::getInstance()->playBackgroundMusic("background.mp3", true);
	}

	NotificationCenter::getInstance()->addObserver(this, callfuncO_selector(GameScene::onReducePlayerLife), MSG_PLAYER_DIE, nullptr);
	NotificationCenter::getInstance()->addObserver(this, callfuncO_selector(GameScene::onGameWin), MSG_GAME_WIN, nullptr);
	NotificationCenter::getInstance()->addObserver(this, callfuncO_selector(GameScene::onBossCome), MSG_BOSS_COME, nullptr);
	scheduleUpdate();
	return true;
}

void GameScene::update(float delta)
{
	//move map
	if (m_player->getDir() == DIRECTION_RIGHT){
		auto playerPos = m_player->getPosition();
		float mapMoveDistance = m_winSize.width - MAP_MOVE_EDGE;
		if (playerPos.x >= (-m_voidNode->getPosition().x + mapMoveDistance)){
			if (m_gameMap->getMapWidth() < -m_voidNode->getPosition().x + 2*mapMoveDistance)// judge the map is move to the end
			{
				return;//beyond the map then not move map
			}
			unscheduleUpdate();//when the voidNode run action completely, start update
			auto moveBy = MoveBy::create(MAP_MOVE_SPEED_BY_TIME, Vec2(-mapMoveDistance, 0));
			auto callFun = CallFunc::create([&](){scheduleUpdate(); });
			auto seqAction = Sequence::create(moveBy, callFun, nullptr);
			m_voidNode->runAction(seqAction);
			m_winXLeft += mapMoveDistance;
			m_winXRight += mapMoveDistance;
		}
	}
}

void GameScene::onBtnDirection(Ref* sender, Widget::TouchEventType type, string dir)
{
	auto playerPos = m_player->getPosition();
	float time = 0.0;
	Vec2 destPos;
	//when move left or right, the player's direction will be change if direction is opposite
	if ("up" == dir){
		time = (m_winSize.height - playerPos.y)*PLAYER_SPEED_BY_TIME;
		destPos = Vec2(playerPos.x, m_winSize.height);
		m_player->setDir(DIRECTION_UP);
	}
	else if ("down" == dir)
	{
		time = playerPos.y*PLAYER_SPEED_BY_TIME;
		destPos = Vec2(playerPos.x, 0);
		m_player->setDir(DIRECTION_DOWN);
	}
	else if ("left" == dir)
	{
		if (m_player->getDir() != DIRECTION_LEFT)
		{
			m_player->setRotationY(180);
		}
		time = (playerPos.x - m_winXLeft)*PLAYER_SPEED_BY_TIME;
		destPos = Vec2(m_winXLeft, playerPos.y);
		m_player->setDir(DIRECTION_LEFT);//control the face direction
	}
	else if ("right" == dir)
	{
		if (m_player->getDir() != DIRECTION_RIGHT)
		{
			m_player->setRotationY(0);
		}
		/*time = (m_winXRight - playerPos.x)*PLAYER_SPEED_BY_TIME;
		destPos = Vec2(m_winXRight, playerPos.y);*/
		auto playerX = m_gameMap->getMapWidth() - MAP_MOVE_EDGE;
		time = (playerX - playerPos.x)*PLAYER_SPEED_BY_TIME;
		destPos = Vec2(playerX, playerPos.y);
		m_player->setDir(DIRECTION_RIGHT);

		////move map
		//float mapMoveDistance = m_winSize.width - 30;
		//if (playerPos.x >= (-m_voidNode->getPosition().x + mapMoveDistance)){
		//	if (m_gameMap->getPosition().x + m_gameMap->getTileSize().width * m_gameMap->getMapSize().width < -m_voidNode->getPosition().x + 2*mapMoveDistance)// judge the map is move to the end
		//	{
		//		return;//beyond the map then not move map
		//	}
		//	m_voidNode->runAction(MoveBy::create(MAP_MOVE_SPEED_BY_TIME, Vec2(-mapMoveDistance, 0)));
		//	m_winXLeft += mapMoveDistance;
		//	m_winXRight += mapMoveDistance;
		//}
	}

	switch (type)
	{
	case Widget::TouchEventType::BEGAN:
	{
							  m_player->run();//in this fun, the node will stop all actions
							  auto moveTo = MoveTo::create(time, destPos);
							  moveTo->setTag(PLAYER_MOVE_TAG);
							  m_player->runAction(moveTo);
							  break;
	}
	case Widget::TouchEventType::CANCELED:
	case Widget::TouchEventType::ENDED:
	{
							  auto func = CallFunc::create(CC_CALLBACK_0(GameScene::onMoveDone, this));
							  m_player->runAction(func);
							  break;
	}
	default:
		break;
	}
}

void GameScene::onBtnAttack(Ref* sender, Widget::TouchEventType type)
{
	switch (type)
	{
	case Widget::TouchEventType::BEGAN:
		m_player->attack();//this function will stop all actions
		break;
	case Widget::TouchEventType::CANCELED:
	case Widget::TouchEventType::ENDED:
		//complete the whole action 
		//////m_player->completeLastAttack();
		break;
	default:
		break;
	}
}

void GameScene::onBtnSkill(Ref* sender, Widget::TouchEventType type)
{
	switch (type)
	{
	case Widget::TouchEventType::BEGAN:
		if (!m_player->isSkillCD())
		{
			m_skillCD = PLAYER_SKILL_CD;
			this->scheduleOnce(SEL_SCHEDULE(&GameScene::updateSkillCD), PLAYER_SKILL_CD);
			this->schedule(SEL_SCHEDULE(&GameScene::updateCDTime), 1.0f, CC_REPEAT_FOREVER, 0.01);
			m_player->skill();
		}
		break;
	default:
		break;
	}
}

void GameScene::onMoveDone()
{
	m_player->stopActionByTag(PLAYER_MOVE_TAG);
	m_player->stand();

}

void GameScene::updateSkillCD(float dt)
{
	m_player->setSkillCD(false);
	this->unschedule(SEL_SCHEDULE(&GameScene::updateCDTime));
	auto skillLayout = getChildByName("skillLayout");
	auto skillButton = static_cast<Button*>(skillLayout->getChildByName("BtnSkill"));
	skillButton->setTitleText("");
	skillButton->setEnabled(true);
}

void GameScene::updateCDTime(float dt)
{
	auto skillLayout = getChildByName("skillLayout");
	auto skillButton = static_cast<Button*>(skillLayout->getChildByName("BtnSkill"));
	skillButton->setEnabled(false);
	skillButton->setTitleText(Value(m_skillCD).asString());
	skillButton->setTitleFontSize(30);
	skillButton->setTitleColor(cocos2d::Color3B::RED);

	m_skillCD--;
}

void GameScene::onReducePlayerLife(Ref* ref)
{
	if (m_player->getLife() <= 0){//game over
		auto loseSprite = Sprite::create("lose.png");
		loseSprite->setAnchorPoint(Vec2(0.5f, 0.5f));
		loseSprite->setPosition(Vec2(m_winSize.width/2, m_winSize.height/2));

		auto buttonBack = Button::create();
		buttonBack->setColor(Color3B::WHITE);
		buttonBack->setTitleText("back");
		buttonBack->setContentSize(Size(100,50));
		buttonBack->setTitleFontSize(20);
		buttonBack->setTitleColor(Color3B::BLUE);
		buttonBack->setAnchorPoint(Vec2(0.5f,0.5f));
		buttonBack->setPosition(Vec2(loseSprite->getPositionX(), loseSprite->getPositionY() - loseSprite->getContentSize().height/2 -10));
		buttonBack->addClickEventListener([&](Ref*){Director::getInstance()->replaceScene(TransitionPageTurn::create(1.0f, MainScene::createScene(), true)); });

		addChild(loseSprite);
		addChild(buttonBack);

		getChildByName("dirLayout")->setVisible(false);
		getChildByName("skillLayout")->setVisible(false);

		m_player->pause();
		m_roleManager->pause();
		this->pause();
	}
}

void GameScene::onGameWin(Ref* ref)
{
	auto winSprite = Sprite::create("win.png");
	winSprite->setAnchorPoint(Vec2(0.5f, 0.5f));
	winSprite->setPosition(Vec2(m_winSize.width / 2, m_winSize.height / 2));

	auto buttonBack = Button::create();
	buttonBack->setColor(Color3B::WHITE);
	buttonBack->setTitleText("back");
	buttonBack->setContentSize(Size(100, 50));
	buttonBack->setTitleFontSize(20);
	buttonBack->setTitleColor(Color3B::BLUE);
	buttonBack->setAnchorPoint(Vec2(0.5f, 0.5f));
	buttonBack->setPosition(Vec2(winSprite->getPositionX(), winSprite->getPositionY() - winSprite->getContentSize().height / 2 - 10));
	buttonBack->addClickEventListener([&](Ref*){Director::getInstance()->replaceScene(TransitionPageTurn::create(1.0f, MainScene::createScene(), true)); });

	addChild(winSprite);
	addChild(buttonBack);

	getChildByName("dirLayout")->setVisible(false);
	getChildByName("skillLayout")->setVisible(false);

	m_player->pause();
	m_roleManager->pause();
	this->pause();
	
}

void GameScene::onBossCome(Ref* ref)
{
	auto fontLabel = Label::create();
	fontLabel->setString("Boss is coming!");
	fontLabel->setSystemFontSize(40);
	fontLabel->setTextColor(Color4B::RED);
	fontLabel->setAnchorPoint(Vec2(0.5, 0.5));
	fontLabel->setPosition(Vec2(m_winSize.width/2, m_winSize.height/2));
	fontLabel->setName("fontLabel");

	addChild(fontLabel);

	scheduleOnce(SEL_SCHEDULE(&GameScene::updateBossComeInfor), 2.0f);
}

void GameScene::updateBossComeInfor(float dt)
{
	removeChildByName("fontLabel");
}