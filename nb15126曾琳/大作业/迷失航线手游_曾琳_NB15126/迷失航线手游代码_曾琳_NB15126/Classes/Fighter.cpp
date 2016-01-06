#include "Fighter.h"

USING_NS_CC;


Fighter* Fighter::createWithSpriteFrameName(const char* spriteFrameName)
{
	Fighter *fighter = new Fighter();

	if (fighter && fighter->initWithSpriteFrameName(spriteFrameName)) {
		fighter->autorelease();

		ParticleSystem *ps = ParticleSystemQuad::create("particle/fire.plist");

		//在飞机下面.
		ps->setPosition(Vec2(fighter->getContentSize().width / 2, 0));
#if (CC_TARGET_PLATFORM != CC_PLATFORM_WP8)
		ps->setRotation(180.0f);
#endif
		ps->setScale(0.5f);
		fighter->addChild(ps);

		Vec2 verts[] = {
			Vec2(-43.5, 15.5),
			Vec2(-23.5, 33),
			Vec2(28.5, 34),
			Vec2(48, 17.5),
			Vec2(0, -39.5) };

		auto body = PhysicsBody::createPolygon(verts, 5);

		body->setCategoryBitmask(0x01);			//0001
		body->setCollisionBitmask(0x02);		//0010
		body->setContactTestBitmask(0x01);

		fighter->setPhysicsBody(body);
		return fighter;
	}

	CC_SAFE_DELETE(fighter);

	return NULL;
}

void Fighter::setPosition(const cocos2d::Vec2& newPosition)
{
	Size screenSize = Director::getInstance()->getVisibleSize();

	float halfWidth = this->getContentSize().width / 2;
	float halfHeight = this->getContentSize().height / 2;
	float pos_x = newPosition.x;
	float pos_y = newPosition.y;

	if (pos_x < halfWidth) {
		pos_x = halfWidth;
	}
	else if (pos_x >(screenSize.width - halfWidth)) {
		pos_x = screenSize.width - halfWidth;
	}

	if (pos_y < halfHeight) {
		pos_y = halfHeight;
	}
	else if (pos_y >(screenSize.height - halfHeight)) {
		pos_y = screenSize.height - halfHeight;
	}

	Sprite::setPosition(Vec2(pos_x, pos_y));
	Sprite::setAnchorPoint(Vec2(0.5f, 0.5f));
}