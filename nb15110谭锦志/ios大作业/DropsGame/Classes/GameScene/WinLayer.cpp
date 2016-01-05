#include "WinLayer.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
using namespace cocos2d::ui;

#include "GameScene.h"
#include "../Audio/Audio.h"

bool WinLayer::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init win layer here
	auto rootNode = CSLoader::createNode("game-layer-win.csb");
	addChild(rootNode);

	// load action
	auto action = CSLoader::createTimeline("game-layer-lose.csb");
	rootNode->runAction(action);

	// run action by frame
	action->gotoFrameAndPlay(0, 6, true);

	// get button
	Button* btn_exit = static_cast<Button*>(rootNode->getChildByName("btn-exit"));
	Button* btn_next = static_cast<Button*>(rootNode->getChildByName("btn-next"));

	// button callback
	btn_exit->addTouchEventListener(CC_CALLBACK_1(WinLayer::btn_exit_callback, this));
	btn_next->addTouchEventListener(CC_CALLBACK_1(WinLayer::btn_next_callback, this));

	return true;
}

Layer* WinLayer::createLayer()
{
	return WinLayer::create();  // return layer only
}

void WinLayer::btn_exit_callback(Ref* pSender)
{
	// exit app
	Audio::play_effect("audio/button.wav");
#if (CC_TARGET_PLATFORM == CC_PLATFORM_WP8) || (CC_TARGET_PLATFORM == CC_PLATFORM_WINRT)
	MessageBox("You pressed the close button. Windows Store Apps do not implement a close button.", "Alert");
	return;
#endif

	Director::getInstance()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
	exit(0);
#endif
}

void WinLayer::btn_next_callback(Ref* pSender)
{
	// load game scene next round
	Audio::play_effect("audio/button.wav");
	int cur = atoi(DataUtils::read(GameLevel).c_str());
	if (cur < DataUtils::game_info("data/game.config").max_classical_level)
	{
		Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, GameScene::createScene(GameMode::Classical, cur + 1)));
	}
	else { // 超过100关，概率不再更改
		auto lev = DataUtils::game_info("data/game.config").max_classical_level; 
		Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, GameScene::createScene(GameMode::Classical, lev)));
	}
}
