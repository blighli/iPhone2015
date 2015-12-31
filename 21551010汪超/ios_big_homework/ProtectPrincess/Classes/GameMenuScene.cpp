#include"GameMenuScene.h"
Scene* GameMenu::createScene()
{
	auto scene = Scene::create();
	auto layer = GameMenu::create();
	scene->addChild(layer);
	return scene;
}

bool GameMenu::init()
{
	if (!Layer::init())
	{
		return false;
	}
	//_sound = Sound::getInstance();
	//_sound->playBgMusic(MUSIC_TYPE_BACKGROUND);
	Size _visibleSize = Director::getInstance()->getVisibleSize();
	auto spriteFrameCache = SpriteFrameCache::getInstance();
	spriteFrameCache->addSpriteFramesWithFile("resources.plist");
	/*auto startmenu = Sprite::createWithSpriteFrameName("btn-start.png");
	auto selectmenu = Sprite::createWithSpriteFrameName("btn-select.png");
	startmenu->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/3*2));
	selectmenu->setPosition(Vec2(_visibleSize.width / 2, _visibleSize.height / 3 ));
	this->addChild(startmenu);
	this->addChild(selectmenu);*/
	auto background = Sprite::createWithSpriteFrameName("block.png");
	background->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/2));
	this->addChild(background,1);
	MenuItemImage* startmenu = MenuItemImage::create("btn-start.png", "btn-start-down.png", this, menu_selector(GameMenu::menuCloseCallBack));
	startmenu->setTag(1);
	MenuItemImage* selectmenu = MenuItemImage::create("btn-select.png", "btn-select-down.png", this, menu_selector(GameMenu::menuCloseCallBack));
	selectmenu->setTag(2);
	Menu* Tmenu = Menu::create(startmenu,selectmenu,NULL);
	Tmenu->alignItemsVerticallyWithPadding(20);
	Tmenu->setPosition(Vec2(_visibleSize.width/2,_visibleSize.height/2));
	this->addChild(Tmenu,2);
    return true;
}

void GameMenu::menuCloseCallBack(Ref* pSender)
{
	int tag = ((MenuItemImage*)pSender) ->getTag();
	if (tag==2)
	{
		Director::getInstance()->replaceScene(TransitionSlideInR::create(1.0f,LevelManager::createScene()));
	}
	else
	{
		Director::getInstance()->replaceScene(TransitionSlideInR::create(1.0f, GameScene::createSceneWithLevel(1)));
	}
}


