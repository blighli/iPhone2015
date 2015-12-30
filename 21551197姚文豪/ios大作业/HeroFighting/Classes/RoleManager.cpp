#include "RoleManager.h"
#include "GameTiledMap.h"
#include "Monster.h"
#include "player.h"
#include "GameConfig.h"

USING_NS_CC;

using namespace cocostudio::timeline;
using namespace cocos2d::ui;

RoleManager::RoleManager() : m_boss(nullptr), m_bindMap(nullptr), m_bindPlayer(nullptr), m_bindPlayerHP(nullptr)
{

}

RoleManager::~RoleManager()
{
}

bool RoleManager::init()
{
	int monsterShowNum = MONSTER_MAX_SHOW_NUM;
	m_monstersAliveNum = MONSTER_MAX_SHOW_NUM;
	m_monsterKilledNum = 0;
	for (int i = 0; i < monsterShowNum;  i++)
	{
		auto mon = Monster::create();
		addChild(mon);

		m_monsters.pushBack(mon);
	}
	m_bindPlayer = nullptr;
	m_bindMap = nullptr;
	m_boss = Monster::create();
	m_boss->hide();

	addChild(m_boss);

	scheduleUpdate();//update func open
	
	NotificationCenter::getInstance()->addObserver(this, callfuncO_selector(RoleManager::monsterKilled), MSG_MONSTER_KILLED, nullptr);
	return true;
}

void RoleManager::initMonster()
{
	int i = MONSTER_LOACL_ZORDER;
	for (auto mon : m_monsters){
		initMonsterPos(mon);
		mon->setZOrder(-mon->getPosition().y);//y smaller, more in front
		mon->setOrderOfArrival(i--);
		//when init, let the monster run left and right
		auto moveDistance = RandomHelper::random_int(100, 1300);
		mon->runToRight(moveDistance);//run left and right
	}
	if (m_bindPlayer != nullptr){
		m_bindPlayer->setZOrder(-m_bindPlayer->getPosition().y);
	}
}

void RoleManager::initMonsterPos(Monster* monster)
{
	if (m_bindPlayer != nullptr){
		auto playerPosX = m_bindPlayer->getPosition();
		int winWidth = Director::getInstance()->getVisibleSize().width;
		auto rateX = RandomHelper::random_real(1.0, 1.5);
		auto rateY = RandomHelper::random_int(100, 300);
		float posX, posY;
		posY = rateY;
		switch (monster->getDir()){
		case DIRECTION_LEFT:
		{
							   posX = playerPosX.x + winWidth * rateX;
							   break;
		}
		//case DIRECTION_RIGHT:
		//{
		//						posX = playerPosX.x - winWidth * rateX;
		//						break;
		//}
		default:
		{
				   posX = playerPosX.x + winWidth * rateX;
				   break;
		}
		}
		monster->setPosition(posX, posY);
	}
}

void RoleManager::update(float delta)
{
	m_bindPlayer->setZOrder(-m_bindPlayer->getPosition().y);
	int monsterRealiveNum = 0;
	for (int i = 0; i < m_monsters.size(); i++){
		auto mon = m_monsters.at(i);
		if (mon->isAlive()){//if monster is alive
			updateMonster(mon);
			updatePlayer(mon);
		}
		else//if monster is dead
		{
			if (m_monstersAliveNum == 0)//all monsters died
			{
				monsterRealiveNum++;
				mon->resetData();
				initMonsterPos(mon);
				int length = RandomHelper::random_int(800, 1000);
				mon->runToLeft(length);
			}
			if (m_monsters.size() == MONSTER_MAX_SHOW_NUM + 1)//the monster change to the chase state when boss came out
			{
				mon->setState(ActionState::MONSTER_CHASE);
			}
		}
	}
	if (monsterRealiveNum != 0)
	{
		m_monstersAliveNum = monsterRealiveNum;
	}
}


void RoleManager::updateMonster(Monster* mon)
{
	mon->setZOrder(-mon->getPosition().y);
	//judge if the player is neer to the monster, if it is then move attack the player
	float difX = m_bindPlayer->getPosition().x - mon->getPosition().x;
	float difY = m_bindPlayer->getPosition().y - mon->getPosition().y;

	if (mon->isBoss())
	{
		updateBoss(mon);
		return;
	}

	auto monState = mon->getState();
	switch (monState)
	{
	case ActionState::RUN:
	{
							 if (abs(difX) < MONSTER_AUTO_ATTACK_DISTANCE && abs(difY) < MONSTER_AUTO_ATTACK_DISTANCE){
								 mon->setState(ActionState::MONSTER_CHASE);
							 }
							 break;
	}
	case ActionState::MONSTER_CHASE:
	{
									   mon->stopAllActionsByTag(MONSTER_RUN_L_R_TAG);
									   if (difX > MONSTER_PLAYER_X_DIFF - 50){
										   mon->setDir(DIRECTION_RIGHT);
										   mon->setRotationY(180);
										   mon->setPositionX(mon->getPositionX() + 1);
									   }
									   else if (difX < -MONSTER_PLAYER_X_DIFF)
									   {
										   mon->setDir(DIRECTION_LEFT);
										   mon->setRotationY(0);
										   mon->setPositionX(mon->getPositionX() - 1);
									   }
									   else if (mon->isAttackBehind() && difX < MONSTER_PLAYER_X_DIFF - 52)
									   {
										   mon->setDir(DIRECTION_LEFT);
										   mon->setRotationY(0);
										   mon->setPositionX(mon->getPositionX() - 1);
									   }
									   else if (difY > MONSTER_PLAYER_Y_DIFF){
										   if (mon->isAttackBehind())
										   {
											   mon->setRotationY(180);
										   }
										   mon->setPositionY(mon->getPositionY() + 1);
									   }
									   else if (difY < -MONSTER_PLAYER_Y_DIFF)
									   {
										   if (mon->isAttackBehind())
										   {
											   mon->setRotationY(180);
										   }
										   mon->setPositionY(mon->getPositionY() - 1);
									   }

									   if (abs(difX) <= MONSTER_PLAYER_X_DIFF && abs(difY) <= MONSTER_PLAYER_Y_DIFF){
										   //possible to attack or stand
										   int random = RandomHelper::random_int(0, 100);
										   if (random <= 5){
											   mon->stand();
										   }
										   else
										   {
											   //mon->setState(ActionState::ATTACK);
											   mon->attack();
										   }
									   }
									   break;
	}
	case ActionState::ATTACK:
	{
								//collision detect, detect the arms is if hit the player
								auto rect = mon->getWeaponRect();
								auto playerRect = m_bindPlayer->getEntityRect();

								/*removeChildByName("debug");
								auto drawDebug = DrawNode::create();
								drawDebug->setName("debug");
								addChild(drawDebug);
								drawDebug->setVisible(true);
								drawDebug->drawRect(rect.origin, Vec2(rect.getMaxX(), rect.getMaxY()), cocos2d::Color4F::BLUE);

								removeChildByName("playerDebug");
								auto drawDebug1 = DrawNode::create();
								drawDebug1->setName("playerDebug");
								addChild(drawDebug1);
								drawDebug1->setVisible(true);
								drawDebug1->drawRect(playerRect.origin, Vec2(playerRect.getMaxX(), playerRect.getMaxY()), cocos2d::Color4F::GREEN);*/

								if (!m_bindPlayer->isInvincible() && m_bindPlayer->getState() != ActionState::ATTACK && abs(mon->getPositionY() - m_bindPlayer->getPositionY()) < MONSTER_PLAYER_Y_DIFF && playerRect.intersectsRect(rect)){
									m_bindPlayer->endure();
									m_bindPlayer->reduceLife(mon->getAtk());
									m_bindPlayerHP->setPercent((float)m_bindPlayer->getLife() / PLAYER_MAX_LIFE * 100);

									/*switch (mon->getDir())
									{
									case DIRECTION_LEFT:
									{
									m_bindPlayer->setDir(DIRECTION_RIGHT);
									m_bindPlayer->setRotationY(0);
									auto moveBy = MoveBy::create(1, Vec2(-50, 0));
									moveBy->setTag(PLAYER_BACKWORD_TAG);
									m_bindPlayer->runAction(moveBy);
									break;
									}
									case DIRECTION_RIGHT:
									{
									m_bindPlayer->setDir(DIRECTION_LEFT);
									m_bindPlayer->setRotationY(180);
									auto moveBy = MoveBy::create(1, Vec2(50, 0));
									moveBy->setTag(PLAYER_BACKWORD_TAG);
									m_bindPlayer->runAction(moveBy);
									break;
									}
									default:
									break;
									}*/
								}

								if (abs(difX) > 2 * MONSTER_PLAYER_X_DIFF || abs(difY) > 3 * MONSTER_PLAYER_Y_DIFF){
									mon->run();
									mon->setState(ActionState::MONSTER_CHASE);
								}
								break;
	}
	case ActionState::STAND:
	{
							   if (abs(difX) > MONSTER_PLAYER_X_DIFF || abs(difY) > MONSTER_PLAYER_Y_DIFF){
								   //possible to run or chase
								   int random = RandomHelper::random_int(0, 100);
								   if (random <= 95){
									   mon->run();
									   mon->setState(ActionState::MONSTER_CHASE);
								   }
							   }
	}
	//case ActionState::ENDURE:
	//{
	//	/*mon->run();
	//	mon->setState(ActionState::MONSTER_CHASE);*/
	//	break;
	//}
	default:
		break;
	}
}

void RoleManager::updatePlayer(Monster* mon)
{
	auto playerState = m_bindPlayer->getState();
	switch (playerState)
	{
	case ActionState::RUN:
	{
							 //in run state, judge if the player collide with the barrier then stop moving
							 switch (m_bindPlayer->getDir())
							 {
							 case DIRECTION_LEFT:
								 if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX() - 20, m_bindPlayer->getPositionY())))
								 {
									 m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
								 }
								 break;
							 case DIRECTION_RIGHT:
								 if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX() + 20, m_bindPlayer->getPositionY())))
								 {
									 m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
								 }
								 break;
							 case DIRECTION_UP:
								 if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX(), m_bindPlayer->getPositionY() + 20)))
								 {
									 m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
								 }
								 break;
							 case DIRECTION_DOWN:
								 if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX(), m_bindPlayer->getPositionY() - 20)))
								 {
									 m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
								 }
								 break;
							 default:
								 break;
							 }
							 break;
	}
	case ActionState::ENDURE:
	{
								//in endrue state, the player stop backword when collide with barrier
								switch (m_bindPlayer->getDir())
								{
									//stop backword
								case DIRECTION_LEFT:
									if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX() + 1, m_bindPlayer->getPositionY())))
									{
										m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
									}
									break;
								case DIRECTION_RIGHT:
									if (m_bindMap->isCollidable(Vec2(m_bindPlayer->getPositionX() - 1, m_bindPlayer->getPositionY())))
									{
										m_bindPlayer->stopActionByTag(PLAYER_MOVE_TAG);
									}
									break;
								default:
									break;
								}
								break;
	}
	case ActionState::ATTACK:
	{
								//detect the player is if hit the monster
								auto playerRect = m_bindPlayer->getWeaponRect();
								auto monRect = mon->getEntityRect();

								/*removeChildByName("debug1");
								auto drawDebug = DrawNode::create();
								drawDebug->setName("debug1");
								addChild(drawDebug);
								drawDebug->setVisible(true);
								drawDebug->drawRect(monRect.origin, Vec2(monRect.getMaxX(), monRect.getMaxY()), cocos2d::Color4F::YELLOW);

								removeChildByName("playerDebug1");
								auto drawDebug1 = DrawNode::create();
								drawDebug1->setName("playerDebug1");
								addChild(drawDebug1);
								drawDebug1->setVisible(true);
								drawDebug1->drawRect(playerRect.origin, Vec2(playerRect.getMaxX(), playerRect.getMaxY()), cocos2d::Color4F::RED);*/

								if (!mon->isInvincible() && abs(mon->getPositionY() - m_bindPlayer->getPositionY()) < MONSTER_PLAYER_Y_DIFF && monRect.intersectsRect(playerRect)){
									mon->reduceLife(m_bindPlayer->getAtk());//if dead then run die func and not get endured effect

									if (!mon->isAlive()){
										m_monstersAliveNum--;
										m_monsterKilledNum++;
										break;
									}
									mon->endure();

									if (mon->isBoss())
									{
										auto boss = mon;
										auto direction = boss->getRotationY();
										MoveBy* moveBy = nullptr;
										if (direction == 0)//left
										{
											moveBy = MoveBy::create(1.0f, Vec2(100, 0));
										}
										else if (direction == 180)//right
										{
											moveBy = MoveBy::create(1.0f, Vec2(-100, 0));
										}
										auto callFun = CallFunc::create([&]()
										{
											m_boss->run();
											m_boss->setState(ActionState::MONSTER_CHASE);
										});
										auto seqAction = Sequence::create(moveBy, callFun, nullptr);
										boss->runAction(seqAction);
										boss->setState(ActionState::NONE);
									}
								}
								break;
	}
	case ActionState::PLAYER_SKILL:
	{
									  auto playerSkillRect = m_bindPlayer->getSkillRect();
									  auto monRect = mon->getEntityRect();

									  /*removeChildByName("debug2");
									  auto drawDebug = DrawNode::create();
									  drawDebug->setName("debug2");
									  addChild(drawDebug);
									  drawDebug->setVisible(true);
									  drawDebug->drawRect(monRect.origin, Vec2(monRect.getMaxX(), monRect.getMaxY()), cocos2d::Color4F::YELLOW);

									  removeChildByName("playerDebug2");
									  auto drawDebug1 = DrawNode::create();
									  drawDebug1->setName("playerDebug2");
									  addChild(drawDebug1);
									  drawDebug1->setVisible(true);
									  drawDebug1->drawRect(playerSkillRect.origin, Vec2(playerSkillRect.getMaxX(), playerSkillRect.getMaxY()), cocos2d::Color4F::RED);*/

									  if (!mon->isInvincible() && mon->getState() != ActionState::ENDURE && abs(m_bindPlayer->getPositionY() - mon->getPositionY()) < 20 && monRect.intersectsRect(playerSkillRect))
									  {
										  mon->reduceLife(m_bindPlayer->getAtk());//if dead then run die func and not get endured effect

										  if (!mon->isAlive()){
											  m_monstersAliveNum--;
											  m_monsterKilledNum++;
											  break;
										  }

										  mon->endure();

										  if (mon->isBoss())
										  {
											  auto boss = mon;
											  auto direction = boss->getRotationY();
											  MoveBy* moveBy = nullptr;
											  if (direction == 0)//left
											  {
												  moveBy = MoveBy::create(1.0f, Vec2(100, 0));
											  }
											  else if (direction == 180)//right
											  {
												  moveBy = MoveBy::create(1.0f, Vec2(-100, 0));
											  }
											  auto callFun = CallFunc::create([&]()
											  {
												  m_boss->run();
												  m_boss->setState(ActionState::MONSTER_CHASE);
											  });
											  auto seqAction = Sequence::create(moveBy, callFun, nullptr);
											  boss->runAction(seqAction);
											  boss->setState(ActionState::NONE);
										  }
									  
									  }
									  break;
	}
	default:
		break;
	}
}

void RoleManager::updateBoss(Monster* boss)
{
	float difX = m_bindPlayer->getPosition().x - boss->getPosition().x;
	float difY = m_bindPlayer->getPosition().y - boss->getPosition().y;

	auto bossState = boss->getState();
	switch (bossState)
	{
	case ActionState::RUN:
	{
							 if (abs(difX) < MONSTER_AUTO_ATTACK_DISTANCE && abs(difY) < MONSTER_AUTO_ATTACK_DISTANCE){
								 boss->setState(ActionState::MONSTER_CHASE);
							 }
							 break;
	}
	case ActionState::MONSTER_CHASE:
	{
									   boss->stopAllActionsByTag(MONSTER_RUN_L_R_TAG);
									   if (difY > MONSTER_PLAYER_Y_DIFF){
										   boss->setPositionY(boss->getPositionY() + 1);
									   }
									   else if (difY < -MONSTER_PLAYER_Y_DIFF)
									   {
										   boss->setPositionY(boss->getPositionY() - 1);
									   }
									   else if (difX > MONSTER_PLAYER_X_DIFF){
										   boss->setDir(DIRECTION_RIGHT);
										   boss->setRotationY(180);
										   boss->setPositionX(boss->getPositionX() + 2);
									   }
									   else if (difX < -MONSTER_PLAYER_X_DIFF)
									   {
										   boss->setDir(DIRECTION_LEFT);
										   boss->setRotationY(0);
										   boss->setPositionX(boss->getPositionX() - 2);
									   }

									   if (abs(difX) <= 1.3 * MONSTER_PLAYER_X_DIFF && abs(difY) <= MONSTER_PLAYER_Y_DIFF){
										   //possible to attack or stand
										   int random = RandomHelper::random_int(0, 100);
										   if (random <= 5){
											   boss->stand();
										   }
										   else
										   {
											   //boss->setState(ActionState::ATTACK);
											   boss->attack();
										   }
									   }
									   break;
	}
	case ActionState::ATTACK:
	{
								//collision detect, detect the arms is if hit the player
								auto rect = boss->getWeaponRect();
								auto playerRect = m_bindPlayer->getEntityRect();
								//boss weapon will be larger
								if (boss->getRotationY() == 0)//left
								{
									rect = Rect(rect.origin.x - 50, rect.origin.y, rect.size.width, rect.size.height);
								}
								else if (boss->getRotationY() == 180)//right
								{
									rect = Rect(rect.origin.x, rect.origin.y, rect.size.width + 70, rect.size.height);
								}

								/*removeChildByName("debug");
								auto drawDebug = DrawNode::create();
								drawDebug->setName("debug");
								addChild(drawDebug);
								drawDebug->setVisible(true);
								drawDebug->drawRect(rect.origin, Vec2(rect.getMaxX(), rect.getMaxY()), cocos2d::Color4F::BLUE);

								removeChildByName("playerDebug");
								auto drawDebug1 = DrawNode::create();
								drawDebug1->setName("playerDebug");
								addChild(drawDebug1);
								drawDebug1->setVisible(true);
								drawDebug1->drawRect(playerRect.origin, Vec2(playerRect.getMaxX(), playerRect.getMaxY()), cocos2d::Color4F::GREEN);*/

								if (!m_bindPlayer->isInvincible() && m_bindPlayer->getState() != ActionState::ATTACK && abs(boss->getPositionY() - m_bindPlayer->getPositionY()) < MONSTER_PLAYER_Y_DIFF && playerRect.intersectsRect(rect)){
									m_bindPlayer->endure();
									m_bindPlayer->reduceLife(boss->getAtk());
									m_bindPlayerHP->setPercent((float)m_bindPlayer->getLife() / PLAYER_MAX_LIFE * 100);

									/*switch (boss->getDir())
									{
									case DIRECTION_LEFT:
									{
									m_bindPlayer->setDir(DIRECTION_RIGHT);
									m_bindPlayer->setRotationY(0);
									auto moveBy = MoveBy::create(1, Vec2(-50, 0));
									moveBy->setTag(PLAYER_BACKWORD_TAG);
									m_bindPlayer->runAction(moveBy);
									break;
									}
									case DIRECTION_RIGHT:
									{
									m_bindPlayer->setDir(DIRECTION_LEFT);
									m_bindPlayer->setRotationY(180);
									auto moveBy = MoveBy::create(1, Vec2(50, 0));
									moveBy->setTag(PLAYER_BACKWORD_TAG);
									m_bindPlayer->runAction(moveBy);
									break;
									}
									default:
									break;
									}*/
								}

								if (abs(difX) > 2 * MONSTER_PLAYER_X_DIFF || abs(difY) > 3 * MONSTER_PLAYER_Y_DIFF){
									boss->run();
									boss->setState(ActionState::MONSTER_CHASE);
								}
								break;
	}
	case ActionState::STAND:
	{
							   if (abs(difX) > MONSTER_PLAYER_X_DIFF || abs(difY) > MONSTER_PLAYER_Y_DIFF){
								   //possible to run or chase
								   int random = RandomHelper::random_int(0, 100);
								   if (random <= 95){
									   boss->run();
									   boss->setState(ActionState::MONSTER_CHASE);
								   }
							   }
	}
	//case ActionState::ENDURE:
	//{
	//	auto direction = boss->getRotationY();
	//	MoveBy* moveBy = nullptr;
	//	if (direction == 0)//left
	//	{
	//		moveBy = MoveBy::create(1.0f, Vec2(100, 0));
	//	}
	//	else if (direction == 180)//right
	//	{
	//		moveBy = MoveBy::create(1.0f, Vec2(-100, 0));
	//	}
	//	auto callFun = CallFunc::create([&]()
	//	{
	//		m_boss->run();
	//		m_boss->setState(ActionState::MONSTER_CHASE);
	//	});
	//	auto seqAction = Sequence::create(moveBy, callFun, nullptr);
	//	boss->runAction(seqAction);
	//	boss->setState(ActionState::NONE);
	//	break;
	//}
	default:
		break;
	}
}

void RoleManager::bindPlayer(Player* newBindPlayer)
{
	if (m_bindPlayer != newBindPlayer){
		if (m_bindPlayer != nullptr){
			m_bindPlayer->release();
		}
		m_bindPlayer = newBindPlayer;
		newBindPlayer->retain();
	}
}

void RoleManager::bindMap(GameTiledMap* newBindMap)
{
	if (m_bindMap != newBindMap){
		if (m_bindMap != nullptr){
			m_bindMap->release();
		}
		m_bindMap = newBindMap;
		newBindMap->retain();
	}
}

void RoleManager::bindPlayerHP(cocos2d::ui::LoadingBar* newPlayerHP)
{
	if (m_bindPlayerHP != newPlayerHP){
		if (m_bindPlayerHP != nullptr){
			m_bindPlayerHP->release();
		}
		m_bindPlayerHP = newPlayerHP;
		newPlayerHP->retain();
	}
}

void RoleManager::monsterKilled(Ref* ref)
{
	//auto monster = dynamic_cast<Monster*>(ref);
	//if (monster->isBoss()){//game win
	//	NotificationCenter::getInstance()->postNotification("MSG_GAME_WIN");
	//}

	if (m_monsterKilledNum == BOSS_SHOW_MONSTER_KILL_NUM)
	{
		//notificate
		NotificationCenter::getInstance()->postNotification(MSG_BOSS_COME);

		m_boss->bossResetData();
		initMonsterPos(m_boss);
		m_boss->setState(ActionState::MONSTER_CHASE);
		m_monsters.pushBack(m_boss);
	}
}