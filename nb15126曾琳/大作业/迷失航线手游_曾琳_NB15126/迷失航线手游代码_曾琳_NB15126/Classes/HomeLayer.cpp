#include "HomeLayer.h"

USING_NS_CC;





Scene* HomeLayer::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::create();

	auto layer = HomeLayer::create();

	// add layer as a child to scene
	scene->addChild(layer);    

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool HomeLayer::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();
	//Vec2 origin = Director::getInstance()->getVisibleOrigin();
	


	auto bg = TMXTiledMap::create("map/red_bg.tmx");
	addChild(bg);





	
	auto shangmian = Sprite::createWithSpriteFrameName("home-top.png");
	shangmian->setPosition(Vec2(visibleSize.width / 2, visibleSize.height - shangmian->getContentSize().height / 2));
	addChild(shangmian);
	
	
	
	auto zhongjian = Sprite::createWithSpriteFrameName("home-end.png");
	zhongjian->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2 - shangmian->getContentSize().height - 30));
	addChild(zhongjian);



	// ��ʼ�˵�
	auto startSpriteNormal = Sprite::createWithSpriteFrameName("home.button.start.png");
	auto startSpriteSelected = Sprite::createWithSpriteFrameName("home.button.start-on.png");
	auto startMenuItem = MenuItemSprite::create(
		startSpriteNormal,
		startSpriteSelected,
		CC_CALLBACK_1(HomeLayer::junpTo, this));
	startMenuItem->setTag(ActionType::startMenu);

	// ���ò˵�
	auto settingpre = Sprite::createWithSpriteFrameName("home.button.setting.png");
	auto settingpush = Sprite::createWithSpriteFrameName("home.button.setting-on.png");
	auto settingMenuItem = MenuItemSprite::create(
		settingpre,
		settingpush,
		CC_CALLBACK_1(HomeLayer::junpTo, this));
	settingMenuItem->setTag(ActionType::settingMenu);




	// �����˵�
	auto helppriteNormal = Sprite::createWithSpriteFrameName("home.button.help.png");
	auto helpSpriteSelected = Sprite::createWithSpriteFrameName("home.button.help-on.png");
	auto helpMenuItem = MenuItemSprite::create(
		helppriteNormal,
		helpSpriteSelected,
		CC_CALLBACK_1(HomeLayer::junpTo, this));
	helpMenuItem->setTag(ActionType::helpMenu);

	auto mu = Menu::create(startMenuItem, settingMenuItem, helpMenuItem, NULL);

	mu->setPosition(visibleSize.width / 2, visibleSize.height / 2);
	mu->alignItemsVerticallyWithPadding(12);
	addChild(mu);


	




	








	
	return true;
}



void HomeLayer::junpTo(cocos2d::Ref* sender)
{
	//�����ͬʱ������Ч
	log("%s", FileUtils::getInstance()->getWritablePath().c_str());
	MenuItem* sender1 = (MenuItem*)sender;
	Scene* scene = nullptr;
	switch (sender1->getTag())
	{
	case ActionType::startMenu:
		//��ת����ʼ��Ϸҳ��
		scene = TransitionShrinkGrow::create(2,GamePlayLayer::createScene());
		break;


	case ActionType::settingMenu:
		//��ת�����ý���
		scene = TransitionShrinkGrow::create(2, SettingLayer::createScene());
		break;


	case ActionType::helpMenu:
		//��ת����������
		scene = TransitionShrinkGrow::create(2, HelpLayer::createScene());
		break;


	}
	if (scene)
		Director::getInstance()->pushScene(scene);




	}



