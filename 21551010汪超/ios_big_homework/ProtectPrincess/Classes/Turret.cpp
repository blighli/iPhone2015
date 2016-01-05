#include"Turret.h"

Turret* Turret::create(std::string TurretName)
{
	auto sprite = new Turret();
	if (sprite&&sprite->init(TurretName))
	{
		sprite->autorelease();
		return sprite;
	}
	CC_SAFE_DELETE(sprite);
	return nullptr;
}

bool Turret::init(std::string TurretName)
{
	if (!Sprite::init())
	{
		return false;
	}
	this->setAnchorPoint(Vec2::ZERO);
	attackDistance = 40;
	auto spriteFrameCache = SpriteFrameCache::getInstance();
	spriteFrameCache->addSpriteFramesWithFile("resources.plist");
	_Turret = Sprite::createWithSpriteFrameName(TurretName);
	_Turret->setPosition(Vec2::ZERO);
	_bullet = NULL;
	this->addChild(_Turret, 1);
	return true;
}

void Turret::setBullet(Bullet* bullet)
{
	 _bullet=bullet;
	 //_bullet->retain();
}

Bullet* Turret::getBullet()
{
	return _bullet;
}

