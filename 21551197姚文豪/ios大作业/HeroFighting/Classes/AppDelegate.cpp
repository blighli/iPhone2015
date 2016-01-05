#include "AppDelegate.h"
#include "MainScene.h"
#include "SimpleAudioEngine.h"

USING_NS_CC;
using namespace CocosDenshion;

AppDelegate::AppDelegate() {

}

AppDelegate::~AppDelegate() 
{
}

//if you want a different context,just modify the value of glContextAttrs
//it will takes effect on all platforms
void AppDelegate::initGLContextAttrs()
{
    //set OpenGL context attributions,now can only set six attributions:
    //red,green,blue,alpha,depth,stencil
    GLContextAttrs glContextAttrs = {8, 8, 8, 8, 24, 8};

    GLView::setGLContextAttrs(glContextAttrs);
}

bool AppDelegate::applicationDidFinishLaunching() {
    // initialize director
    auto director = Director::getInstance();
    auto glview = director->getOpenGLView();
    if(!glview) {
        glview = GLViewImpl::createWithRect("HeroFighting", Rect(0, 0, 960, 640));
        director->setOpenGLView(glview);
    }

    director->getOpenGLView()->setDesignResolutionSize(960, 640, ResolutionPolicy::SHOW_ALL);

    //// turn on display FPS
    //director->setDisplayStats(true);

    //// set FPS. the default value is 1.0/60 if you don't call this
    //director->setAnimationInterval(1.0 / 60);

    FileUtils::getInstance()->addSearchPath("res");
	FileUtils::getInstance()->addSearchPath("res/player");
	FileUtils::getInstance()->addSearchPath("res/monster");
	FileUtils::getInstance()->addSearchPath("res/control_button");
	FileUtils::getInstance()->addSearchPath("res/skill_button");
	FileUtils::getInstance()->addSearchPath("res/hp");
	FileUtils::getInstance()->addSearchPath("res/option_setting");
	FileUtils::getInstance()->addSearchPath("res/about_game");
	FileUtils::getInstance()->addSearchPath("res/sound");
	FileUtils::getInstance()->addSearchPath("res/font");

	//judge the ini file if it exits
	if (!UserDefault::getInstance()->isXMLFileExist())
	{
		UserDefault::getInstance()->setBoolForKey("BkgMusic", true);
		UserDefault::getInstance()->setBoolForKey("Effect", true);
	}
    // create a scene. it's an autorelease object
    auto scene = MainScene::createScene();

    // run
    director->runWithScene(scene);

    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground() {
    Director::getInstance()->stopAnimation();

    // if you use SimpleAudioEngine, it must be pause
    SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground() {
    Director::getInstance()->startAnimation();

    // if you use SimpleAudioEngine, it must resume here
    SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
}
