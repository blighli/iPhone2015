#include "LoseLayer.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
using namespace cocos2d::ui;
using namespace cocostudio;

#include "../Start/Start.h"
#include "DarkLayer.h"
#include "../Audio/Audio.h"

bool LoseLayer::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init lose layer here
	auto rootNode = CSLoader::createNode("game-layer-lose.csb");
	addChild(rootNode);

	// load action
	auto action = CSLoader::createTimeline("game-layer-lose.csb");
	rootNode->runAction(action);

	// run action by frame
	action->gotoFrameAndPlay(0, 6, true);

	// get button
	Button* btn_exit = static_cast<Button*>(rootNode->getChildByName("btn-exit"));
	Button* btn_restart = static_cast<Button*>(rootNode->getChildByName("btn-restart"));

	// button callback
	btn_exit->addTouchEventListener(CC_CALLBACK_1(LoseLayer::btn_exit_callback, this));
	btn_restart->addTouchEventListener(CC_CALLBACK_1(LoseLayer::btn_restart_callback, this));

	return true;
}

Layer* LoseLayer::createLayer()
{
	return LoseLayer::create(); // return layer only
}

void LoseLayer::btn_exit_callback(Ref* pSender)
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

void LoseLayer::btn_restart_callback(Ref* pSender)
{
	// restart current game scene 
	Audio::play_effect("audio/button.wav");
	Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Start::createScene()));
}

