#pragma once
#include "cocos2d.h"
#include "cocos-ext.h"
USING_NS_CC;
using namespace cocos2d;
using namespace extension;

class Loading : public Layer
{
public:
	CREATE_FUNC(Loading);
	virtual bool init();
	static Scene* createScene();

	void loadResources(float t);
	void updateSlider(float t);

private:
	int m_index;
	ControlSlider* m_Slider;
};
