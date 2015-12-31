#include "GameWinLayer.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
using namespace cocos2d::ui;

GameWinLayer::GameWinLayer()
{

}

GameWinLayer::~GameWinLayer()
{

}

bool GameWinLayer::init()
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

Layer * GameWinLayer::CreateLayer()
{
	return GameWinLayer::create();
}