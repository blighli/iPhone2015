#include "Player.h"
#include "GameConfig.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;

using namespace cocostudio;
using namespace cocostudio::timeline;
using namespace CocosDenshion;

Player::Player()
{
}

Player::~Player()
{
}

Player* Player::createPlayer()
{
	auto player = Player::create();
	return player;
}

bool Player::init()
{
	m_life = PLAYER_MAX_LIFE;
	m_atk = PLAYER_ATK;
	m_dir = DIRECTION_RIGHT;
	m_state = ActionState::STAND;
	m_isInvincible = false;
	m_isSkillCD = false;
	m_entityNode = CSLoader::createNode("Hero.csb");
	m_entityAction = CSLoader::createTimeline("Hero.csb");
	m_entitySkeletonNode = static_cast<SkeletonNode*>(m_entityNode);

	m_entityNode->setAnchorPoint(Vec2(0.5, 0));
	m_entityNode->setPosition(0, 0);
	m_entityNode->setScale(0.8);
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(0, 23,true);
	this->addChild(m_entityNode);
	m_entityAction->retain();//not add child by gamescene,so retain
	//////////m_entitySkeletonNode->retain();

	m_isPlayEffect = UserDefault::getInstance()->getBoolForKey("Effect");
	return true;
}

void Player::stand()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::STAND;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(0, 23, true);
}

void Player::run()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::RUN;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(24, 36, true);
}

void Player::attack()
{
	if (m_state == ActionState::ATTACK){
		return;
	}
	if (!isInvincible())
	{
		stopAllActions();
	}

	m_state = ActionState::ATTACK;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(37, 60, false);

	if (m_isPlayEffect){
		m_attackEffectId = SimpleAudioEngine::getInstance()->playEffect("player_attack.wav", false);
	}

	//change state to stand state when complete the attack 
	auto callFunc = CallFunc::create([&](){
		this->m_state = ActionState::STAND;
	});
	auto delayTime = DelayTime::create(ATTACK_DURATION);
	auto seqAction = Sequence::createWithTwoActions(delayTime, callFunc);
	runAction(seqAction);
}

//revise and not use
//complete the whole attack action
void Player::completeLastAttack()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::ATTACK;
	//stopAllActions();
	m_entityNode->stopAllActions();
	//m_entityAction->gotoFrameAndPause(60);
	m_entityAction->gotoFrameAndPlay(m_entityAction->getCurrentFrame(), 60, false);
	m_entityNode->runAction(m_entityAction);

	//////m_state = ActionState::STAND;
	auto callFunc = CallFunc::create([&](){
		this->m_state = ActionState::STAND;
	});
	auto delayTime = DelayTime::create(0.5f);
	auto seqAction = Sequence::createWithTwoActions(delayTime, callFunc);
	runAction(seqAction);

	//auto tempAction = m_entityAction->clone();
	//tempAction->gotoFrameAndPlay(0,23,true);
	//m_entityNode->runAction(tempAction);

	SimpleAudioEngine::getInstance()->stopEffect(m_attackEffectId);
}

void Player::endure()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::ENDURE;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(61, 66, false);

	m_isInvincible = true;//no die state, can't be attacked
	auto blink = Blink::create(1.0f, 5);
	auto callFun = CallFunc::create([&](){
		setVisible(true);
		setInvincible(false);
		stand();
	});
	auto seqAction = Sequence::create(blink, callFun, nullptr);
	runAction(seqAction);
	//auto moveBy = MoveBy::create(1.0, Vec2(-50, 0));
	//runAction(moveBy);
	if (m_isPlayEffect){
		SimpleAudioEngine::getInstance()->playEffect("player_endure.wav");
	}
}

void Player::die()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::DIE;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(67, 80, false);

	if (m_isPlayEffect){
		SimpleAudioEngine::getInstance()->playEffect("player_die.wav");
	}
	NotificationCenter::getInstance()->postNotification(MSG_PLAYER_DIE);
}

void Player::skill()
{
	if (!isInvincible())
	{
		stopAllActions();
	}
	m_state = ActionState::PLAYER_SKILL;
	m_isSkillCD = true;
	//stopAllActions();
	m_entityNode->stopAllActions();
	m_entityNode->runAction(m_entityAction);
	m_entityAction->gotoFrameAndPlay(81, 99, false);

	auto delayAction = DelayTime::create(1.2f);
	auto callFunc = CallFunc::create([&](){
		stand();
	});
	auto seqAction = Sequence::createWithTwoActions(delayAction, callFunc);
	runAction(seqAction);

	if (m_isPlayEffect){
		SimpleAudioEngine::getInstance()->playEffect("player_skill.wav");
	}
}

void Player::reduceLife(int reducedLife)
{
	//auto reduceLifeLabel = Label::create("-" + std::to_string(reducedLife), "roman", 10);
	//reduceLifeLabel->setName("reduceLife");
	//reduceLifeLabel->setPosition(Vec2(m_entityNode->getPositionX(), m_entityNode->getPositionY() + 60));
	//addChild(reduceLifeLabel, 1);
	//auto moveBy = MoveBy::create(1.0, Vec2(0, 50));
	//auto callFun = CallFunc::create([&](){removeChildByName("reduceLife"); });
	//auto seqAction = Sequence::create(moveBy, callFun, nullptr);
	//reduceLifeLabel->runAction(seqAction);

	setLife(getLife() - reducedLife);

	if (m_life <= 0){
		die();
	}

}

Rect Player::getWeaponRect()
{
	/*auto weaponBone = m_entitySkeletonNode->getBoneNode("Layer17");
	return weaponBone->getBoundingBox();*/

	auto weaponHandeBone = m_entitySkeletonNode->getBoneNode("Layer17");
	auto rect = weaponHandeBone->getBoundingBox();
	/*Vec2 leftbottom, righttop;
	leftbottom.x = rect.getMinX(); leftbottom.y = rect.getMinY();
	righttop.x = rect.getMaxX(); righttop.y = rect.getMaxY();
	cocos2d::Vec2 lefttop(rect.getMinX(), rect.getMaxY());
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
	return Rect(leftbottom, Size(righttop.x - leftbottom.x, righttop.y - leftbottom.y));*/
	auto rotationY = getRotationY();
	if (rotationY == 0)//right
	{
		rect = Rect(getPositionX() + rect.origin.x, getPositionY() + rect.origin.y, rect.size.width, rect.size.height);
	}
	else if (rotationY == 180)//left
	{
		rect = Rect(getPositionX() + rect.origin.x - rect.size.width, getPositionY() + rect.origin.y, rect.size.width, rect.size.height);
	}
	return rect;
}

Rect Player::getEntityRect()
{
	auto headBone = m_entitySkeletonNode->getBoneNode("Layer13"); 
	auto leftFootBone = m_entitySkeletonNode->getBoneNode("Layer23");
	auto rightFootBone = m_entitySkeletonNode->getBoneNode("Layer21");
	
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
	if (rotationY == 0){//the player is face to right. so rotation y is zero, the player is face to right
		rect = Rect(getPositionX() + leftBottomX -50, getPositionY() + leftBottomY + 10, rightTopX - leftBottomX, rightTopY - leftBottomY + 80 );
	}
	else if (rotationY == 180)
	{
		rect = Rect(getPositionX() + leftBottomX - 100, getPositionY() + leftBottomY +10, rightTopX - leftBottomX, rightTopY - leftBottomY + 80);
	}
	return rect;
	///return Rect(leftBottomX, leftBottomY, rightTopX, rightTopY);
	//auto rect = m_entitySkeletonNode->getBoundingBox();
	//auto rotationY = getRotationY();
	//if (rotationY == 0){//the player is face to right. so rotation y is zero, the player is face to right
	//	rect = Rect(getPositionX() + rect.origin.x + 70, getPositionY() + rect.origin.y, rect.size.width - 140, rect.size.height - 30);
	//}
	//else if (rotationY == 180)
	//{
	//	rect = Rect(getPositionX() + rect.origin.x, getPositionY() + rect.origin.y, rect.size.width - 140, rect.size.height - 30);
	//}
	//return rect;
}

Rect Player::getSkillRect()
{
	auto skillBone = m_entitySkeletonNode->getBoneNode("Layer2");
	auto rect = skillBone->getBoundingBox();
	//rect = Rect(Vec2(getPositionX() + rect.origin.x, getPositionY() + rect.origin.y), rect.size);

	auto rotationY = getRotationY();
	if (rotationY == 0)//player is face to right. So rotation y is zero, the player is face to right
	{
		rect = Rect(Vec2(getPositionX() + rect.origin.x, getPositionY() + rect.origin.y), Size(rect.size.width - 100, rect.size.height));
	}
	else if (rotationY == 180)
	{
		rect = Rect(Vec2(getPositionX() - rect.origin.x - rect.size.width + 100, getPositionY() + rect.origin.y), Size(rect.size.width - 200, rect.size.height));
	}

	return rect;
}

const bool& Player::isSkillCD() const
{
	return m_isSkillCD;
}

void Player::setSkillCD(bool newIsSkillCD)
{
	this->m_isSkillCD = newIsSkillCD;
}