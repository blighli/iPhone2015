#include "Help.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "../Start/Start.h"
using namespace cocos2d::ui;

#include "../Audio/Audio.h"

bool Help::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init help scene here
    // laod scene csd file
    auto rootNode = CSLoader::createNode("game-help.csb");
    addChild(rootNode);

	// get continue button
	Button * btn_continue = static_cast<Button*>(rootNode->getChildByName("btn-continue"));

	// add button callback
	btn_continue->addTouchEventListener(CC_CALLBACK_1(Help::btn_continue_callback, this));

	// btn fadein and fadeout action
	auto action = Sequence::create(
		FadeOut::create(1),
		FadeIn::create(1),
		NULL);
	btn_continue->runAction(RepeatForever::create(action));

	return true;
}

Scene* Help::createScene()
{
	auto scene = Scene::create();
	auto layer = Help::create();
	scene->addChild(layer);
	return scene;  // return scene with layer
}

void Help::btn_continue_callback(Ref* pSender)
{
	Audio::play_effect("audio/button.wav");
	Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Start::createScene())); 
}

