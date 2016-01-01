#include "Start.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"

#include "../Loading/Loading.h"
#include "../Help/Help.h"
#include "../Setting/Setting.h"

#include "../Audio/Audio.h"

using namespace cocos2d::ui;

bool Start::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init start scene of the game 
	// contain : start game
	//		     how to play
	//			 setting(audio only)

    // laod scene csd file
    auto rootNode = CSLoader::createNode("game-start.csb");
    addChild(rootNode);
    
    // load action
    auto action = CSLoader::createTimeline("game-start.csb");
    rootNode->runAction(action);
    
    // run action by frame
    action->gotoFrameAndPlay(0, 60, false);
    
    auto temp = rootNode->getChildren();
    
    // get button of start scene
    Button * btn_start = static_cast<Button*>(rootNode->getChildByName("btn-start"));
    Button * btn_help = static_cast<Button*>(rootNode->getChildByName("btn-help"));
    Button * btn_set = static_cast<Button*>(rootNode->getChildByName("btn-set"));
    
    // add touch event listener
    btn_start->addTouchEventListener(CC_CALLBACK_1(Start::start_callback, this));
    btn_help->addTouchEventListener(CC_CALLBACK_1(Start::help_callback, this));
    btn_set->addTouchEventListener(CC_CALLBACK_1(Start::set_callback, this));
    
	return true;
}

void Start::start_callback(Ref* pSender)
{
    // jump to loading scene
	Audio::play_effect("audio/button.wav");
    Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Loading::createScene()));
}

void Start::help_callback(Ref* pSender)
{
    // jump to help scene
	Audio::play_effect("audio/button.wav");
    Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Help::createScene()));
}

void Start::set_callback(Ref* pSender)
{
    // jump to setting scene
	Audio::play_effect("audio/button.wav");
    Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Setting::createScene()));
}

Scene* Start::createScene()
{
	auto scene = Scene::create();
	auto layer = Start::create();
	scene->addChild(layer);
	return scene;
}

