#include "Splash.h"
#include "../Start/Start.h"

bool Splash::init()
{
	if (!Layer::init())
	{
		return false;
	}
	// init splash scene 

	// laod scene csd file
	auto rootNode = CSLoader::createNode("game-splash.csb");
	addChild(rootNode);

	// load action
	auto action = CSLoader::createTimeline("game-splash.csb");
	rootNode->runAction(action);

	// run action by frame
	action->gotoFrameAndPlay(0, 30, false);

	// set frame event callback : lasr frame
	// another: setFrameEventCallFunc
	action->setLastFrameCallFunc(CC_CALLBACK_0(Splash::onFrameEvent, this));

	return true;
}

// frame event callback
void Splash::onFrameEvent()
{
	// jump to start scene
    Director::getInstance()->replaceScene(TransitionProgressOutIn::create(0.5, Start::createScene()));
}

Scene* Splash::createScene()
{
	auto scene = Scene::create();
	auto layer = Splash::create();
	scene->addChild(layer);
	return scene;
}

