#pragma once
#include "cocos2d.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
USING_NS_CC;
using namespace cocos2d;
using namespace cocos2d::ui;

class Setting : public Layer
{
public:
	virtual bool init();
	CREATE_FUNC(Setting);
	static Scene* createScene();

	void sliderPercentChangeEvent(Ref*pSender, SliderEventType type);

	// continue button callback
	void btn_continue_callback(Ref* pSender);
};