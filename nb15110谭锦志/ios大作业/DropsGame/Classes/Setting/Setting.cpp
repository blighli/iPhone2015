#include "Setting.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "../Start/Start.h"

#include "../Audio/Audio.h"
using namespace cocos2d::ui;

bool Setting::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init setting scene here
	auto rootNode = CSLoader::createNode("game-setting.csb");
	addChild(rootNode);

	// get slider sound
	Slider * slider_sound = static_cast<Slider*>(rootNode->getChildByName("slide-sound"));
	slider_sound->addEventListenerSlider(this, sliderpercentchangedselector(Setting::sliderPercentChangeEvent));
	slider_sound->setPercent(Audio::get_volume() / 1.0 * 100); // 初始化slider长度

	// get button continue
	Button* btn_continue = static_cast<Button*>(rootNode->getChildByName("btn-continue"));

	// btn fadein and fadeout action
	auto action = Sequence::create(
		FadeOut::create(1),
		FadeIn::create(1),
		NULL);
	btn_continue->runAction(RepeatForever::create(action));

	// add btn callback
	btn_continue->addTouchEventListener(CC_CALLBACK_1(Setting::btn_continue_callback, this));

	return true;
}

void Setting::sliderPercentChangeEvent(Ref*pSender, SliderEventType type)
{
	if (type == SLIDER_PERCENTCHANGED)
	{
		Slider* pSlider = (Slider*)pSender;
		int percent = pSlider->getPercent();
		Audio::set_volume(percent / 100.0); // 改变声音
	}
}

Scene* Setting::createScene()
{
	auto scene = Scene::create();
	auto layer = Setting::create();
	scene->addChild(layer);
	return scene;
}

void Setting::btn_continue_callback(Ref* pSender)
{
	// jump to start scene
	Audio::play_effect("audio/button.wav");
	Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Start::createScene()));
}

