//
//  SettingScene.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/29.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "SettingScene.h"
#import "cocos2d-ui.h"
#import "cocos2d.h"
#import "GameManager.h"

@implementation SettingScene : CCScene

- (id)init
{
    self = [super init];
    
    NSAssert(self, @"Whoops");
    
    CGSize win_size = [CCDirector sharedDirector].viewSize;
    
    manager = [GameManager sharedInstanceMethod];
    testAudio = [OALSimpleAudio sharedInstance];
    
    //返回按钮
    CCSpriteFrame *backImg = [CCSpriteFrame frameWithImageNamed:@"back.png"];
    CCButton* backBtn = [CCButton buttonWithTitle:@"" spriteFrame:backImg];
    backBtn.anchorPoint = ccp(1,1);
    backBtn.scale = 0.5;
    backBtn.position = ccp(win_size.width-50, win_size.height-50);
    [backBtn setTarget:self selector:@selector(backToStartScene)];
    [self addChild:backBtn];
    
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"音效" fontName:@"ArialMT" fontSize:40];
    [label1 setPosition:ccp(win_size.width/2, win_size.height/2-140)];
    CCButton* voiceUp1 = [CCButton buttonWithTitle:@"＋" fontName:@"ArialMT" fontSize:30];
    [voiceUp1 setTarget:self selector:@selector(voiceUp)];
    
    voice = [GameManager sharedInstanceMethod].voice;
    voiceLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i",(int)(voice*100)] fontName:@"ArialMT" fontSize:30];
    
    CCButton* voiceDown1 = [CCButton buttonWithTitle:@"－" fontName:@"ArialMT" fontSize:30];
    [voiceDown1 setTarget:self selector:@selector(voiceDown)];
    
    CCLayoutBox* layout1 = [[CCLayoutBox alloc]init];
    [layout1 addChild:voiceDown1];
    [layout1 addChild:voiceLabel];
    [layout1 addChild:voiceUp1];
    [layout1 setAnchorPoint:(CGPoint){0.5,0.5}];
    layout1.spacing = 20.f;
    [layout1 setPosition:ccp(win_size.width/2, win_size.height/2-100)];
    
    [self addChild:label1];
    [self addChild:layout1];
    
    CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"背景音乐" fontName:@"ArialMT" fontSize:40];
    [label2 setPosition:ccp(win_size.width/2, win_size.height/2+60)];
    
    CCButton* voiceUp2 = [CCButton buttonWithTitle:@"＋" fontName:@"ArialMT" fontSize:30];
    [voiceUp2 setTarget:self selector:@selector(bgVoiceUp)];
    
    bgVoice = [GameManager sharedInstanceMethod].bgVoice;
    bgVoiceLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%i",(int)(bgVoice*100)] fontName:@"ArialMT" fontSize:30];
    
    CCButton* voiceDown2 = [CCButton buttonWithTitle:@"－" fontName:@"ArialMT" fontSize:30];
    [voiceDown2 setTarget:self selector:@selector(bgVoiceDown)];
    
    CCLayoutBox* layout2 = [[CCLayoutBox alloc]init];
    [layout2 addChild:voiceDown2];
    [layout2 addChild:bgVoiceLabel];
    [layout2 addChild:voiceUp2];
    [layout2 setAnchorPoint:(CGPoint){0.5,0.5}];
    layout2.spacing = 20.f;
    [layout2 setPosition:ccp(win_size.width/2, win_size.height/2+100)];
    
    [self addChild:label2];
    [self addChild:layout2];
    
    return self;
}

- (void) voiceUp
{
    voice = voice+0.5;
    [GameManager sharedInstanceMethod].voice = voice;
    [voiceLabel setString:[NSString stringWithFormat:@"%i",(int)(voice*100)]];
    [manager.audio setEffectsVolume:voice];
    [testAudio setEffectsVolume:voice];
    [testAudio playEffect:@"test.wav"];
}

- (void) voiceDown
{
    if (voice>=0.5) {
        voice = voice-0.5;
    }
    [GameManager sharedInstanceMethod].voice = voice;
    [voiceLabel setString:[NSString stringWithFormat:@"%i",(int)(voice*100)]];
    [manager.audio setEffectsVolume:voice];
    [testAudio setEffectsVolume:voice];
    [testAudio playEffect:@"test.wav"];
}

- (void) bgVoiceUp
{
    bgVoice = bgVoice+0.5;
    [GameManager sharedInstanceMethod].bgVoice = bgVoice;
    [bgVoiceLabel setString:[NSString stringWithFormat:@"%i",(int)(bgVoice*100)]];
    [manager.audio setEffectsVolume:bgVoice];
    [testAudio setBgVolume:bgVoice];
    [testAudio playEffect:@"test.wav"];
}

- (void) bgVoiceDown
{
    if (bgVoice>=0.5) {
        bgVoice = bgVoice-0.5;
    }
    [GameManager sharedInstanceMethod].bgVoice = bgVoice;
    [bgVoiceLabel setString:[NSString stringWithFormat:@"%i",(int)(bgVoice*100)]];
    [manager.audio setEffectsVolume:bgVoice];
    [testAudio setBgVolume:bgVoice];
    [testAudio playEffect:@"test.wav"];
}

- (void) backToStartScene
{
    [[OALSimpleAudio sharedInstance] playEffect:@"btnClick.wav"];
    [[CCDirector sharedDirector]popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:1]];
}

@end
