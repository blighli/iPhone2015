#ifndef _GAMEMENUSCENE_H_
#define _GAMEMENUSCENE_H_
#include "cocos2d.h"
//#include "SoundManager.h"
#include "LevelManager.h"
#include "GameScene.h"
USING_NS_CC;
class GameMenu :public Layer
{
public:
	static Scene* createScene();
	virtual bool init();
	CREATE_FUNC(GameMenu);
	void menuCloseCallBack(Ref* pSender);
	void startCallBack(Ref* pSender);
	void selectCallBack(Ref* pSender);
private:
	//Sound* _sound;
};
#endif