#ifndef _GAMEMENUSCENE_H_
#define _GAMEMENUSCENE_H_
#include "cocos2d.h"
#include "GameMenuScene.h"
USING_NS_CC;
class GameMenuScene: public Layer
{
public:
	static Scene* createScene();
	bool init();
	CREATE_FUNC(GameMenuScene);
	void menuCloseCallBack(Ref* pSender);

private:

};
#endif