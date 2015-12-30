//
//  HelloWorldScene.m
//
//  Created by : Anglet
//  Project    : PlaneShotting
//  Date       : 15/12/1
//
//  Copyright (c) 2015年 Anglet.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import "StartScene.h"
#import "MainGameScene.h"
#import "SelectScene.h"
#import "RecordScene.h"
#import "SettingScene.h"

@implementation StartScene


- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    
//    OALSimpleAudio* audio = [OALSimpleAudio sharedInstance];
//    [audio preloadBg:@"Audio/menu-music.m4a" seekTime:0.0];
    
    CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    // Background
    CGSize imageSize={480,860};
    CCSprite* background = [CCSprite spriteWithImageNamed:@"StartScene_bg.png"];
    background.anchorPoint=ccp(0, 0);
    background.scaleX=winSize.width/imageSize.width;
    background.scaleY=winSize.height/imageSize.height;
    [self addChild:background];
    
    // The standard Hello World text
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"飞机大战" fontName:@"ArialMT" fontSize:60];
    [label setAnchorPoint:(CGPoint){0.5,0.5}];
    label.position = ccp(winSize.width/2, winSize.height/2+100);
    [self addChild:label];
    
    // 游戏开始菜单
    CCButton *startBtn = [CCButton buttonWithTitle:@"开始" fontName:@"ArialMT" fontSize:30];
    [startBtn setTarget:self selector:@selector(enterMainGameScene)];
    CCButton *recordBtn = [CCButton buttonWithTitle:@"排行榜" fontName:@"ArialMT" fontSize:30];
    [recordBtn setTarget:self selector:@selector(enterRecordScene)];
    CCButton *settingBtn = [CCButton buttonWithTitle:@"设置" fontName:@"ArialMT" fontSize:30];
    [settingBtn setTarget:self selector:@selector(enterSettingScene)];
    
    CCLayoutBox *layout = [[CCLayoutBox alloc]init];
    [layout addChild:settingBtn];
    [layout addChild:recordBtn];
    [layout addChild:startBtn];
    layout.spacing = 10.f;
    [layout setAnchorPoint:(CGPoint){0.5,0.5}];
    layout.direction = CCLayoutBoxDirectionVertical;
    [layout setPosition:ccp(winSize.width/2, winSize.height/2-50)];
    
    [self addChild:layout];
    // done
    return self;
}

-(void) enterMainGameScene
{
    [[OALSimpleAudio sharedInstance] playEffect:@"btnClick.wav"];
    CCScene* selectScene = [[SelectScene alloc]init];
    [[CCDirector sharedDirector]pushScene:selectScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

-(void) enterRecordScene
{
    [[OALSimpleAudio sharedInstance] playEffect:@"btnClick.wav"];
    CCScene* recordScene = [[RecordScene alloc]init];
    [[CCDirector sharedDirector]pushScene:recordScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

-(void) enterSettingScene
{
    [[OALSimpleAudio sharedInstance] playEffect:@"btnClick.wav"];
    CCScene* settingScene = [[SettingScene alloc]init];
    [[CCDirector sharedDirector]pushScene:settingScene withTransition:[CCTransition transitionFadeWithDuration:1]];
}

@end























// why not add a few extra lines, so we dont have to sit and edit at the bottom of the screen ...
