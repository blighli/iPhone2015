#include "Loading.h"
#include "../GameScene/GameScene.h"

bool Loading::init()
{
	if (!Layer::init())
	{
		return false;
	}

	m_index = 0;
	auto window_width = Director::getInstance()->getVisibleSize().width;
	auto window_height = Director::getInstance()->getVisibleSize().height;
	// autoload resources plist
	this->schedule(schedule_selector(Loading::loadResources), 0.2f);

	Sprite* background = Sprite::create("LoadingSlider/sliderBackground.png");
	Sprite* pogress = Sprite::create("LoadingSlider/sliderProgress.png");
	Sprite* button = Sprite::create("LoadingSlider/sliderButton.png");

	m_Slider = ControlSlider::create(background, pogress, button);
    m_Slider->setScale(3.0f);
	m_Slider->setPosition(Vec2(window_width*0.5, window_height*0.5));
	m_Slider->setMaximumAllowedValue(1.2f);
	m_Slider->setMinimumAllowedValue(0.0f);
	m_Slider->setValue(0);
	this->addChild(m_Slider);

	this->schedule(schedule_selector(Loading::updateSlider), 0.2f);

	return true;
}

Scene* Loading::createScene()
{
	auto scene = Scene::create();
	auto layer = Loading::create();
	scene->addChild(layer);
	return scene;
}

void Loading::loadResources(float t)
{
	switch (m_index) {
	case 0:
	{
		auto spriteFrameCache = SpriteFrameCache::getInstance();
		spriteFrameCache->addSpriteFramesWithFile("paint/paint.plist");
	}
	break;

	case 1:
		//SpriteFrameCache::getInstance()->addSpriteFramesWithFile("pictures/gatechoice.plist");
		break;

	case 2:
		//SpriteFrameCache::getInstance()->addSpriteFramesWithFile("pictures/Itemchoose.plist");
		break;

	case 3:
		//SpriteFrameCache::getInstance()->addSpriteFramesWithFile("pictures/gatescene0.plist");
		break;

	case 4:
		//SpriteFrameCache::getInstance()->addSpriteFramesWithFile("pictures/rubbish.plist");
		break;

	case 5:
		//SpriteFrameCache::getInstance()->addSpriteFramesWithFile("pictures/test.plist");
		break;

	case 6:
		// after load resources ,change to game scene
		Director::getInstance()->replaceScene(GameScene::createScene(GameMode::Classical, 1));
		break;
	}
	m_index++;
}

void Loading::updateSlider(float t)
{
	float sliderValue = m_Slider->getValue();
	sliderValue += 0.2f;
	m_Slider->setValue(sliderValue);
}
