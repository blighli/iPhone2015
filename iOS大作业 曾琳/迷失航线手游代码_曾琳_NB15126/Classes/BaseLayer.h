#ifndef __BSAE_LAYER_H__
#define __BSAE_LAYER_H__

#include "cocos2d.h"

#include "SystemHeader.h"

class BaseLayer : public cocos2d::Layer
{
public:

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();  
	
	virtual void onEnterTransitionDidFinish();

	void menuBackCallback(cocos2d::Ref* pSender);

};

#endif // __BSAE_LAYER_H__
