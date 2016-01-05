#pragma once
#include "cocos2d.h"
USING_NS_CC;
using namespace cocos2d;

class Help : public Layer
{
public:
	CREATE_FUNC(Help);
	virtual bool init();
	static Scene* createScene();

	// continue callback
	void btn_continue_callback(Ref* pSender);
};

