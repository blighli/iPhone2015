#include "Drop.h"
#include "../GameScene/GameScene.h"
#include "../Audio/Audio.h"

Vector<DropBullet*> m_DropBulletList;
bool m_HaveExplode;

bool Drop::init(Vec2 position, DropsType type)
{
	if (!Sprite::init())
	{
		return false;
	}
	// init drop here
	m_Alive = true;
	m_Texture_1 = Director::getInstance()->getTextureCache()->addImage("drops/drop1.png");
	m_Texture_2 = Director::getInstance()->getTextureCache()->addImage("drops/drop2.png");
	m_Texture_3 = Director::getInstance()->getTextureCache()->addImage("drops/drop3.png");
	m_Texture_4 = Director::getInstance()->getTextureCache()->addImage("drops/drop4.png");

	Sprite* shap = NULL;
	switch (type)
	{
	case Drops_one:   // one drop shap
		shap = Sprite::createWithTexture(m_Texture_1);  // todo : change to sprite frame
		break;
	case Drops_two:   // two drops shap
		shap = Sprite::createWithTexture(m_Texture_2);
		break;
	case Drops_three: // threes shap
		shap = Sprite::createWithTexture(m_Texture_3);
		break;
	case Drops_four:  // four drops shap
		shap = Sprite::createWithTexture(m_Texture_4);
		break;
	case Drops_five:  // drop explode
		m_Alive = false;
		break;
	default:
		break;
	}
	shap->setPosition(0, 0);
	shap->setScale(4.0f);
	this->setPosition(position); // set sprite position
	this->addChild(shap, 2);     // show shap

	auto width = shap->getContentSize().width;
	auto height = shap->getContentSize().height;
	m_Rect = Rect(position.x - width * 2, position.y - height * 2, width * 4, height * 4);

	m_Sprite = shap;  // save sprite
	m_Type = type;    // init state
	m_R = width;
	m_IsAtacking = false;

	this->scheduleUpdate();     // update func

	return true;
}

Drop* Drop::createSprite(Vec2 position, DropsType type)
{ 
	Drop *pRet = new(std::nothrow) Drop(); 
	if (pRet && pRet->init(position, type))
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

void Drop::setState(DropsType state)
{
	m_Type = state; // change type of current drop
	auto action = Sequence::create(
		ScaleTo::create(0.09, 1.6),
		ScaleTo::create(0.09, 0.95),
		CallFunc::create(this, callfunc_selector(Drop::drop_upgrade)),
		NULL);
	this->runAction(action); // upgrade action
}

void Drop::blast()
{
	m_Alive = false;  // die
	auto action = Sequence::create(
		ScaleTo::create(0.09, 1.6),
		ScaleTo::create(0.09, 0.95),
		CallFunc::create(this, callfunc_selector(Drop::drop_dispear)),
		NULL);
	this->runAction(action);
}

// drop show off
void Drop::drop_dispear()
{
	this->setVisible(false);
	create_bullet(this->getPosition());
	this->removeFromParent();
}

// drop upgrade
void Drop::drop_upgrade()
{
	Audio::play_effect("audio/pop1.wav");
	this->removeChild(m_Sprite, true);  // remove 
	switch (m_Type)
	{
	case Drops_one:   // one drop shap
		m_Sprite = Sprite::createWithTexture(m_Texture_1);  // todo : change to sprite frame
		break;
	case Drops_two:   // two drops shap
		m_Sprite = Sprite::createWithTexture(m_Texture_2);
		break;
	case Drops_three: // threes shap
		m_Sprite = Sprite::createWithTexture(m_Texture_3);
		break;
	case Drops_four:  // four drops shap
		m_Sprite = Sprite::createWithTexture(m_Texture_4);
		break;
	case Drops_five:  // drop explode
		m_Alive = false;
		break;
	}
	m_Sprite->setScale(4.0f);
	this->addChild(m_Sprite, 2);
	m_IsAtacking = false;
}

// new four bullet
void Drop::create_bullet(Vec2 position)
{
	Audio::play_effect("audio/pop5.wav");

	// position of four bullet
	Vec2 position_left = this->getPosition() - Vec2(70, 0);
	Vec2 position_right = this->getPosition() + Vec2(70, 0);
	Vec2 position_up = this->getPosition() + Vec2(0, 70);
	Vec2 postion_down = this->getPosition() - Vec2(0, 70);

	// create four bullets
	auto bullet_left = DropBullet::createSprite(position_left, Dir::Left, 16);
	auto bullet_right = DropBullet::createSprite(position_right, Dir::Right, 16);
	auto bullet_up = DropBullet::createSprite(position_up, Dir::Up, 16);
	auto bullet_down = DropBullet::createSprite(postion_down, Dir::Down, 16);

	// add bullet to DropBulletList
	m_DropBulletList.pushBack(bullet_left);
	m_DropBulletList.pushBack(bullet_right);
	m_DropBulletList.pushBack(bullet_up);
	m_DropBulletList.pushBack(bullet_down);
	// show bullet
	this->getParent()->addChild(bullet_left, 2);
	this->getParent()->addChild(bullet_right, 2);
	this->getParent()->addChild(bullet_up, 2);
	this->getParent()->addChild(bullet_down, 2);

	// 产生bullet之后，释放控制
	m_HaveExplode = false;
}
