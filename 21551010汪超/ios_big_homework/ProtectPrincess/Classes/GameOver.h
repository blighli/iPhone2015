#ifndef _GAMEOVER_H_
#define _GAMEOVER_H_
#include"cocos2d.h"
#include"LevelManager.h"
USING_NS_CC;
class GameOver : public Layer
{
protected:
	Sprite* _tip;
public:
	static Scene* createScene();
	bool init();
	CREATE_FUNC(GameOver);

};
#endif