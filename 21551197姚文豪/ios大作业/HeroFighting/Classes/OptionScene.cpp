#include "OptionScene.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"

USING_NS_CC;

using namespace cocostudio::timeline;
using namespace ui;

Scene* OptionScene::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = OptionScene::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool OptionScene::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	auto rootNode = CSLoader::createNode("OptionSetting.csb");
	auto bkgMusic = static_cast<CheckBox*>(rootNode->getChildByName("CheckBox_1"));
	auto effect = static_cast<CheckBox*>(rootNode->getChildByName("CheckBox_1_0"));

	auto isBkgMusicPlay = UserDefault::getInstance()->getBoolForKey("BkgMusic");
	auto isEffectPlay = UserDefault::getInstance()->getBoolForKey("Effect");
	m_isBkgMusicPlay = isBkgMusicPlay;
	m_isEffectPlay = isEffectPlay;

	bkgMusic->setSelected(isBkgMusicPlay);
	effect->setSelected(isEffectPlay);
	bkgMusic->addEventListenerCheckBox(this, checkboxselectedeventselector(OptionScene::bkgMusicSelect));
	effect->addEventListenerCheckBox(this, checkboxselectedeventselector(OptionScene::effectSelect));

	addChild(rootNode);

	auto keyboardListener = EventListenerKeyboard::create();
	keyboardListener->onKeyPressed = CC_CALLBACK_2(OptionScene::back, this);
	_eventDispatcher->addEventListenerWithSceneGraphPriority(keyboardListener, this);

	return true;
}

void OptionScene::back(cocos2d::EventKeyboard::KeyCode keyCode, cocos2d::Event* event)
{
	switch (keyCode)
	{
	case EventKeyboard::KeyCode::KEY_ESCAPE:
		//save the data 
		UserDefault::getInstance()->setBoolForKey("BkgMusic", m_isBkgMusicPlay);
		UserDefault::getInstance()->setBoolForKey("Effect", m_isEffectPlay);
		Director::getInstance()->popScene();
		break;
	default:
		break;
	}
}

void OptionScene::bkgMusicSelect(Ref* ref, CheckBoxEventType type)
{
	switch (type)
	{
	case CheckBoxEventType::CHECKBOX_STATE_EVENT_SELECTED:
		m_isBkgMusicPlay = true;
		break;
	case CheckBoxEventType::CHECKBOX_STATE_EVENT_UNSELECTED:
		m_isBkgMusicPlay = false;
		break;
	default:
		break;
	}
}

void OptionScene::effectSelect(Ref* ref, CheckBoxEventType type)
{
	switch (type)
	{
	case CheckBoxEventType::CHECKBOX_STATE_EVENT_SELECTED:
		m_isEffectPlay = true;
		break;
	case CheckBoxEventType::CHECKBOX_STATE_EVENT_UNSELECTED:
		m_isEffectPlay = false;
		break;
	default:
		break;
	}
}