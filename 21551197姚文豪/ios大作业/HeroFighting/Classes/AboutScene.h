#ifndef __ABOUT_SCENE__
#define __ABOUT_SCENE__

#include "cocos2d.h"

class AboutScene : public cocos2d::Layer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	//back key response function
	void back(cocos2d::EventKeyboard::KeyCode keyCode, cocos2d::Event* event);

	// implement the "static create()" method manually
	CREATE_FUNC(AboutScene);
};

#endif // __ABOUT_SCENE__
