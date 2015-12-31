#pragma once

#include "cocos2d.h"
using namespace cocos2d;

class GameWinLayer : public Layer
{
public:
	GameWinLayer();
	~GameWinLayer();

	CREATE_FUNC(GameWinLayer);
	virtual bool init();
	static Layer * CreateLayer();

private:

};