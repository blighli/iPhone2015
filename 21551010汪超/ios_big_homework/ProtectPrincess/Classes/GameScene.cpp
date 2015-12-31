#include "GameScene.h"

using namespace std;
static int monsterCount = 5;//√ø“ª≤®≥ˆœ÷∂‡…Ÿ÷ªπ÷ŒÔ
static int _currentLevel = 1;//µ±«∞πÿø®
Scene* GameScene::createSceneWithLevel(int selectLevel)
{
	_currentLevel = selectLevel;
	auto scene = Scene::create();
	auto layer = GameScene::create();
	scene->addChild(layer);
	return scene;
}

bool GameScene::init()
{
	if (!Layer::init())
	{
		return false;
	}
    SimpleAudioEngine::getInstance()->playBackgroundMusic("sound/background.wav",true);
    SimpleAudioEngine::getInstance()->setBackgroundMusicVolume(0.5f);
	Size visibleSize = Director::getInstance()->getVisibleSize();
	_visibleWidth = visibleSize.width;
	_visibleHeight = visibleSize.height;
	LoadData();

	/*œ‘ æ≤® ˝°¢µ±«∞≤® ˝°¢Ω«Æµƒ–≈œ¢*/
	_currNumLabel = Label::createWithSystemFont("1", "Arial", 32);
	_currNumLabel->setColor(Color3B::RED);
	_currNumLabel->setPosition(_visibleWidth*0.45,_visibleHeight*0.96);
	_tileMap->addChild(_currNumLabel,2);
	_numberLabel = Label::createWithSystemFont(StringUtils::format("/%dMonsters", _number), "Arial", 32);
	_numberLabel->setColor(Color3B::BLUE);
	_numberLabel->setPosition(_visibleWidth*0.55, _visibleHeight*0.96);
	_tileMap->addChild(_numberLabel, 2);
	auto gold = Sprite::createWithSpriteFrameName("gold.png");
	gold->setPosition(50,_visibleHeight*0.96);
    _tileMap->addChild(gold,2);
	initMoney=200+(_currentLevel-1)*50;
	std::string CinitMoney = String::createWithFormat("%d", initMoney)->getCString();
	_goldLabel = Label::createWithSystemFont(CinitMoney, "Arial", 32);
	_goldLabel->setColor(Color3B::RED);
	_goldLabel->setPosition(100,_visibleHeight*0.96);
	_tileMap->addChild(_goldLabel,2);

	/*ªÒ»°π´÷˜µƒŒª÷√*/
	auto princess = _tileMap->getObjectGroup("princessObject");
	ValueMap princessMap = princess->getObject("princess");
	princessX = princessMap.at("x").asInt();
	princessY = princessMap.at("y").asInt();
	princessLocation = Vec2(princessX,princessY);

	/*º”»Î—°œÓøÚ*/
	option_box = Sprite::create("selected.png");
	auto listener = EventListenerTouchOneByOne::create();
	option_box->setPosition(Vec2(_visibleWidth-option_box->getContentSize().width/2,_visibleHeight-option_box->getContentSize().height/2));
	this->addChild(option_box, 2);
	auto _turret = Sprite::create("bollte.png");
	_turret->setPosition(Vec2(_visibleWidth - option_box->getContentSize().width / 8*7, _visibleHeight - option_box->getContentSize().height / 2));
	_tileMap->addChild(_turret, 3);
	listener->onTouchBegan = [=](Touch* touch, Event* event){
		Rect _turretRect = _turret->getBoundingBox();
		if (_turretRect.containsPoint(touch->getLocation()))
		{
			_transparentTurret = Sprite::create("bollte_big_transparent.png");
			_transparentTurret->setPosition(Vec2(_visibleWidth - option_box->getContentSize().width / 8 * 7, _visibleHeight - option_box->getContentSize().height / 2));
			this->addChild(_transparentTurret, 3);
			return true;
		}
		return false;
	};
	listener->onTouchMoved = [&](Touch* touch, Event* event)
	{
		auto addPoint = touch->getLocation() - touch->getPreviousLocation();
		_transparentTurret->setPosition(_transparentTurret->getPosition() + addPoint);
	};
	listener->onTouchEnded = [&](Touch* touch,Event* event)
	{
		auto location = touch->getLocation();
		auto _position = tileCoordForPosition(location);
		auto _newPosition = locationForTilePos(_position);
		auto _newturret = Turret::create("bollte.png");
		bool _isCollision=false;
		_newturret->setPosition(_newPosition);
		_newturret->setScale(1.7);
		_newturret->setVisible(false);
		this->addChild(_newturret, 3);
		if (_turretVector.size()==0)
		{
			if (!this->getCollidable(_newPosition))
			{
				_newturret->setVisible(true);
				_turretVector.pushBack(_newturret);
				this->removeChild(_transparentTurret);
				m_fScore -= 100.0f;
			}
			else
			{
				this->removeChild(_newturret);
				this->removeChild(_transparentTurret);
                SimpleAudioEngine::getInstance()->playEffect("sound/error.wav");
				//_sound->playEffect(EFFECT_TYPE_ERROR);
			}
		}
		else
		{
			for (int i = 0; i < _turretVector.size(); i++)
			{
				auto temp = _turretVector.at(i);
				auto rect = temp->getBoundingBox();
				rect.size.width = 32;
				rect.size.height = 32;
				auto rect1 = _newturret->getBoundingBox();
				rect1.size.width = 32;
				rect1.size.height = 32;
				if (rect.intersectsRect(rect1) || m_fScore<100 || this->getCollidable(_newPosition))
				{
					this->removeChild(_newturret);
					this->removeChild(_transparentTurret);
                    SimpleAudioEngine::getInstance()->playEffect("sound/error.wav");
					//_sound->playEffect(EFFECT_TYPE_ERROR);
					_isCollision = true;
					break;
				}
			}
			if (_isCollision==false)
			{
				m_fScore -= 100.0f;
				_goldLabel->setString(String::createWithFormat("%.0f", m_fScore)->getCString());
				_newturret->setVisible(true);
				_turretVector.pushBack(_newturret);
				this->removeChild(_transparentTurret);
			}
		}
	};
	_eventDispatcher->addEventListenerWithSceneGraphPriority(listener, _turret);
	return true;
}

cocos2d::Vec2 GameScene::locationForTilePos(Vec2 pos)
{
	int x = (int)(pos.x*(_tileMap->getTileSize().width/CC_CONTENT_SCALE_FACTOR()));
	float pointHeight = _tileMap->getTileSize().height / CC_CONTENT_SCALE_FACTOR();
	int y = (int)((_tileMap->getMapSize().height*pointHeight)-(pos.y*pointHeight));
	return Point(x,y);
}

cocos2d::Vec2 GameScene::tileCoordForPosition(Vec2 position)//Ω´∆¡ƒª◊¯±Í◊™ªªŒ™µÿÕº◊¯±Í
{
	int x = (int)(position.x/(_tileMap->getTileSize().width/CC_CONTENT_SCALE_FACTOR()));
	float pointHeight = _tileMap->getTileSize().height / CC_CONTENT_SCALE_FACTOR();
	int y = (int)((_tileMap->getMapSize().height*pointHeight-position.y)/pointHeight);
	return Vec2(x,y);
}

GameScene::GameScene()
{
	m_fScore = 200.0+(_currentLevel-1)*50;
}

GameScene::~GameScene()
{

}

void GameScene::onEnterTransitionDidFinish()
{
	Layer::onEnterTransitionDidFinish();
	Size visibleSize = Director::getInstance()->getVisibleSize();
	_label1 = Label::createWithBMFont("fonts/bitmapFontChinese.fnt", "1");
	_label1->setScale(2);
	_label1->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2));
	_label1->setTag(1);
	_label1->setVisible(false);
	this->addChild(_label1, 2);
	_label2 = Label::createWithBMFont("fonts/bitmapFontChinese.fnt", "2");
	_label2->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2));
	_label2->setScale(2);
	_label2->setTag(2);
	_label2->setVisible(false);
	this->addChild(_label2, 2);
	_label3 = Label::createWithBMFont("fonts/bitmapFontChinese.fnt", "3");
	_label3->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2));
	_label3->setTag(3);
	_label3->setScale(2);
	_label3->setVisible(false);
	this->addChild(_label3, 2);
	auto countdown = Sequence::create(
		CallFunc::create([&]{
		_label3->setVisible(true);
	}), DelayTime::create(1),
		CallFunc::create([&]{
		this->removeChildByTag(3);
	}), CallFunc::create([&]{
		_label2->setVisible(true);
	}), DelayTime::create(1),
		CallFunc::create([&]{
		this->removeChildByTag(2);
	}), CallFunc::create([&]{
		_label1->setVisible(true);
	}), DelayTime::create(1),
		CallFunc::create([&]{
		this->removeChildByTag(1);
		scheduleUpdate();
		this->schedule(schedule_selector(GameScene::updateMonster));
		this->schedule(schedule_selector(GameScene::updateDistance),0.5f);
		this->schedule(schedule_selector(GameScene::isCollision));
	}), NULL);
	this->runAction(countdown);
	//monsterMoveWithWayPoints(_pathPoints, _monster);
}

void GameScene::update(float dt)
{
	_count++;
	_goldLabel->setString(String::createWithFormat("%.0f", m_fScore)->getCString());
	_currNumLabel->setString(String::createWithFormat("%d", _currNum)->getCString());
	for (int j = 0; j < _monsterVector.size(); j++)
	{
		Rect _monsterRect = _monsterVector.at(j)->getBoundingBox();
		_monsterRect.size.width = 91;
		_monsterRect.size.height = 127;
		if (_monsterRect.containsPoint(princessLocation))
		{
			this->stopAllActions();
			this->unscheduleUpdate();
			this->unschedule(schedule_selector(GameScene::isCollision));
			this->unschedule(schedule_selector(GameScene::updateDistance));
			this->unschedule(schedule_selector(GameScene::updateMonster));
			GameOver* layer = GameOver::create();
			layer->setContentSize(CCSizeMake(200, 160));
			layer->setPosition(Vec2(_visibleWidth / 8, _visibleHeight / 8));
			this->addChild(layer, 4);
            SimpleAudioEngine::getInstance()->stopBackgroundMusic();
			//_sound->stopMusic();
		}
	}
}

void GameScene::LoadData()
{
	rapidjson::Document document;
	std::string filePath = FileUtils::getInstance()->fullPathForFilename(StringUtils::format("json/%d.data", _currentLevel));
	std::string contentStr = FileUtils::getInstance()->getStringFromFile(filePath);
	document.Parse<0>(contentStr.c_str());
	_tileName = document["tileFile"].GetString();
	_number = document["number"].GetInt();
	_delivery = 150;
	_currentCount = 0;
	_currNum = 1;
	_goldValue = 200;
	_tileMap = TMXTiledMap::create(_tileName);
	_tileMap->setAnchorPoint(Vec2::ZERO);
	_tileMap->setPosition(Vec2::ZERO);
	this->addChild(_tileMap, 1);
	_collidable = _tileMap->getLayer("collidable");
	_collidable->setVisible(false);
	const rapidjson::Value& monsterArray = document["monsters"];
	for (int i = 0; i < monsterArray.Size(); i++)
	{
		std::string name = monsterArray[i]["name"].GetString();
		int lifeValue = monsterArray[i]["lifeValue"].GetInt();
		int gold = monsterArray[i]["gold"].GetInt();
		auto monsterData = MonsterData::create();
		monsterData->setName(name);
		monsterData->setLifeValue(lifeValue);
		monsterData->setGold(gold);
		_monsterDatas.pushBack(monsterData);
	}
	const rapidjson::Value& turretArray = document["turrets"];
	for (int i = 0; i < turretArray.Size(); i++)
	{
		std::string name = turretArray[i]["name"].GetString();
		int gold = turretArray[i]["gold"].GetInt();
		std::string bulletName = turretArray[i]["bulletName"].GetString();
		auto turretData = TurretData::create();
		turretData->setName(name);
		turretData->setGold(gold);
		turretData->setBulletName(bulletName);
		_turretDatas.pushBack(turretData);
	}
	const rapidjson::Value& pathArray = document["path"];
	for (int i = 0; i < pathArray.Size(); i++)
	{
		int x = pathArray[i]["x"].GetInt();
		int y = pathArray[i]["y"].GetInt();
		Vec2 tilePoint = Vec2(x, y);
		Vec2 locationPoint = locationForTilePos(tilePoint);
		auto pointDelegate = PointDelegate::create(locationPoint.x, locationPoint.y);
		_pathPoints.pushBack(pointDelegate);
	}
	auto princess = _tileMap->getObjectGroup("princessObject");
	ValueMap princessValueMap = princess->getObject("princess");
	int princessX = princessValueMap.at("x").asInt();
	int princessY = princessValueMap.at("y").asInt();
	_princess = Sprite::createWithSpriteFrameName("princess.png");
	_princess->setPosition(princessX, princessY);
	_tileMap->addChild(_princess, 2);
}

void GameScene::monsterMoveWithWayPoints(Vector<PointDelegate*>pathVector, Monster* monster)
{
	Vector<FiniteTimeAction*>actionVector;
	for (int i = 0; i < pathVector.size();i++)
	{
		PointDelegate* pd = pathVector.at(i);
		Vec2 glPoint = Vec2(pd->getX(),pd->getY());
		MoveTo* moveTo = MoveTo::create(0.3f,glPoint);
		actionVector.pushBack(moveTo);
	}
	monster->runAnimation(1.0 / 5.0f, 5, animationName);
	auto callfunc = CallFunc::create([=]{
	monster->stopAnimation();
	});
	actionVector.pushBack(callfunc);
auto sequence = Sequence::create(actionVector);
	monster->runAction(sequence);
}

bool GameScene::getCollidable(Vec2 position)
{
	Vec2 tilePos = tileCoordForPosition(position);
	int tileGid = _collidable->getTileGIDAt(tilePos);
	if (tileGid)
	{
		Value properties = _tileMap->getPropertiesForGID(tileGid);
		ValueMap map = properties.asValueMap();
		std::string value = map.at("collidable").asString();
		if (value.compare("true")==0)
		{
			return true;
		}
	}
	return false;
}

void GameScene::updateMonster(float delta)
{
	if (!_isFinish)
	{
		if (_count%_delivery==0)
		{
			_currentCount++;
			if (_currentCount>monsterCount)
			{
				_number -= 1;
				if (_number==0)
				{
					_isFinish = true;
				}
				else
				{
					_currentCount = 0;
					_delivery -= 12;
					_currNum += 1;
				}
			}
			else
			{
				auto pestObject = _tileMap->getObjectGroup("monsterObject");
				ValueMap pestValueMap = pestObject->getObject("monster");
				int pestX = pestValueMap.at("x").asInt();
				int pestY = pestValueMap.at("y").asInt();
				int lifeValue = 100 + (_currentLevel - 1) * 30 + (_currNum - 1) * 60 * ((_currentLevel - 1)*0.5 + 1);
				if (_currentLevel==1)
				{
					monster = Monster::create("bird.png");
					animationName ="bird";
				}
				else if (_currentLevel == 2)
				{
					monster = Monster::create("pest.png");
					animationName = "pest";
				}
				else
				{
					monster = Monster::create("nessie.png");
					animationName = "nessie";
				}
				monster->setHPInterval(lifeValue);
				monster->setMonsterLifeValue(lifeValue);
				monster->setPosition(pestX, pestY);
				_tileMap->addChild(monster, 2);
				_monsterVector.pushBack(monster);
				monster->setScale(0.7);
				monsterMoveWithWayPoints(_pathPoints, monster);
			}
		}
	}
	else
	{
		if (_monsterVector.size()<=0)
		{
			if (_currentLevel!=3)
			{
				Director::getInstance()->replaceScene(TransitionFadeUp::create(1.0f,GameScene::createSceneWithLevel(_currentLevel+1)));
			}
			else
			{
				Director::getInstance()->replaceScene(TransitionFadeUp::create(1.0f, LevelManager::createScene()));
			}
		}
	}
}

void GameScene::updateDistance(float dt)
{
	for (int i = 0; i < _turretVector.size(); i++)
	{
		auto _turretTemp = _turretVector.at(i);
		auto _turretLocation = _turretTemp->getPosition();
		for (int j = 0; j < _monsterVector.size();j++)
		{
			auto _monsterLocation = _monsterVector.at(j)->getPosition();
			bool _judgeDistance = calDistance(_turretLocation, _monsterLocation,_degree);
			if (_judgeDistance&&_turretTemp->getBullet()==NULL)
			{
				_turretTemp->setRotation(_degree);
				auto _bullet = Bullet::create();
				_turretTemp->setBullet(_bullet);
				//_bullet->setVisible(true);
                _bullet->retain();
				_bullet->setPosition(_turretLocation);
				_bullet->setShoot(true);
				_tileMap->addChild(_bullet, 4);
				_bulletVector.pushBack(_bullet);
                auto moveby = MoveTo::create(0.2f, _monsterLocation + Vec2(35, 0));
                /*auto remove = CallFunc::create([&](){
                    RemoveSelf(_bullet);
                });
                _bullet->runAction(Sequence::create(moveby,remove,NULL));*/

				_bullet->runAction(moveby);
				//_sound->playEffect(EFFECT_TYPE_BULLET);
			} 
			else if (_judgeDistance && !(_turretTemp->getBullet()->getShoot()))
			{
				_turretTemp->setRotation(_degree);
				auto _bullet = _turretTemp->getBullet();
				_bullet->setPosition(_turretLocation);
				//_bullet->setVisible(true);
                _bullet->retain();
				_bullet->setShoot(true);
				_tileMap->addChild(_bullet, 4);
				_bulletVector.pushBack(_bullet);
				auto moveby = MoveTo::create(0.2f, _monsterLocation + Vec2(35, 0));
				/*auto remove = CallFunc::create([&](){
					RemoveSelf(_bullet);
				});
				_bullet->runAction(Sequence::create(moveby,remove,NULL));*/
                _bullet->runAction(moveby);
				//_sound->playEffect(EFFECT_TYPE_BULLET);
			}
		}
	}
}

bool GameScene::calDistance(Vec2 turretLocation, Vec2 monsterLocation, float & _degree)
{
	float offsetX = turretLocation.x - monsterLocation.x;
	float offsetY = turretLocation.y - monsterLocation.y;
	float dis = offsetX*offsetX + offsetY*offsetY;
	if (dis <= 8000)
	{
		float radian = atan2f(offsetX, offsetY);
		 _degree = 180+CC_RADIANS_TO_DEGREES(radian);
		return true;
	}
	return false;
}

void GameScene::isCollision(float dt)
{
	for (int i = 0; i < _monsterVector.size();i++)
	{
		auto Smonster = _monsterVector.at(i);
		Rect monsterRect = _monsterVector.at(i)->getBoundingBox();
		monsterRect.size.width = 91;
		monsterRect.size.height = 127;
		for (int j = 0; j < _bulletVector.size();j++)
		{
            auto _bullet=_bulletVector.at(j);
			Rect bulletRect = _bullet->getBoundingBox();
			bulletRect.size.width = 24;
			bulletRect.size.height = 24;
			if (monsterRect.intersectsRect(bulletRect))
			{
                SimpleAudioEngine::getInstance()->playEffect("sound/bullet.wav");
				float hp=Smonster->getHPInterval()-30;
				if (hp<=0)
				{
					_tileMap->removeChild(Smonster);
					_monsterVector.eraseObject(Smonster);
					m_fScore += 50;
				}
				else
				{
					Smonster->setHPInterval(hp);
				}				
				_bullet->setShoot(false);
                //_bulletVector.at(j)->setVisible(false);
				_tileMap->removeChild(_bullet);
				_bulletVector.eraseObject(_bullet);
			}
            else if(_bullet->getNumberOfRunningActions()==0)
            {
                _bullet->setShoot(false);
                _tileMap->removeChild(_bullet);
                _bulletVector.eraseObject(_bullet);
            }
		}
	}
}

