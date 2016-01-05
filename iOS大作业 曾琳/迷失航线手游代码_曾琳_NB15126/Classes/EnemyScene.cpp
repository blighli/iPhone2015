#include "EnemyScene.h"

USING_NS_CC;

Scene* Enemy::createScene()
{
	// 'scene' is an autorelease object
	log("createScene");
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = Enemy::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool Enemy::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();
	//Vec2 origin = Director::getInstance()->getVisibleOrigin();
	return true;
}