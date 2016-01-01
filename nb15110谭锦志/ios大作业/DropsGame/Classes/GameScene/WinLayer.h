#pragma once
#include "cocos2d.h"
USING_NS_CC;
using namespace cocos2d;

class WinLayer : public Layer
{
public:
	CREATE_FUNC(WinLayer);
	virtual bool init();
	static Layer* createLayer();

	// btn callback
	void btn_exit_callback(Ref* pSender);
	void btn_next_callback(Ref* pSender);
};

