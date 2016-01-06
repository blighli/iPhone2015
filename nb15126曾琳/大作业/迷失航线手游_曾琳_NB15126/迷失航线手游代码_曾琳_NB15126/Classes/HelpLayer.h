
#ifndef __HELPLAYER_H__
#define __HELPLAYER_H__

#include "cocos2d.h"
#include "BaseLayer.h"
#include "SystemHeader.h"
#include "MyUtility.h"

class HelpLayer : public BaseLayer
{
public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	// implement the "static create()" method manually
	CREATE_FUNC(HelpLayer);
};









#endif // __HELPLAYER_H__
