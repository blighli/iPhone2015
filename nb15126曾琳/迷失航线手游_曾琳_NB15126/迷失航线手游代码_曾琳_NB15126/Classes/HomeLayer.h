
#ifndef __HOMELAYER_H__
#define __HOMELAYER_H__

#include "cocos2d.h"
#include "HomeLayer.h"
#include "PlayLayer.h"
#include "SettingLayer.h"
#include "HelpLayer.h"



typedef enum{
	startMenu,
	settingMenu,
	helpMenu
}ActionType;





class HomeLayer : public cocos2d::Layer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();  
	void junpTo(cocos2d::Ref* sender);



	// implement the "static create()" method manually
	CREATE_FUNC(HomeLayer);
};














#endif // __HELLOWORLD_SCENE_H__
