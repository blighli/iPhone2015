#pragma once
#include "cocos2d.h"
USING_NS_CC;
using namespace cocos2d;

class DarkLayer : public Layer
{
public:

	CREATE_FUNC(DarkLayer);
	virtual bool init();

	static Layer* CreateLayer();

private:

};
