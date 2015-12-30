//
//  GameOverScene.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/3.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "GameOverScene.h"
#import "GameManager.h"
#import "cocos2d.h"
#import "cocos2d-ui.h"

@implementation GameOverScene

- (id)initWithScore:(int)score
{
    self = [super init];
    
    NSAssert(self, @"Whoops");
    
    CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"游戏结束" fontName:@"ArialMT" fontSize:60];
    [label setAnchorPoint:(CGPoint){0.5,0.5}];
    label.position = ccp(winSize.width/2, winSize.height/2+100);
    [self addChild:label];
    
    CCLabelTTF *scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"得分：%i",score] fontName:@"ArialMT" fontSize:45];
    scoreLabel.color = [CCColor colorWithRed:1.0 green:0 blue:0];
    
    CCButton* startSceneBtn = [CCButton buttonWithTitle:@"返回主界面" fontName:@"ArialMT" fontSize:30];
    [startSceneBtn setTarget:self selector:@selector(enterStartScene)];
    
    CCLayoutBox* layout = [[CCLayoutBox alloc]init];
    [layout addChild:startSceneBtn];
    [layout addChild:scoreLabel];
    [layout setSpacing:30];
    [layout setAnchorPoint:(CGPoint){0.5,0.5}];
    layout.direction = CCLayoutBoxDirectionVertical;
    [layout setPosition:ccp(winSize.width/2, winSize.height/2-50)];
    
    [self addChild:layout];
    
    return self;
}

- (void) enterStartScene
{
    GameManager *manager = [GameManager sharedInstanceMethod];
    [manager.audio playEffect:@"btnClick.wav"];
    [[CCDirector sharedDirector]popSceneWithTransition:[CCTransition transitionFadeWithDuration:1]];
}

@end
