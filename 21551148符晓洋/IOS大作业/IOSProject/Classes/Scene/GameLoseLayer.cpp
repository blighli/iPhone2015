#include "GameLoseLayer.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
using namespace cocos2d::ui;

GameLoseLayer::GameLoseLayer()
{

}

GameLoseLayer::~GameLoseLayer()
{

}

bool GameLoseLayer::init()
{
	if (!Layer::init())
	{
		return false;
	}
	Size visibleSize = Director::sharedDirector()->getVisibleSize();
	
	// finish layer
	LayerColor* layerColor = LayerColor::create();
	layerColor->setColor(Color3B(0, 0, 0));
	layerColor->setOpacity(150);
	layerColor->setContentSize(Size(visibleSize.width, visibleSize.height));
	this->addChild(layerColor, 1);

	return true;
}

Layer * GameLoseLayer::CreateLayer()
{
	return GameLoseLayer::create();
}
