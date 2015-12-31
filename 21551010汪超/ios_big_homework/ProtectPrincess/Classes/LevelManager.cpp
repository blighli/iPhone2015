#include"LevelManager.h"
#include "GameScene.h"
Scene* LevelManager::createScene()
{
	auto scene = Scene::create();
	auto layer = LevelManager::create();
	scene->addChild(layer);
	return scene;
}

bool LevelManager::init()
{
	if (!Layer::init())
	{
		return false;
	}
	Size visibleSize = Director::getInstance()->getVisibleSize();
	Vec2 origin = Director::getInstance()->getVisibleOrigin();
	_selectedLevelIndex = 0;
	auto pageView = PageView::create();
	pageView->setContentSize(Size(480.0f,320.0f));
	pageView->setAnchorPoint(Vec2(0.5,0.5));
	pageView->setPosition(Vec2(visibleSize.width/2,visibleSize.height/2));
	for (int i = 0; i < 3;++i)
	{
		Layout* layout = Layout::create();
		layout->setContentSize(Size(480.0f,320.0f));
		ImageView* _imageView = ImageView::create(StringUtils::format("preview%d.png",i+1));
		_imageView->setContentSize(Size(480.0f,320.0f));
		_imageView->setPosition(Vec2(layout->getContentSize().width/2.f,layout->getContentSize().height/2.f));
		layout->addChild(_imageView);
		pageView->insertPage(layout,i);
	}
	pageView->addEventListener([=](Ref* pSender,PageView::EventType type){
		switch (type)
		{
		case PageView::EventType::TURNING:
		{
				PageView* pageView = dynamic_cast<PageView*>(pSender);
				_selectedLevelIndex = pageView->getCurPageIndex();
		}
			break;
		default:
			break;
		}
	});
	this->addChild(pageView,1);
	auto start_button = Button::create("btn-start.png");
	start_button->setPosition(Vec2(visibleSize.width/2,visibleSize.height*0.2));
	start_button->addTouchEventListener([=](Ref* pSender, Widget::TouchEventType type)
	{
		if (type==Widget::TouchEventType::ENDED)
		{
			auto transition = TransitionSlideInR::create(1.5,GameScene::createSceneWithLevel(++_selectedLevelIndex));
			Director::getInstance()->pushScene(transition);
		}
	});
	this->addChild(start_button, 1);
	return true;
}