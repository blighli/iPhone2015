#ifndef __OPTION_SCENE__
#define __OPTION_SCENE__

#include "cocos2d.h"
#include "ui/CocosGUI.h"

class OptionScene : public cocos2d::Layer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	//add back key response function
	void back(cocos2d::EventKeyboard::KeyCode, cocos2d::Event*);
	void bkgMusicSelect(cocos2d::Ref* ref, cocos2d::ui::CheckBoxEventType type);
	void effectSelect(cocos2d::Ref* ref, cocos2d::ui::CheckBoxEventType type);
	// implement the "static create()" method manually
	CREATE_FUNC(OptionScene);

private:
	bool m_isBkgMusicPlay;
	bool m_isEffectPlay;
};

#endif // __OPTION_SCENE__
