#include "HelpLayer.h"

USING_NS_CC;

Scene* HelpLayer::createScene()
{
	// 'scene' is an autorelease object
	log("createScene");
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = HelpLayer::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool HelpLayer::init()
{
	//////////////////////////////
	// 1. super init first
	if (!BaseLayer::init())
	{
		return false;
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();
	//Vec2 origin = Director::getInstance()->getVisibleOrigin();

	auto top = Sprite::createWithSpriteFrameName("help-top.png");
	top->setPosition(Vec2(visibleSize.width / 2, visibleSize.height - top->getContentSize().height / 2));
	addChild(top);





	auto txtTest = Label::createWithTTF(MyUtility::getUTF8Char("id"), "fonts/hanyi.ttf", 18);
	txtTest->setColor(Color3B(14, 83, 204));
	txtTest->setPosition(150, top->getPosition().y - 150);
	txtTest->setAnchorPoint(Vec2(0, 0));
	addChild(txtTest, 1);


	auto txtTest2 = Label::createWithTTF(MyUtility::getUTF8Char("name"), "fonts/hanyi.ttf", 18);
	txtTest2->setColor(Color3B(14, 83, 204));
	txtTest2->setPosition(150, top->getPosition().y - 200);
	txtTest2->setAnchorPoint(Vec2(0, 0));
	addChild(txtTest2, 1);




	return true;
}