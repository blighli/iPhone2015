#include "GameOver.h"
Scene* GameOver::createScene()
{
	Scene* scene = Scene::create();
	auto layer = GameOver::create();
	scene->addChild(layer);
	return scene;
}

bool GameOver::init()
{
	if (!Layer::init())
	{
		return false;
	}
	ignoreAnchorPointForPosition(false);
	this->setAnchorPoint(Vec2(0.5, 0.5));
	auto _visibleSize = Director::getInstance()->getVisibleSize();
	_tip = Sprite::create("tip.png");
	_tip->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/2));
	this->addChild(_tip);
	this->setContentSize(_tip->getContentSize());
	auto imageItem1 = MenuItemImage::create(
		"button_1.png", "button_2.png",  [&](Ref* pSender){
			this->removeFromParentAndCleanup(true);
		});
	auto imageItem2 = MenuItemImage::create(
		"button_no_1.png", "button_no_2.png", [&](Ref* pSender){
		Director::getInstance()->replaceScene(TransitionSplitRows::create(1.0f,LevelManager::createScene()));
	});
	auto menu = Menu::create(imageItem1,imageItem2,NULL);
	menu->alignItemsHorizontally();
	menu->setPosition(Vec2(_visibleSize.width / 2, _visibleSize.height/2));
	this->addChild(menu, 2);
	auto listener = EventListenerTouchOneByOne::create();
	listener->setSwallowTouches(true);
	listener->onTouchBegan = [](Touch* touch, Event* event){return true; };
	_eventDispatcher->addEventListenerWithSceneGraphPriority(listener, this);
	return true;
}

