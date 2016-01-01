#include "DarkLayer.h"

bool DarkLayer::init()
{
	if (!Layer::init())
	{
		return false;
	}
	auto size = Director::getInstance()->getVisibleSize();
	auto back = LayerColor::create();
	back->setColor(Color3B(0, 0, 0));
	back->setOpacity(190);
	back->setPosition(0, 0);
	back->setContentSize(Size(size.width, size.height));
	back->setAnchorPoint(Vec2(0, 0));
	this->addChild(back);

	auto touchlistener = EventListenerTouchOneByOne::create();
	touchlistener->setSwallowTouches(true); // ÊÂ¼þ²»ÍùÏÂ²ã´«£¬·ÀÖ¹´¥Ãþ´©Í¸
	touchlistener->onTouchBegan = [=](Touch* touch, Event* event)
	{
		return true;
	};
	_eventDispatcher->addEventListenerWithSceneGraphPriority(touchlistener, this);

	return true;
}

Layer* DarkLayer::CreateLayer()
{
	return DarkLayer::create();
}