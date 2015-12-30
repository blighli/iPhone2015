//
//  RecordScene.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/9.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "RecordScene.h"
#import "GameManager.h"
#import "cocos2d.h"
#import "cocos2d-ui.h"

@implementation RecordScene

- (id)init
{
    self = [super init];
    
    NSAssert(self, @"Whoops");
    
    CGSize win_size = [CCDirector sharedDirector].viewSize;
    
    CCLabelTTF *title = [CCLabelTTF labelWithString:@"排行榜" fontName:@"ArialMT" fontSize:40];
    [title setAnchorPoint:(CGPoint){0.5,0.5}];
    
    CCLayoutBox *layout = [[CCLayoutBox alloc]init];
    
    //返回按钮
    CCSpriteFrame *backImg = [CCSpriteFrame frameWithImageNamed:@"back.png"];
    CCButton* backBtn = [CCButton buttonWithTitle:@"" spriteFrame:backImg];
    backBtn.anchorPoint = ccp(1,1);
    backBtn.scale = 0.5;
    backBtn.position = ccp(win_size.width-50, win_size.height-50);
    [backBtn setTarget:self selector:@selector(backToStartScene)];
    
    [self addChild:backBtn];
    
    //读取历史成绩
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",documentsDirectory,@"HighScore.plist"];
    
    NSMutableDictionary* plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    
    NSMutableArray *highScoreArray = [plistDict objectForKey:@"HighScore"];
    
    if (plistDict != nil && highScoreArray != nil)
    {
        for (int i = 4;i >= 0 ;i --) {
            CCLabelTTF *scoreLabel;
            if(i <= ((int)[highScoreArray count]-1))
            {
                NSInteger score = [[highScoreArray objectAtIndex:i]integerValue];
                scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"排名%d:   %ld",i+1,(long)score] fontName:@"ArialMT" fontSize:20];
            }
            else
            {
                scoreLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"排名%d:",i+1] fontName:@"ArialMT" fontSize:20];
            }
            [layout addChild:scoreLabel];
        }
    }
    
    [layout addChild:title];
    layout.spacing = 10.f;
    [layout setAnchorPoint:(CGPoint){0.5,0}];
    layout.direction = CCLayoutBoxDirectionVertical;
    [layout setPosition:ccp(win_size.width/2, win_size.height/2-100)];
    
    [self addChild:layout];
    
    return self;
}

- (void) backToStartScene
{
    GameManager *manager = [GameManager sharedInstanceMethod];
    [manager.audio playEffect:@"btnClick.wav"];
    [[CCDirector sharedDirector]popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:1]];
}

@end
