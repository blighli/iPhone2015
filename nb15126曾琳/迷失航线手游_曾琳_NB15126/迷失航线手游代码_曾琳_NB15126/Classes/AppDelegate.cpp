#include "AppDelegate.h"
#include "HelloWorldScene.h"

USING_NS_CC;

AppDelegate::AppDelegate() {

}

AppDelegate::~AppDelegate() 
{
}

bool AppDelegate::applicationDidFinishLaunching() {
    // initialize director
    auto director = Director::getInstance();
    auto glview = director->getOpenGLView();
    if(!glview) {
        glview = GLViewImpl::createWithRect("My game", Rect(0, 0, 320, 480));
        director->setOpenGLView(glview);
		//glview->setFrameSize(320, 480);
    }

    // turn on display FPS
    director->setDisplayStats(true);

	//设置分辨率大小
	auto a = Size(320, 480);

	//设置资源大小
	auto b = Size(640, 960);

	//设置场景大小
	director->setContentScaleFactor(b.width/a.width);

	//规定屏幕适应规则
	glview->setDesignResolutionSize(a.width, a.height, ResolutionPolicy::FIXED_WIDTH);



	
	std::vector<std::string> searchPaths;
	searchPaths.push_back("hd");

	auto searchPath = FileUtils::getInstance();
	searchPath->setSearchPaths(searchPaths);

	





    // set FPS. the default value is 1.0/60 if you don't call this
    director->setAnimationInterval(1.0 / 60);

    // create a scene. it's an autorelease object
    auto scene = HelloWorld::createScene();

    // run
    director->runWithScene(scene);

    return true;
}

// This function will be called when the app is inactive. When comes a phone call,it's be invoked too
void AppDelegate::applicationDidEnterBackground() {
    Director::getInstance()->stopAnimation();

    // if you use SimpleAudioEngine, it must be pause
    // SimpleAudioEngine::getInstance()->pauseBackgroundMusic();
}

// this function will be called when the app is active again
void AppDelegate::applicationWillEnterForeground() {
    Director::getInstance()->startAnimation();

    // if you use SimpleAudioEngine, it must resume here
    // SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
}
