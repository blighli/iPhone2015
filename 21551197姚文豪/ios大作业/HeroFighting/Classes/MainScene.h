#ifndef __MAIN_SCENE_H__
#define __MAIN_SCENE_H__

#include "cocos2d.h"
#include "ui/CocosGUI.h"

class MainScene : public cocos2d::Layer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	//this is the fun to start the game
	void startGame(cocos2d::Ref *pSender, cocos2d::ui::Widget::TouchEventType type);
	//set option view
	void setOption(cocos2d::Ref*, cocos2d::ui::TouchEventType type);
	//about game view
	void aboutGame(cocos2d::Ref*, cocos2d::ui::TouchEventType type);
	//exit the game
	void exitGame(cocos2d::Ref*, cocos2d::ui::TouchEventType type);

	//exit game when pressed back key
	void backGame(cocos2d::EventKeyboard::KeyCode keyCode, cocos2d::Event* event);
	// implement the "static create()" method manually
	CREATE_FUNC(MainScene);
};

#endif // __MAIN_SCENE_H__
