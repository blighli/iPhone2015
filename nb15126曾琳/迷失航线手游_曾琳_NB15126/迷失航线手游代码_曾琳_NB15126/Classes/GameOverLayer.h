#ifndef __GAMEOVERLAYER_H__
#define __GAMEOVERLAYER_H__

#include "cocos2d.h"
#include "GameOverLayer.h"

#include "MyUtility.h"

#include "SystemHeader.h"

class GameOverLayer : public cocos2d::Layer
{
	//当前玩家比赛分数
	int score;
public:

	GameOverLayer(int score);

	virtual bool init();
	virtual void onExit();

	static GameOverLayer* createWithScore(int score);
};













#endif // __GAMEOVERLAYER_H__
