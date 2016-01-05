#include "HelloWorldScene.h"

USING_NS_CC;

Scene* HelloWorld::createScene()
{
	// 'scene' is an autorelease object
	log("createScene");
	auto scene = Scene::create();

	// 'layer' is an autorelease object
	auto layer = HelloWorld::create();

	// add layer as a child to scene
	scene->addChild(layer);

	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
	//////////////////////////////
	// 1. super init first
	if (!Layer::init())
	{
		return false;
	}

	Size visibleSize = Director::getInstance()->getVisibleSize();
	//Vec2 origin = Director::getInstance()->getVisibleOrigin();
	///////////////////////////////////////////////
	
	auto bg = TMXTiledMap::create("map/red_bg.tmx");
	
	
	// add the sprite as a child to this layer
	this->addChild(bg);
	
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("texture/loading_textrue.plist");
	auto a = Sprite::createWithSpriteFrameName("logo.png");
	this->addChild(a);
	a->setPosition(Vec2(visibleSize.width / 2, visibleSize.height / 2 + 100));


	auto loding1 = Sprite::createWithSpriteFrameName("loding1.png");
	loding1->setPosition(Vec2(visibleSize.width / 2, visibleSize.height/2 -50));
	addChild(loding1);
	log("addchiled called");







	Animation* animation = Animation::create();
	for (int i = 1; i <= 4; i++)
	{
		__String* frameName = __String::createWithFormat("loding%d.png", i);
		SpriteFrame* spriteFrame = SpriteFrameCache::getInstance()->getSpriteFrameByName(frameName->getCString());
		animation->addSpriteFrame(spriteFrame);
	}
	animation->setDelayPerUnit(0.35f);
	animation->setRestoreOriginalFrame(true);

	Animate* animate = Animate::create(animation);

	loding1->runAction(RepeatForever::create(animate));
	log("action over");
	//动画结束
	//将图片转为texture 
	//以下这句是将图片放入cache中，并将这幅图变成texture放入gameplay中

	
	
	auto gamePlay = TextureCache::getInstance()->addImage("texture/gameplay_textrue.png");
	auto home = TextureCache::getInstance()->addImage("texture/home_textrue.png");
	auto loading = TextureCache::getInstance()->addImage("texture/loading_textrue.png");
	auto setting = TextureCache::getInstance()->addImage("texture/setting_textrue.png");
	log("addImage over");

	//将texture与相应的plist文件相连。(利用SpriteFrameCache)（论文题材中有对spriteFramecache的详解）  //这些xxcache最后都要记得进行删除。
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("texture/gameplay_textrue.plist",gamePlay);
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("texture/home_textrue.plist",home);
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("texture/loading_textrue.plist",loading);
	SpriteFrameCache::getInstance()->addSpriteFramesWithFile("texture/setting_textrue.plist",setting);
	log("plist and testure bund over");

	



	//跳转到主页面,这句结束后会调用HelloWorld的onExit函数

	this->schedule(schedule_selector(HelloWorld::delayCall), 1, 1, 3);


	



	
	


















	
	return true;
}


void HelloWorld::onExit()
{
	Layer::onExit();
	//释放loading场景里面之后不用的精灵(删除loading的plist文件和对应的存成了texture文件的png)
	SpriteFrameCache::getInstance()->removeSpriteFramesFromFile("texture/loding_textrue.plist");
	TextureCache::getInstance()->removeTextureForKey("loading_textrue.png");
	this->unschedule(schedule_selector(HelloWorld::delayCall));





}

/*
void HelloWorld::loadingTextureCallBack()
{
	log("aaa");
	SpriteFrameCache::getInstance()->removeSpriteFramesFromFile("texture/loading_textrue.plist");
	Director::getInstance()->getTextureCache()->removeTextureForKey("texture/loading_textrue.png");
	log("finally");

}

*/






void HelloWorld::delayCall(float a)
{
	auto scene = HomeLayer::createScene();
	Director::getInstance()->replaceScene(scene);
}

