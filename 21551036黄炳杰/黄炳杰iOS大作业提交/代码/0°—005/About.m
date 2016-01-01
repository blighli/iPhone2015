//
//  About.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "About.h"
#import "StartGameScene.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
//#import "Constants.h"

@implementation About

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];//autorelease object
    
    About *layer = [About node];//autorelease object
    
    [scene addChild:layer];
    
    return scene;
    
}



//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionSlideInL transitionWithDuration:0.1f scene:[StartGameScene scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}

//添加返回按钮
-(void)addBackItem{
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"back.png" selectedImage:@"back.png" target:self selector:@selector(backToStart)];
    CCMenu *menuButton = [CCMenu menuWithItems:backButton, nil];
    
    //位置以后再调
    menuButton.position = ccp(screenSize.width * 0.1, screenSize.height * 0.9);
    [self addChild:menuButton];
}



//添加背景图片
-(void)addBg{
    
    screenSize = [CCDirector sharedDirector].winSize;
    CCSprite *bg;
    bg = [CCSprite spriteWithFile:@"bg_set.png"];
    
    bg.position = ccp(screenSize.width/2,screenSize.height/2);
    [self addChild:bg z:-1];
    
}
//添加背景音乐
-(void)addBgMusic{
    GameData *data = [GameData sharedData];
    if (data.backgroundMusicMuted == NO) {
        if ([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO)
        {
            [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bg_startGameScene.mp3" loop:YES];
        }
    }
}

//添加文字标签
////以后修改
-(void) addTextLabel{
    
    
    CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"齐鲁软件大赛参赛作品\n 小组成员:\n 队长: 付明鑫\n 程序设计: 黄炳杰、付明鑫 \n 美工设计: 刘俏君" fontName:@"Arial" fontSize:20];
    label1.position = ccp(screenSize.width / 2, screenSize.height *0.8);
    [label1 runAction:[CCSequence actions:[CCMoveTo actionWithDuration:10.0f position:ccp(screenSize.width / 2, screenSize.height * 0.5)],[CCScaleTo actionWithDuration:3.0f scale:1.00], nil]];
    [self addChild:label1];
}

//添加菜单选项  给我们发邮件反馈
-(void)mailToWe{
    NSURL *url = [NSURL URLWithString:@"mailto://347199174@qq.com"];
    [[UIApplication sharedApplication]openURL:url];
    
}


-(void)addMailToWeMenu{
    CCMenuItem *mailToWeItem = [CCMenuItemImage itemWithNormalImage:@"email.png" selectedImage:@"email.png" target:self selector:@selector(mailToWe)];
    mailToWeItem.position = ccp(screenSize.width * 0.9, screenSize.height * 0.8);
    mailToWeItem.scale = 0.5;
    [mailToWeItem runAction:[CCScaleTo actionWithDuration:3.0f scale:1.1]];
    CCMenu *menu = [CCMenu menuWithItems:mailToWeItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu];
    
}



#pragma mark 场景初始化

-(id) init
{
    if ((self = [super init])) {
        [self addBg];
        
        [self addBgMusic];
        [self addTextLabel];
        [self addMailToWeMenu];
        [self addBackItem];
    }
    return self;
}



@end
