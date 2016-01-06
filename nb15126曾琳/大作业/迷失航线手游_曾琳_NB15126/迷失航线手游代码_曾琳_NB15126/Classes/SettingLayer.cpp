#include "SettingLayer.h"

USING_NS_CC;

Scene* SettingLayer::createScene()
{
	// 'scene' is an autorelease object
	log("createScene");
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = SettingLayer::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

bool SettingLayer::init()
{
	//////////////////////////////
	// 1. super init first
	if (!BaseLayer::init())
	{
		return false;
	}
	Size visibleSize = Director::getInstance()->getVisibleSize();
	Vec2 origin = Director::getInstance()->getVisibleOrigin();

	auto top = Sprite::createWithSpriteFrameName("setting-top.png");
	top->setPosition(Vec2(visibleSize.width / 2, visibleSize.height - top->getContentSize().height / 2));
	addChild(top);


	//音效.
	auto soundOnSprite = Sprite::createWithSpriteFrameName("setting.check-on.png");
	auto soundOffSprite = Sprite::createWithSpriteFrameName("setting.check-off.png");
	auto soundOnMenuItem = MenuItemSprite::create(soundOnSprite, NULL);
	auto soundOffMenuItem = MenuItemSprite::create(soundOffSprite, NULL);
	auto soundToggleMenuItem = MenuItemToggle::createWithCallback(CC_CALLBACK_1(SettingLayer::menuSoundToggleCallback, this), soundOnMenuItem, soundOffMenuItem, NULL);

	//音乐.
	auto musicOnSprite = Sprite::createWithSpriteFrameName("setting.check-on.png");
	auto musicOffSprite = Sprite::createWithSpriteFrameName("setting.check-off.png");
	auto musicOnMenuItem = MenuItemSprite::create(musicOnSprite, NULL);
	auto musicOffMenuItem = MenuItemSprite::create(musicOffSprite, NULL);
	auto musicToggleMenuItem = MenuItemToggle::createWithCallback(CC_CALLBACK_1(SettingLayer::menuMusicToggleCallback, this), musicOnMenuItem, musicOffMenuItem, NULL);

	auto  menu = Menu::create(soundToggleMenuItem, musicToggleMenuItem, NULL);

	menu->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2) + Vec2(70, 50));
	menu->alignItemsVerticallyWithPadding(20.0f);
	addChild(menu, 1);

	auto lblSound = Label::createWithTTF(MyUtility::getUTF8Char("lblSound"), "fonts/hanyi.ttf", 36);
	lblSound->setColor(Color3B(14, 83, 204));
	lblSound->setPosition(menu->getPosition() - Vec2(100, -30));
	addChild(lblSound, 1);

	auto lblMusic = Label::createWithTTF(MyUtility::getUTF8Char("lblMusic"), "fonts/hanyi.ttf", 36);
	lblMusic->setColor(Color3B(14, 83, 204));
	lblMusic->setPosition(lblSound->getPosition() - Vec2(0, 60));
	addChild(lblMusic, 1);

	//设置音效和音乐选中状态
	UserDefault *defaults = UserDefault::getInstance();
	if (defaults->getBoolForKey(MUSIC_KEY)) {
		musicToggleMenuItem->setSelectedIndex(0);
	}
	else {
		musicToggleMenuItem->setSelectedIndex(1);
	}
	if (defaults->getBoolForKey(SOUND_KEY)) {
		soundToggleMenuItem->setSelectedIndex(0);
	}
	else {
		soundToggleMenuItem->setSelectedIndex(1);
	}

	return true;
}

void SettingLayer::menuSoundToggleCallback(Ref* pSender)
{
	UserDefault *defaults = UserDefault::getInstance();
	if (defaults->getBoolForKey(SOUND_KEY)) {
		defaults->setBoolForKey(SOUND_KEY, false);
	}
	else {
		defaults->setBoolForKey(SOUND_KEY, true);
		SimpleAudioEngine::getInstance()->playEffect(sound_1);
	}
}


void SettingLayer::menuMusicToggleCallback(Ref* pSender)
{
	UserDefault *defaults = UserDefault::getInstance();
	if (defaults->getBoolForKey(MUSIC_KEY)) {
		defaults->setBoolForKey(MUSIC_KEY, false);
		SimpleAudioEngine::getInstance()->stopBackgroundMusic();
	}
	else {
		defaults->setBoolForKey(MUSIC_KEY, true);
		SimpleAudioEngine::getInstance()->playBackgroundMusic(bg_music_2, true);
	}
}
