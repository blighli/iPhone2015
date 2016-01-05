#ifndef _LEVELMANAGER_H_
#define _LEVELMANAGER_H_
#include"cocos2d.h"
#include "ui/CocosGUI.h"
#include "GameMenuScene.h"
USING_NS_CC;
using namespace ui;
class LevelManager :public Layer
{
protected:
	int _selectedLevelIndex;
public:
	static Scene* createScene();
	bool init();
	void menuCloseCallback(Ref* pSender);
	CREATE_FUNC(LevelManager);
};
#endif