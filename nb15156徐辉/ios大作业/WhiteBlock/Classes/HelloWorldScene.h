#ifndef __HELLOWORLD_SCENE_H__
#define __HELLOWORLD_SCENE_H__

#include "cocos2d.h"
#include "Block.hpp"

USING_NS_CC;

class HelloWorld : public cocos2d::Layer
{
    
private:
    Size visibleSize;//获取屏幕大小
    int linesCount;
    bool showEnd;
    Label *timerLabel;
    Node *gameLayer;
    bool timerRunning;
    long startTime;
    
public:
    static cocos2d::Scene* createScene();

    virtual bool init();
    
    // a selector callback
    void menuCloseCallback(cocos2d::Ref* pSender);
    
    // implement the "static create()" method manually
    CREATE_FUNC(HelloWorld);
    
    void addStartLine();
    void addEndLine();
    void addNormalLine(int lineIndex);
    void moveDown();
    void startGame();
    void startTimer();
    void stopTimer();
    virtual void update(float dt);
};

#endif // __HELLOWORLD_SCENE_H__
