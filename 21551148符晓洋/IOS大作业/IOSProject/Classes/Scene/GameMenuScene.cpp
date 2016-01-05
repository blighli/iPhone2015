#include "GameMenuScene.h"
#include "InstanceScene.h"
Scene* GameMenuScene::createScene()
{
	auto scene = Scene::create();
	auto layer = GameMenuScene::create();
    //while (!layer) {
        //layer=GameMenuScene::create();
    //}
	scene->addChild(layer);
	return scene;
}

bool GameMenuScene::init()
{
	if (!Layer::init())
	{
		return false;
	}
	Size _visibleSize = Director::getInstance()->getVisibleSize();
	auto background = Sprite::create("block.png");
	background->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/2));
	this->addChild(background,1);
	MenuItemImage* startmenu = MenuItemImage::create("btn-start.png", "btn-start-down.png", this, menu_selector(GameMenuScene::menuCloseCallBack));
	startmenu->setTag(1);
	MenuItemImage* selectmenu = MenuItemImage::create("btn-select.png", "btn-select-down.png", this, menu_selector(GameMenuScene::menuCloseCallBack));
	selectmenu->setTag(2);
	Menu* Tmenu = Menu::create(startmenu,selectmenu,NULL);
	Tmenu->alignItemsVerticallyWithPadding(20);
	Tmenu->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/2));
	this->addChild(Tmenu,2);
}

void GameMenuScene::menuCloseCallBack(Ref* pSender)
{
	int tag = ((MenuItemImage*)pSender) ->getTag();
	if (tag==1)
	{
		Director::getInstance()->replaceScene(TransitionPageTurn::create(0.5f, InstanceScene::createScene(), false));
	}
	else
	{

	}
}


