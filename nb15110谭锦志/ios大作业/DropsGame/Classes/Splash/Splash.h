#pragma once
#include "cocos2d.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
USING_NS_CC;
using namespace cocos2d;
using namespace cocos2d::ui;           // contain cocostudio ui
using namespace cocostudio::timeline;  // contain animation

class Splash : public Layer
{
public:
	CREATE_FUNC(Splash);
	virtual bool init();
	static Scene* createScene();

	// frame event callback
	void onFrameEvent();
};