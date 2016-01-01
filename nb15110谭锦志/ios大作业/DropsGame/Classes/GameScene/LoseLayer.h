#pragma once
#include "cocos2d.h"
USING_NS_CC;
using namespace cocos2d;

class LoseLayer : public Layer
{
public:
	CREATE_FUNC(LoseLayer);
	virtual bool init();
	static Layer* createLayer();

	// button callback
	void btn_exit_callback(Ref* pSender);
	void btn_restart_callback(Ref* pSender);
};

