#include "MainScene.h"
#include "GameScene.h"
#include "extensions/cocos-ext.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "OptionScene.h"
#include "AboutScene.h"

USING_NS_CC;

using namespace cocos2d::ui;
using namespace cocostudio::timeline;

Scene* MainScene::createScene()
{
	// 'scene' is an autorelease object
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = MainScene::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool MainScene::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	auto rootNode = CSLoader::createNode("MainScene.csb");

	addChild(rootNode);

	auto btnStart =static_cast<Button*>(rootNode->getChildByName("BtnStart"));
	auto btnOption = static_cast<Button*>(rootNode->getChildByName("BtnOption"));
	auto btnAbout = static_cast<Button*>(rootNode->getChildByName("BtnAbout"));
	auto btnExit = static_cast<Button*>(rootNode->getChildByName("BtnExit"));
	//btnStart->setPosition(Vec2(100, 100));
	//btnStart->setContentSize(Size(200, 100));
	btnStart->addTouchEventListener(CC_CALLBACK_2(MainScene::startGame, this));
	btnOption->addTouchEventListener(this, toucheventselector(MainScene::setOption));
	btnAbout->addTouchEventListener(this, toucheventselector(MainScene::aboutGame));
	btnExit->addTouchEventListener(this, toucheventselector(MainScene::exitGame));

	//add hero and monster action to the main layout
	auto hero = CSLoader::createNode("HeroScene.csb");
	auto monster = CSLoader::createNode("TaurenScene.csb");
	auto heroAction = CSLoader::createTimeline("Hero.csb");
	auto monsterAction = CSLoader::createTimeline("Tauren.csb");

	auto winsize = Director::getInstance()->getVisibleSize();
	hero->setAnchorPoint(Vec2(0.5, 0.5));
	monster->setAnchorPoint(Vec2(0.5, 0.5));
	hero->setPosition(winsize.width/4,winsize.height/2);
	monster->setPosition(winsize.width/4*3,winsize.height/2);
	hero->setScale(1.3);
	monster->setScale(1.3);

	hero->runAction(heroAction);
	monster->runAction(monsterAction);
	heroAction->gotoFrameAndPlay(0,23,true);
	monsterAction->gotoFrameAndPlay(0,24,true);

	addChild(hero);
	addChild(monster);

	//respond to system back key
	auto backKeyListener = EventListenerKeyboard::create();
	backKeyListener->onKeyPressed = CC_CALLBACK_2(MainScene::backGame, this);
	_eventDispatcher->addEventListenerWithSceneGraphPriority(backKeyListener, this);
	return true;
}

void MainScene::startGame(Ref *pSender, ui::Widget::TouchEventType type)
{
	if (ui::Widget::TouchEventType::ENDED == type)
	{
		Director::getInstance()->replaceScene(TransitionProgressHorizontal::create(1.0f, GameScene::createScene()));
	}
}

void MainScene::setOption(Ref* pSender, TouchEventType type)
{
	if (ui::TouchEventType::TOUCH_EVENT_ENDED == type)
	{
		Director::getInstance()->pushScene(TransitionPageTurn::create(1.0f, OptionScene::createScene(), false));
	}
}
void MainScene::aboutGame(Ref* pSender, TouchEventType type)
{
	if (ui::TouchEventType::TOUCH_EVENT_ENDED == type)
	{
		Director::getInstance()->pushScene(TransitionPageTurn::create(1.0f, AboutScene::createScene(), false));
	}
}

void MainScene::exitGame(Ref*, TouchEventType type)
{
	Director::getInstance()->end();
}

void MainScene::backGame(EventKeyboard::KeyCode keyCode, Event* event)
{
	switch (keyCode)
	{
	case EventKeyboard::KeyCode::KEY_ESCAPE:
		Director::getInstance()->popScene();
		break;
	default:
		break;
	}
}