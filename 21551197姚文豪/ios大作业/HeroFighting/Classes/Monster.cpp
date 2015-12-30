#include "Monster.h"
#include "ui/CocosGUI.h"
#include "GameConfig.h"

USING_NS_CC;

using namespace cocostudio::timeline;

Monster::Monster()
{

}

Monster::~Monster()
{

}

bool Monster::init()
{
	m_life = MONSTER_MAX_LIFE;
	m_atk = MONSTER_ATK;
	m_dir = DIRECTION_LEFT;
	m_state = ActionState::RUN;
	m_isInvincible = false;
	m_isAlive = true;
	m_isBoss = false;
	int randomInt = RandomHelper::random_int(1, 4);
	if (randomInt == 2)
	{
		m_isAttackBehind = true;
	}
	else
	{
		m_isAttackBehind = false;
	}

	////m_entityNode = CSLoader::createNode("TaurenScene.csb");
	m_entityNode = CSLoader::createNode("Tauren.csb");
	m_entityAction = CSLoader::createTimeline("Tauren.csb");
	m_entitySkeletonNode = static_cast<SkeletonNode*>(m_entityNode);

	m_entityNode->setAnchorPoint(Vec2(0.5, 0));
	m_entityNode->setPosition(0, 100);
	m_entityNode->setScale(0.8);
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(0, 24, true);
	m_entityAction->setTimeSpeed(0.3);
	this->addChild(m_entityNode);
	m_entityAction->retain();//not add child by gamescene,so retain
	//////m_entitySkeletonNode->retain();

	auto monsterHPState = CSLoader::createNode("MonsterHP.csb");
	m_monsterHP = static_cast<cocos2d::ui::LoadingBar*>(monsterHPState->getChildByName("hp"));
	m_monsterHP->setPercent(100);
	monsterHPState->setAnchorPoint(Vec2(0.5f, 0.5f));
	monsterHPState->setPosition(0, 170);
	monsterHPState->setScaleX(0.3);
	monsterHPState->setScaleY(0.5);
	monsterHPState->setName("HPState");
	addChild(monsterHPState);
	////hide();//hide when first init
	return true;
}

void Monster::stand()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::STAND;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(0, 24, true);
}

void Monster::run()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::RUN;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(25, 37, true);
}

void Monster::attack()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::ATTACK;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(38, 57, true);
}

void Monster::endure()
{
	if (!isAlive()){
		return;
	}
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::ENDURE;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(58, 66, false);

	m_isInvincible = true;//no die state, can't be attacked
	auto blink = Blink::create(1.0f, 5);
	auto callFun = CallFunc::create([&](){
		setVisible(true);
		setInvincible(false);
		stand();
	});
	auto seqAction = Sequence::create(blink, callFun, nullptr);
	runAction(seqAction);
}

void Monster::die()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::DIE;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(67, 99, false);

	m_isAlive = false;

	if (isBoss()){//game win
		NotificationCenter::getInstance()->postNotification(MSG_GAME_WIN);
	}
	else
	{
		NotificationCenter::getInstance()->postNotification(MSG_MONSTER_KILLED);
	}
	//NotificationCenter::getInstance()->postNotification(MSG_MONSTER_KILLED, static_cast<Ref*>(this));
}

void Monster::runToLeft(int length)
{
	m_dir = DIRECTION_LEFT;
	setRotationY(0);
	run();
	auto moveBy = MoveBy::create(length * MONSTER_SPEED_BY_TIME, Vec2(-length, 0));
	auto seqAction = Sequence::create(moveBy, CallFunc::create(CC_CALLBACK_0(Monster::runToRight, this, length)), nullptr);
	seqAction->setTag(MONSTER_RUN_L_R_TAG);
	runAction(seqAction);
}

void Monster::runToRight(int length)
{
	m_dir = DIRECTION_RIGHT;
	setRotationY(180);
	run();
	auto moveBy = MoveBy::create(length * MONSTER_SPEED_BY_TIME, Vec2(length, 0));
	auto seqAction = Sequence::create(moveBy, CallFunc::create(CC_CALLBACK_0(Monster::runToLeft, this, length)), nullptr);
	seqAction->setTag(MONSTER_RUN_L_R_TAG);
	runAction(seqAction);
}

//reset data but not alive
void Monster::resetData()
{
	m_life = MONSTER_MAX_LIFE;
	m_atk = MONSTER_ATK;
	m_state = ActionState::RUN;
	m_isInvincible = false;
	m_isAlive = true;
	m_monsterHP->setPercent(100);
	setVisible(true);

	int randomInt = RandomHelper::random_int(1, 4);
	if (randomInt == 2)
	{
		m_isAttackBehind = true;
	}
	else
	{
		m_isAttackBehind = false;
	}
	//m_dir = DIRECTION_LEFT;
	auto dir = RandomHelper::random_int(1, 2);
	switch (dir){
	case 1:
	{
			  m_dir = DIRECTION_LEFT;
			  setRotationY(0);
			  break;
	}
	case 2:
	{
			  m_dir = DIRECTION_RIGHT;
			  setRotationY(180);
			  break;
	}
	default:
	{
			   m_dir = DIRECTION_RIGHT;
			   setRotationY(180);
			   break;
	}
	}
	//m_isAlive = true;
}

void Monster::bossResetData()
{
	m_life = BOSS_MAX_LIFE;
	m_atk = BOSS_ATK;
	m_state = ActionState::MONSTER_CHASE;
	m_isInvincible = false;
	m_isAlive = true;
	m_isBoss = true;
	getChildByName("HPState")->setScaleX(0.8);
	setScale(1.5f);
	m_monsterHP->setPercent(100);
	setVisible(true);
	m_dir = DIRECTION_LEFT;
	setRotationY(0);
	run();
}

void Monster::show()
{
	m_isAlive = true;
	setVisible(true);
}

void Monster::hide()
{
	m_isAlive = false;
	setVisible(false);
}

const bool& Monster::isAlive() const
{
	return m_isAlive;
}

const bool& Monster::isBoss() const
{
	return m_isBoss;
}

const bool& Monster::isAttackBehind() const
{
	return m_isAttackBehind;
}

void Monster::reduceLife(int reducedLife)
{
	setLife(getLife() - reducedLife);

	//m_monsterHP->setPercent((float)m_life / MONSTER_MAX_LIFE * 100);

	if (isBoss()){
		m_monsterHP->setPercent((float)m_life / BOSS_MAX_LIFE * 100);
	}
	else
	{
		m_monsterHP->setPercent((float)m_life / MONSTER_MAX_LIFE * 100);
	}

	if (getLife() <= 0){
		die();
		auto delay = DelayTime::create(2.0f);
		auto callFun = CallFunc::create([&](){
			setVisible(false); });
		auto seqAction = Sequence::create(delay, callFun, nullptr);
		runAction(seqAction);
	}
}

Rect Monster::getWeaponRect()
{
	/*auto weaponBone = m_entitySkeletonNode->getBoneNode("ax");
	auto rect = weaponBone->getBoundingBox();
	return Rect(rect.getMinX() + 100, rect.getMinY(), rect.size.width - 100, rect.size.height);*/

	auto weaponHandeBone = m_entitySkeletonNode->getBoneNode("ax");
	auto rect = weaponHandeBone->getBoundingBox();
	//Vec2 leftbottom, righttop;
	//leftbottom.x = rect.getMinX(); leftbottom.y = rect.getMinY();
	//righttop.x = rect.getMaxX(); righttop.y = rect.getMaxY();
	/*cocos2d::Vec2 lefttop(rect.getMinX(), rect.getMaxY());
	cocos2d::Vec2 rightbottom(rect.getMaxX(), rect.getMinY());
	auto skeletonToP = m_entitySkeletonNode->getNodeToParentAffineTransform();
	auto bonePtoSkeletonPTrans = AffineTransformConcat(
	static_cast<BoneNode*>((weaponHandeBone->getParent())
	)->getNodeToParentAffineTransform(m_entitySkeletonNode),
	skeletonToP);
	leftbottom = PointApplyAffineTransform(leftbottom, bonePtoSkeletonPTrans);
	righttop = PointApplyAffineTransform(righttop, bonePtoSkeletonPTrans);
	lefttop = PointApplyAffineTransform(lefttop, bonePtoSkeletonPTrans);
	rightbottom = PointApplyAffineTransform(rightbottom, bonePtoSkeletonPTrans);
	rect = Rect(Vec2(lefttop.x, lefttop.y), Size(rightbottom.x - lefttop.x, lefttop.y - rightbottom.y));*/

	auto rotationY = getRotationY();
	if (rotationY == 0)//left
	{
		rect = Rect(getPositionX() + rect.origin.x + 50, getPositionY() + rect.origin.y, rect.size.width - 100, rect.size.height);
	}
	else if (rotationY == 180)//right
	{
		rect = Rect(getPositionX() + rect.origin.x + 50, getPositionY() + rect.origin.y, rect.size.width - 80, rect.size.height);
	}
	return rect;
	//return rect;
}

Rect Monster::getEntityRect()
{
	//auto rect = m_entitySkeletonNode->getBoundingBox();
	//auto rotationY = getRotationY();
	//if (rotationY == 0)//the monster is face to left. so when rotation y is zero, the monster is face to left.
	//{
	//	rect = Rect(getPositionX() + rect.origin.x + 70, getPositionY() + rect.origin.y, rect.size.width - 70, rect.size.height);
	//}
	//else if (rotationY == 180)
	//{
	//	rect = Rect(getPositionX() + rect.origin.x, getPositionY() + rect.origin.y, rect.size.width - 70, rect.size.height);
	//}
	//
	//return rect;

	auto headBone = m_entitySkeletonNode->getBoneNode("head");
	auto leftFootBone = m_entitySkeletonNode->getBoneNode("foot_left");
	auto rightFootBone = m_entitySkeletonNode->getBoneNode("foot_right");

	auto leftFootX1 = leftFootBone->getBoundingBox().getMinX();
	auto headX1 = headBone->getBoundingBox().getMinX();
	auto headX2 = headBone->getBoundingBox().getMaxX();
	auto rightFootX2 = rightFootBone->getBoundingBox().getMaxX();

	auto headY = headBone->getBoundingBox().getMaxY();
	auto footY = rightFootBone->getBoundingBox().getMinY();

	float leftBottomX = leftFootX1 < headX1 ? leftFootX1 : headX1;
	float leftBottomY = footY;
	float rightTopX = headX2 > rightFootX2 ? headX2 : rightFootX2;
	float rightTopY = headY;

	Rect rect;
	auto rotationY = getRotationY();
	if (rotationY == 0){//the monster is face to right. so rotation y is zero, the monster is face to right
		rect = Rect(getPositionX() + leftBottomX, getPositionY() + leftBottomY + 20, rightTopX - leftBottomX, rightTopY - leftBottomY + 80);
	}
	else if (rotationY == 180)
	{
		rect = Rect(getPositionX() + leftBottomX, getPositionY() + leftBottomY + 20, rightTopX - leftBottomX, rightTopY - leftBottomY + 80);
	}
	return rect;

}