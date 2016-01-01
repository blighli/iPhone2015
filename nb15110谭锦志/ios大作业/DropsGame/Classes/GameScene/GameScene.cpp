#include "GameScene.h"
#include "../Entity/Drop.h"
#include "../Entity/DropBulet.h"

#include "LoseLayer.h"
#include "WinLayer.h"
#include "DarkLayer.h"
#include "../Audio/Audio.h"

extern Vector<DropBullet*> m_DropBulletList;
extern bool m_HaveExplode;	// have explode : 避免产生时间间隙，提前结束计数

int minInt(int a, int b)
{
	return a > b ? b : a;
}

void GameScene::set_tank_fore_height(int number)
{
	if (number == 0)
	{
		tank_fore_top->setVisible(false);
	}
	else if (number == 1)
	{
		tank_fore_top->setVisible(true);
		tank_fore_top->setScaleX(0.7 * 0.0907); // 0.0907 是csb文件中tank_fore_top的X放缩比例
	}
	else if (number == 2)
	{
		tank_fore_top->setVisible(true);
		tank_fore_top->setScaleX(0.9 * 0.0907);
	}
	else {
		tank_fore_top->setScaleX(1.0 * 0.0907);
		tank_fore_top->setVisible(true);
	}
	
	
	number = minInt(number, 20); // 限制高度 水滴数量不限制
	auto tmp = tank_fore->getTextureRect();
	tank_fore->setTextureRect(Rect(0, 620 - number / 20.0 * 620, 230, number / 20.0 * 620));
	tank_fore_top->setPositionY(tank_fore->getPositionY() + number / 20.0 * 620 * 0.3);  // 0.3为csb文件中tank_fore的Y放缩比例
}

// 增加分数
void GameScene::addPoints(int point)
{
	int p = atoi(DataUtils::read(GameScore).c_str());
	DataUtils::save(GameScore, StringUtils::format("%d", p + point));
	score->setString(DataUtils::read(GameScore));
}

bool GameScene::init(GameMode mode, int level)
{
	if (!Layer::init())
	{
		return false;
	}
	// init game scene here

	m_SetDown = false;
	m_SoundDown = false;
	m_Gamemode = mode;
	m_Click = false;
	m_DropCount = 0;
	m_HaveExplode = false;

	Node* rootNode = NULL;
	switch (mode)
	{
	case Classical:
		rootNode = CSLoader::createNode("game-classical.csb");
		for (int i = 0;i < 6;i++)
		{
			for (int j = 0;j < 6;j++)
			{
				auto path = StringUtils::format("pos_%d_%d", i + 1,j + 1);
				m_ClassicalPos[i][j] = rootNode->getChildByName(path)->getPosition();
			}
		}
		break;
	case Extreme:
		rootNode = CSLoader::createNode("game-extream.csb");
		for (int i = 0;i < 5;i++)
		{
			for (int j = 0;j < 3;j++)
			{
				// grid position L
				auto path = StringUtils::format("gridl_%d_%d", i + 1, j + 1);
				m_ExtreamPosL[i][j] = rootNode->getChildByName(path)->getPosition();
			}
		}
		for (int i = 0;i < 5;i++)
		{
			for (int j = 0;j < 3;j++)
			{
				// grid position R
				auto path = StringUtils::format("gridr_%d_%d", i + 1, j + 1);
				m_ExtreamPosR[i][j] = rootNode->getChildByName("game-layer")->getChildByName(path)->getPosition();
			}
		}
		m_ExtreamCenter = rootNode->getChildByName("game-layer")->getChildByName("grid_center")->getPosition();
		break;
	}
	if (rootNode == NULL)
	{
		log("game scene file GameScene.csb load error!");
		return false;
	}
	addChild(rootNode);

	// load action
	action = CSLoader::createTimeline("game-classical.csb");
    action->setTag(11110);
	rootNode->runAction(action);

	// run action by frame
	action->gotoFrameAndPlay(0, 6, true);

	// get button 
	btn_set = static_cast<Button*>(rootNode->getChildByName("btn-set"));
	btn_restart = static_cast<Button*>(rootNode->getChildByName("btn-restart"));
	btn_about = static_cast<Button*>(rootNode->getChildByName("btn-about"));
	btn_sound = static_cast<Button*>(rootNode->getChildByName("btn-sound"));

	// set button event
	btn_set->addTouchEventListener(CC_CALLBACK_2(GameScene::btn_set_callback, this));
	btn_about->addTouchEventListener(CC_CALLBACK_2(GameScene::btn_about_callback, this));
	btn_restart->addTouchEventListener(CC_CALLBACK_2(GameScene::btn_restart_callback, this));
	btn_sound->addTouchEventListener(CC_CALLBACK_2(GameScene::btn_sound_callback, this));

	btn_bg = static_cast<Sprite*>(rootNode->getChildByName("btn-bg"));
	btn_nosound = static_cast<Sprite*>(rootNode->getChildByName("no_sound"));
	btn_bg->setVisible(false);     // default visible : false
	btn_about->setVisible(false);
	btn_restart->setVisible(false);
	btn_sound->setVisible(false);
	btn_nosound->setVisible(false);

	TextBMFont* game_time = static_cast<TextBMFont*>(rootNode->getChildByName("game-time")); // game time
    game_time->setVisible(false);
	TextBMFont* top_round = static_cast<TextBMFont*>(rootNode->getChildByName("top-round")); // game record 

	// game layer
	Node* game_layer = rootNode->getChildByName("game-layer");
	drops = static_cast<TextBMFont*>(game_layer->getChildByName("drops"));
	round = static_cast<TextBMFont*>(game_layer->getChildByName("round"));
	score = static_cast<TextBMFont*>(game_layer->getChildByName("score"));
	game_type = static_cast<TextBMFont*>(game_layer->getChildByName("game-type"));

	// 更新top round
	auto top = atoi(DataUtils::read(TopLevel).c_str());
	if (level > top)
	{
		DataUtils::save(TopLevel, StringUtils::format("%d", level));
	}
	top_round->setString(StringUtils::format("%d", atoi(DataUtils::read(TopLevel).c_str())));

	// 更新当前level
	DataUtils::save(GameLevel, StringUtils::format("%d", level));

	// 更新round
	round->setString(StringUtils::format("%d", level));

	// 更新score
	if (level == 1)
	{
		score->setString("0");
		DataUtils::save(GameScore, "0"); // 更新每局初始分数
	}
	else {
		score->setString(DataUtils::read(GameScore)); // 显示前面关卡已积累分数
	}

	// Rect classical
	if (mode == GameMode::Classical)
	{
		Node* bound_left = rootNode->getChildByName("bound_left");
		Node* bound_right = rootNode->getChildByName("bound_right");
		m_GridBoundClassical = Rect(bound_left->getPositionX(), bound_left->getPositionY(),
			bound_right->getPositionX() - bound_left->getPositionX(),
			bound_right->getPositionY() - bound_left->getPositionY());
	}

	// Extreme 检测边界
	if (mode == GameMode::Extreme)
	{
		Node* bound_left_down = rootNode->getChildByName("bound_left_down");
		Node* bound_left_top = rootNode->getChildByName("bound_left_top");
		Node* bound_right_center = rootNode->getChildByName("bound_right_center");
		Node* bound_right_top = rootNode->getChildByName("bound_right_top");
		//Node* bound_left_center = rootNode->getChildByName("bound_left_center");

		m_GridBoundExtreamL = Rect(bound_left_down->getPositionX(), bound_left_down->getPositionY(), 
			bound_left_top->getPositionX() - bound_left_down->getPositionX(), 
			bound_left_top->getPositionY() - bound_left_down->getPositionY());
		m_GridBoundExtreamR = Rect(bound_right_center->getPositionX(), bound_left_down->getPositionY(),
			bound_right_top->getPositionX() - bound_right_center->getPositionX(),
			bound_right_top->getPositionY() - bound_left_down->getPositionY());
	}

	//////////////////////////////////////////////////////////////////////////
    auto game_info = DataUtils::game_info("data/game.config");
	
	// add objects
	switch (mode)
	{
	case Classical:  // classical game
		{
			if (level > game_info.max_classical_level)
			{
				return false;
			}
			// 加载当前等级的场景数据
			auto data = DataUtils::read(StringUtils::format("data/level%d.lev", level).c_str()); // load game level : level
			DropsType type = DropsType::Drops_one;
			for (int i = 0; i < 6; i++)
			{
				for (int j = 0; j < 6; j++)
				{
					int tmp = rand_0_1() * 100 / 1;
					if (tmp < data.zero)
					{
						type = DropsType::Drops_zero;
					}else if(tmp < data.one) {
						type = DropsType::Drops_one;
					} else if (tmp < data.two)
					{
						type = DropsType::Drops_two;
					} else if (tmp < data.three)
					{
						type = DropsType::Drops_three;
					} else {
						type = DropsType::Drops_four;
					}

					if (type == DropsType::Drops_zero){
						continue;
					}
					auto drop = Drop::createSprite(m_ClassicalPos[i][j], type);
					m_DropList.pushBack(drop);
				}
			}

			// 加载初始水箱储蓄量
			tank_fore = static_cast<Sprite*>(game_layer->getChildByName("tank-fore"));
			tank_fore_top = static_cast<Sprite*>(game_layer->getChildByName("tank-fore-top"));
			set_tank_fore_height(game_info.init_tank_drops);
			drops->setString(StringUtils::format("%02d", game_info.init_tank_drops)); // 更新水箱显示数值

			if (level == 1) // 第一关初始化水滴数量
			{
				DataUtils::save(GameDrops, StringUtils::format("%d", game_info.init_tank_drops));
			}
			else {
				drops->setString(DataUtils::read(GameDrops));
				set_tank_fore_height(atoi(DataUtils::read(GameDrops).c_str()));
			}

			// 更改游戏模式label
			game_type->setString("Classical");
		}
		break;
	case Extreme:  // extream game
		{
			auto test = Drop::createSprite(m_ExtreamPosL[2][2], DropsType::Drops_one);
			m_DropList.pushBack(test);

			// 更改游戏模式label
			//game_type->setText("Extreme");
		}
		break;
	}
	
	// show all objects
	for (int i = 0;i < m_DropList.size();i++)
	{
		this->addChild(m_DropList.at(i), 2);
	}

	// add touch event
	auto event = EventListenerTouchOneByOne::create();
	event->onTouchBegan = [&](Touch * tou, Event * eve) {
		return true;
	};
	event->onTouchMoved = [&](Touch * tou, Event * eve) {

	};
	event->onTouchEnded = [&](Touch * tou, Event * eve) {
		if (m_SetDown)
		{
			m_SetDown = false;
			btn_nosound->setVisible(false);
			btn_bg->setVisible(false);     // default visible : false
			btn_about->setVisible(false);
			btn_restart->setVisible(false);
			btn_sound->setVisible(false);
		}
		if (!m_Click)
		{
			auto location = tou->getLocation();

			// update all drops
			for (int i = 0;i < m_DropList.size();i++)
			{
				auto rect = m_DropList.at(i)->getRect();
				if (location.x > rect.getMinX() && location.x < rect.getMaxX() && location.y > rect.getMinY() && location.y < rect.getMaxY())
				{
					if (m_DropList.at(i)->getState() != Drops_four)
					{
						m_DropList.at(i)->setState((enum DropsType)(m_DropList.at(i)->getState() + 1));  // upgrade drops
					}
					else
					{
						m_Click = true;		  // 连击判断开始
						m_CoundBegin = false; // 判断计数开始点
						m_DropDeleteList.pushBack(m_DropList.at(i));  // add to delete list
					}
					// 减少水箱水滴 - classical mode
                    auto num = atoi(DataUtils::read(GameDrops).c_str());
                    DataUtils::save(GameDrops, StringUtils::format("%d", num - 1)); // 减少
                    if (atoi(DataUtils::read(GameDrops).c_str()) > -1)
                    {
                        drops->setString(DataUtils::read(GameDrops));
                    }
                    // 更新水箱高度
                    set_tank_fore_height(atoi(DataUtils::read(GameDrops).c_str()));

					// extreme mode
				}
			}
		}
	};
	Director::getInstance()->getEventDispatcher()->addEventListenerWithSceneGraphPriority(event, this);

	this->scheduleUpdate();  // update game

	return true;
}

Scene* GameScene::createScene(GameMode mode, int level)
{
	auto scene = Scene::create();
	auto layer = GameScene::create(mode, level);
	scene->addChild(layer);
	return scene;
}

// override create func
GameScene* GameScene::create(GameMode mode, int level)
{
	GameScene *pRet = new(std::nothrow) GameScene();
	if (pRet && pRet->init(mode, level))
	{
		pRet->autorelease();
		return pRet;
	}
	else
	{
		delete pRet;
		pRet = nullptr;
		return nullptr;
	}
}

void GameScene::update(float delta)
{
	//////////////////////////////Classocal mode////////////////////////////////////////////
	switch (m_Gamemode)
	{
	case GameMode::Classical:
		{
			// add bullet to bulletDeleteList
			for (int i = 0;i < m_DropBulletList.size();i++)
			{
				auto bullet = (DropBullet*)m_DropBulletList.at(i);
				if ((bullet->getPositionX() <= m_GridBoundClassical.getMinX()) |
					(bullet->getPositionX() >= m_GridBoundClassical.getMaxX()) |
					(bullet->getPositionY() <= m_GridBoundClassical.getMinY()) |
					(bullet->getPositionY() >= m_GridBoundClassical.getMaxY()))
				{
					m_BulletDeleteList.pushBack(bullet);
				}
				for (int j = 0;j < m_DropList.size();j++)
				{
					auto drop = (Drop*)m_DropList.at(j);
					if ((drop->isAlive()) && (!drop->m_IsAtacking) && (drop->getPosition() - bullet->getPosition()).length() <= (drop->getR() + bullet->getR()))
					{
						// bullet attack drop
						drop->m_IsAtacking = true;  // avoide upgrade to explode
						if (drop->getState() != Drops_four)
						{
							drop->setState((enum DropsType)(drop->getState() + 1));  // upgrade drops
							m_BulletCombineList.pushBack(bullet); // add bullet to combine list 
						}
						else
						{
							m_HaveExplode = true;  // 控制爆炸直到产生bullet之间的间隙
							m_DropDeleteList.pushBack(drop);      // add drop to delete list
							m_BulletCombineList.pushBack(bullet); // add bullet to combine list 
						}
					}
				}
			}
		}
		break;
	case GameMode::Extreme:
		{
			// add bullet to bulletDeleteList
			for (int i = 0;i < m_DropBulletList.size();i++)
			{
				auto bullet = (DropBullet*)m_DropBulletList.at(i);
				if ((bullet->getPositionX() < m_GridBoundExtreamL.getMinX()) |
					(bullet->getPositionX() > m_GridBoundExtreamR.getMaxX()) |
					(bullet->getPositionY() < m_GridBoundExtreamL.getMinY()) |
					(bullet->getPositionY() > m_GridBoundExtreamL.getMaxY()) |
					(bullet->getPositionX() < m_ExtreamCenter.x && 
						((bullet->getPositionY() > m_ExtreamCenter.y )| (bullet->getPositionY() < m_ExtreamCenter.y)) 
						&& (bullet->getPositionX() > m_GridBoundExtreamL.getMaxX())) |
					(bullet->getPositionX() > m_ExtreamCenter.x &&
						((bullet->getPositionY() > m_ExtreamCenter.y) | (bullet->getPositionY() < m_ExtreamCenter.y))
						&& bullet->getPositionX() < m_GridBoundExtreamL.getMinX()))
				{
					m_BulletDeleteList.pushBack(bullet);
				}

				// bullet and drops 
				for (int j = 0;j < m_DropList.size();j++)
				{
					auto drop = (Drop*)m_DropList.at(j);
					if ((drop->isAlive()) && (!drop->m_IsAtacking) && (drop->getPosition() - bullet->getPosition()).length() <= (drop->getR() + bullet->getR()))
					{
						// bullet attack drop
						drop->m_IsAtacking = true;  // avoide upgrade to explode
						if (drop->getState() != Drops_four)
						{
							drop->setState((enum DropsType)(drop->getState() + 1));  // upgrade drops
							m_BulletCombineList.pushBack(bullet); // add bullet to combine list 
						}
						else
						{
							m_DropDeleteList.pushBack(drop);      // add drop to delete list
							m_BulletCombineList.pushBack(bullet); // add bullet to combine list 
						}
					}
				}
			}
		}
		break;
	}
	/////////////////////////////////all mode/////////////////////////////////////////
	// update DropList and DropDeleteList
	for (int i = 0;i < m_DropDeleteList.size(); i++)
	{
		auto obj = (Drop*)m_DropDeleteList.at(i);
		addPoints(2);  // 水滴爆炸+2分
		obj->blast();
		m_DropCount++; // 计数器增加
		m_DropDeleteList.eraseObject(obj);
		m_DropList.eraseObject(obj);
	}

	// update bullet delete list
	for (int i = 0;i < m_BulletDeleteList.size();i++)
	{
		auto bullet = (DropBullet*)m_BulletDeleteList.at(i);
		bullet->blast();
		m_BulletDeleteList.eraseObject(bullet);
		m_DropBulletList.eraseObject(bullet);
	}

	// update combine list
	for (int i = 0;i < m_BulletCombineList.size();i++)
	{
		auto bullet = (DropBullet*)m_BulletCombineList.at(i);
		addPoints(1); // 水滴结合+1分
		bullet->combine();
		m_BulletCombineList.eraseObject(bullet);
		m_DropBulletList.eraseObject(bullet);
	}

	// 判断输赢
	if (atoi(DataUtils::read(GameDrops).c_str()) == 0 && m_BulletDeleteList.size() == 0 && m_BulletCombineList.size() == 0 && m_DropBulletList.size() == 0)
	{
		// 输
		gameLose();
		unscheduleUpdate();
	}

	if ((!m_Click) && m_DropList.size() == 0 && m_DropBulletList.size() == 0 && m_BulletDeleteList.size() == 0)
	{
		if (atoi(DataUtils::read(GameDrops).c_str()) >= 0)
		{
			// 赢
			gameWin();
			unscheduleUpdate();
		}
	}

	if ((m_CoundBegin == false) && m_Click && m_DropBulletList.size() > 0)
	{
		m_CoundBegin = true; // 开始计数
		m_DropCount = 0;	 // 计数器清零
		m_upInt = 1;		 // 计数器跟踪器，避免多次执行水滴递增操作
	}

	if (m_CoundBegin)
	{
		if (m_DropCount == m_upInt)
		{
			log("-----------%d----------", m_DropCount);
			if (m_DropCount % 2 == 0)
			{
				// 增加水箱水滴
				int drop = atoi(DataUtils::read(GameDrops).c_str());
				DataUtils::save(GameDrops, StringUtils::format("%d", drop + 1));
				set_tank_fore_height(drop + 1);						 // 水滴图片增高
				drops->setString(StringUtils::format("%d", drop + 1)); // 水滴数字增加 1
				log("=====%d=====", drop + 1);
			}
			m_upInt++;
		}
	}

	// bug 有几率提前结束计数：恰巧水滴碰撞爆炸产生新水滴之前的一段时间符合判断条件 < 原因：combine同时出现时，产生此现象 
	// <已解决： 设置m_HaveExplode控制这个小时间间隙不进行判断并结束计数
	if (m_CoundBegin && (!m_HaveExplode) && m_DropBulletList.size() == 0 && m_BulletCombineList.size() == 0 && m_BulletDeleteList.size() == 0)
	{
		// 结束计数
		m_CoundBegin = false;
		m_Click = false;
	}
}

void GameScene::layer_back(Ref* pSender)
{
    Layer* layer = (Layer*)pSender;
    layer->runAction(Sequence::create(ScaleTo::create(0.3, 2.0f), MoveTo::create(0.4, Vec2(1536, 1300)), NULL));
    //layer->setPosition(1536, 1200);
    //layer->setScale(2.0f);
}

void GameScene::gameLose()
{
    action->pause(); // pause action of game scene
	Audio::play_effect("audio/fail.wav");
	auto dark = DarkLayer::create();
	auto lose = LoseLayer::createLayer();
    lose->setScale(2.0f);
	lose->setPosition(1536, 1200);
    lose->setAnchorPoint(Vec2(0.5, 0.5));
    lose->runAction(Sequence::create(MoveBy::create(0.8, Vec2(0, 100)), MoveBy::create(0.5, Vec2(0, -100)),
                                    NULL));
    //lose->runAction(Sequence::create(ScaleBy::create(0.5, 1.2), ScaleBy::create(0.3, 0.5),ScaleBy::create(0.5, 1.2),
    //                                CallFunc::create(CC_CALLBACK_0(GameScene::layer_back, this, lose)), NULL));
    this->addChild(dark, 5);
	this->addChild(lose, 6);
}

void GameScene::gameWin()
{
    action->pause(); // pause action of game scene
	Audio::play_effect("audio/win.wav");
	auto dark = DarkLayer::create();
	auto win = WinLayer::createLayer();
	win->setScale(2.0f);
	win->setPosition(1536, 1200);
    win->setAnchorPoint(Vec2(0.5, 0.5));
    win->runAction(Sequence::create(MoveBy::create(0.8, Vec2(0, 100)), MoveBy::create(0.5, Vec2(0, -100)),
                                    NULL));
    //win->runAction(Sequence::create(ScaleBy::create(0.4, 1.2), ScaleBy::create(0.2, 0.5), ScaleBy::create(0.5, 1.2),
                                    //CallFunc::create(CC_CALLBACK_0(GameScene::layer_back, this, win)), NULL));
	this->addChild(dark, 5);
	this->addChild(win, 6);
}

void GameScene::btn_set_callback(Ref* pSender, Widget::TouchEventType type)
{
	if (type == Widget::TouchEventType::ENDED)
	{
        Audio::play_effect("audio/button.wav");
		m_SetDown = !m_SetDown;
		if (m_SetDown)
		{
			if (m_SoundDown)
			{
				btn_nosound->setVisible(true);
			}
			btn_bg->setVisible(true);
			btn_about->setVisible(true);
			btn_restart->setVisible(true);
			btn_sound->setVisible(true);
		}
		else
		{
			btn_nosound->setVisible(false);
			btn_bg->setVisible(false);     // default visible : false
			btn_about->setVisible(false);
			btn_restart->setVisible(false);
			btn_sound->setVisible(false);
		}
	}
}

void GameScene::btn_restart_callback(Ref* pSender, Widget::TouchEventType type)
{
	if (type == Widget::TouchEventType::ENDED)
	{
        Audio::play_effect("audio/button.wav");
		// restart game scene
		if (m_Gamemode == GameMode::Classical)
		{
			Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, GameScene::createScene(GameMode::Classical, 1)));
		}
		else {
			Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, GameScene::createScene(GameMode::Extreme, 1)));
		}
	}
}

// sound btn callback
void GameScene::btn_sound_callback(Ref* pSender, Widget::TouchEventType type)
{
	if (type == Widget::TouchEventType::ENDED)
	{
        Audio::play_effect("audio/button.wav");
		m_SoundDown = !m_SoundDown;
		if (m_SoundDown)
		{
			btn_nosound->setVisible(true);
			// stop sound
			Audio::pause(); // 声音暂停
		}
		else {
			btn_nosound->setVisible(false);
			// resume sound
			Audio::resume(); // 声音恢复
		}
	}
}

void GameScene::btn_about_callback(Ref* pSender, Widget::TouchEventType type)
{
	if (type == Widget::TouchEventType::ENDED)
	{
        Audio::play_effect("audio/button.wav");
	}
}