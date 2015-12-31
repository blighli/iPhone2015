#pragma once

#include "cocos2d.h"
using namespace cocos2d;

class GameLoseLayer : public Layer
{
public:
	GameLoseLayer();
	~GameLoseLayer();

	CREATE_FUNC(GameLoseLayer);
	virtual bool init();
	static Layer * CreateLayer();

private:
   
};