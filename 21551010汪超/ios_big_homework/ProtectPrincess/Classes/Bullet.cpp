#include "Bullet.h"
Bullet* Bullet::create()
{
	auto sprite =new Bullet();
	if (sprite&&sprite->init())
	{
		sprite->autorelease();
		return sprite;
	}
	CC_SAFE_DELETE(sprite);
	return nullptr;
}

bool Bullet::init()
{
	if (!Sprite::init())
	{
		return false;
	}
	auto spriteFrameCache = SpriteFrameCache::getInstance();
	spriteFrameCache->addSpriteFramesWithFile("resources.plist");
	_bullet = Sprite::createWithSpriteFrameName("bullet_01.png");
	_bullet->setPosition(Vec2::ZERO);
	_isShoot = false;
	this->addChild(_bullet,1);
    return true;
}

void Bullet::setShoot(bool isShoot)
{
	_isShoot = isShoot;
}

bool Bullet::getShoot()
{
	return _isShoot;
}

