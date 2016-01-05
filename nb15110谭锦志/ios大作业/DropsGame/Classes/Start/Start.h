
#pragma once
#include "cocos2d.h"
USING_NS_CC;
using namespace cocos2d;

class Start : public Layer
{
public:
	CREATE_FUNC(Start);
	virtual bool init();
	static Scene* createScene();
    
    // start callback
    void start_callback(Ref* pSender);
    
    // help callback
    void help_callback(Ref* pSender);
    
    // set callback
    void set_callback(Ref* pSender);
};