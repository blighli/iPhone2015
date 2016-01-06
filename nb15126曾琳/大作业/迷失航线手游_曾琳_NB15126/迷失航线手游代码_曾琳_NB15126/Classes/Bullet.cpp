#include "Bullet.h"

USING_NS_CC;

Bullet* Bullet::createWithSpriteFrameName(const char* spriteFrameName)
{
	Bullet *bullet = new Bullet();
	if (bullet && bullet->initWithSpriteFrameName(spriteFrameName)) {
		bullet->autorelease();
		bullet->setVisible(false);

		auto body = PhysicsBody::createBox(bullet->getContentSize());

		body->setCategoryBitmask(0x01);			//0001
		body->setCollisionBitmask(0x02);		//0010
		body->setContactTestBitmask(0x01);

		bullet->setPhysicsBody(body);

		return bullet;
	}
	CC_SAFE_DELETE(bullet);
	return nullptr;
}

void Bullet::shootBulletFromFighter(Fighter* fighter)
{
	this->setPosition(fighter->getPosition() + Vec2(0, fighter->getContentSize().height / 2));
	this->setVisible(true);
	this->unscheduleUpdate();
	this->scheduleUpdate();

}

void Bullet::update(float dt)
{
	Size screenSize = Director::getInstance()->getVisibleSize();
	this->setPosition(Vec2(this->getPosition() + velocity *dt));
	if (this->getPosition().y > screenSize.height) {
		//log("isVisible = %d",this->isVisible());
		this->setVisible(false);
		this->unscheduleUpdate();
		this->removeFromParent();
	}
}