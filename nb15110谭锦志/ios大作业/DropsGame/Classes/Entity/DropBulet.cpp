#include "DropBulet.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
using namespace cocos2d::ui;

#include "../Audio/Audio.h"

DropBullet* DropBullet::createSprite(Vec2 postion, Dir direction, int speed)
{
	DropBullet *pRet = new(std::nothrow) DropBullet();
	if (pRet && pRet->init(postion, direction, speed))
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

bool DropBullet::init(Vec2 postion, Dir direction, int speed)
{
	if (!Sprite::init())
	{
		return false;
	}
	// init dropbullet here
	switch (direction)
	{
	case Up:
		m_Sprite = Sprite::create("drops/north.png");  // todo : change to sprite frame
		break;
	case Down:
		m_Sprite = Sprite::create("drops/south.png");
		break;
	case Left:
		m_Sprite = Sprite::create("drops/west.png");
		break;
	case Right:
		m_Sprite = Sprite::create("drops/east.png");
		break;
	}
	if (m_Sprite == NULL)
	{
		log("load bullet sprite error!");
		return false;
	}
	m_Sprite->setPosition(0, 0);
	m_Sprite->setScale(4.0f);
	this->setPosition(postion);
	this->addChild(m_Sprite);  // show sprite

	auto width = m_Sprite->getContentSize().width;
	auto height = m_Sprite->getContentSize().height;
	m_Rect = Rect(postion.x - width / 2, postion.y - height / 2, width, height);

	// save direction and speed
	m_Direction = direction;
	m_Speed = speed;
	m_R = width;

	this->scheduleUpdate();  // update position of bullet

	Vector<SpriteFrame*> frameVector;
	for (int i = 0;i < 5;i++)
	{
		auto spriteFrame = SpriteFrame::create(StringUtils::format("drops/bomb%d.png", i + 1), Rect(0, 0, 96, 96));
		frameVector.pushBack(spriteFrame);
	}
	auto animation = Animation::createWithSpriteFrames(frameVector);
	animation->setDelayPerUnit(0.07f);
	m_AnimateBoom = Animate::create(animation);
	
	return true;
}

void DropBullet::explode_dispear(Sprite *pSender)
{
	pSender->removeFromParent(); // remove
	// if (this != NULL) {
	//	 this->removeFromParent();  // bug !!!
	// }
}

void DropBullet::combine_dispear()
{
	this->setVisible(false);
	this->removeFromParent();
}

void DropBullet::combine()
{
	this->unscheduleUpdate(); // stop moving
	this->runAction(Sequence::create(
		ScaleTo::create(0.05, 1.2),
		FadeOut::create(0.03),
		CallFunc::create(CC_CALLBACK_0(DropBullet::combine_dispear, this)),
		NULL));
}

// update frame
void DropBullet::update(float delta)
{
	switch (m_Direction)
	{
	case Up:
		this->setPositionY(this->getPositionY() + m_Speed);
		break;
	case Down:
		this->setPositionY(this->getPositionY() - m_Speed);
		break;
	case Left:
		this->setPositionX(this->getPositionX() - m_Speed);
		break;
	case Right:
		this->setPositionX(this->getPositionX() + m_Speed);
		break;
	default:
		break;
	}
}

// bullet explode
void DropBullet::blast()
{
	Audio::play_effect("audio/pop4.wav");
	// create animation
	Vector<SpriteFrame*> frameVector;
	for (int i = 0;i < 5;i++)
	{
		auto spriteFrame = SpriteFrame::create(StringUtils::format("drops/bomb%d.png", i + 1), Rect(0, 0, 96, 96));
		frameVector.pushBack(spriteFrame);
	}
	auto animation = Animation::createWithSpriteFrames(frameVector);
	animation->setDelayPerUnit(0.07f);
	auto AnimateBoom = Animate::create(animation);

	this->setVisible(false);
	auto explode = Sprite::createWithSpriteFrame(SpriteFrame::create("drops/bomb.png", Rect(0, 0, 96, 96)));
	explode->setPosition(this->getPosition());
	if (this->getParent())
	{
		this->getParent()->addChild(explode, 2);
	}

	// explode animation
	explode->runAction(Sequence::create(
		AnimateBoom,
		CallFunc::create(CC_CALLBACK_0(DropBullet::explode_dispear, this, explode)),
		NULL));
}

