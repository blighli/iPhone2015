//
//  SelectScene.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/3.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "SelectScene.h"
#import "MainGameScene.h"
#import "cocos2d-ui.h"
#import "cocos2d.h"

@implementation SelectScene

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    
    manager = [GameManager sharedInstanceMethod];
    
    CGSize win_size = [CCDirector sharedDirector].viewSize;
    
    // Background
    CGSize imageSize={480,860};
    CCSprite* background = [CCSprite spriteWithImageNamed:@"SelectScene_bg.png"];
    background.anchorPoint=ccp(0, 0);
    background.scaleX=win_size.width/imageSize.width;
    background.scaleY=win_size.height/imageSize.height;
    [self addChild:background];
    
    // The standard Hello World text
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"请选择您的游戏主角：" fontName:@"ArialMT" fontSize:25];
    [label setAnchorPoint:(CGPoint){0.5,0.5}];
    label.position = ccp(win_size.width/2, win_size.height-100);
    [self addChild:label];
    
    // 游戏开始菜单
    CCButton *plane1Btn = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"plane1.png"]];
    [plane1Btn setScale:0.6];
    [plane1Btn setTarget:self selector:@selector(enterMainGameWithPlane1)];
    CCButton *plane2Btn = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"plane2.png"]];
    [plane2Btn setScale:0.6];
    [plane2Btn setTarget:self selector:@selector(enterMainGameWithPlane2)];
    CCButton *plane3Btn = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"plane3.png"]];
    [plane3Btn setScale:0.6];
    [plane3Btn setTarget:self selector:@selector(enterMainGameWithPlane3)];
    
    CCLayoutBox *layout = [[CCLayoutBox alloc]init];
    [layout addChild:plane1Btn];
    [layout addChild:plane2Btn];
    [layout addChild:plane3Btn];
    layout.spacing = 2.f;
    [layout setAnchorPoint:(CGPoint){0.5,0.5}];
    layout.direction = CCLayoutBoxDirectionVertical;
    [layout setPosition:ccp(win_size.width/2, win_size.height/2)];
    
    [self addChild:layout];
    // done
    return self;
}

- (void) enterMainGameWithPlane1
{
    [manager.audio playEffect:@"btnClick.wav"];
    CCScene* mainGameScene = [[MainGameScene alloc]initWithPlane:1];
    [[CCDirector sharedDirector] replaceScene:mainGameScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

- (void) enterMainGameWithPlane2
{
    [manager.audio playEffect:@"btnClick.wav"];
    CCScene* mainGameScene = [[MainGameScene alloc]initWithPlane:2];
    [[CCDirector sharedDirector] replaceScene:mainGameScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

- (void) enterMainGameWithPlane3
{
    [manager.audio playEffect:@"btnClick.wav"];
    CCScene* mainGameScene = [[MainGameScene alloc]initWithPlane:3];
    [[CCDirector sharedDirector] replaceScene:mainGameScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

@end
