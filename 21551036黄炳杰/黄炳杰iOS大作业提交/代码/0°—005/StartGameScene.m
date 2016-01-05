//
//  StartGameScene.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "StartGameScene.h"
#import "SimpleAudioEngine.h"//音乐 音效
#import "About.h"//关于
#import "SetGame.h"
#import "GameData.h"//游戏数据
//#import "Constants.h"  //游戏常量
#import "ChapterSelect.h"

@implementation StartGameScene

+(id)scene{
    
    CCScene *scene =[CCScene node];
    StartGameScene *layer = [StartGameScene node];
    [scene addChild:layer];
    return scene;
    
}

//****
-(void)soundEffect:(id)sender{
    [[SimpleAudioEngine sharedEngine] playEffect:@"sound.caf"];
}

//****

//游戏菜单项

//添加游戏菜单项
-(void)addPlayItem{
    
    screenSize = [CCDirector sharedDirector].winSize;
    
    
    playItem = [CCMenuItemImage itemWithNormalImage:@"button_begin.png" selectedImage:nil target:self selector:@selector(startGame)];
    
    
    
    playItem.position = ccp(screenSize.width * 0.12,screenSize.height * 0.585);
    playItem.scale = 0.8;
    //[playItem runAction:[CCScaleTo actionWithDuration:2.0f scale:0.9]];
    
    
    CCMenu *menu =[CCMenu menuWithItems:playItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu];
    
}

//添加about菜单项
-(void)addAboutItem{
    screenSize = [CCDirector sharedDirector].winSize;
    
    aboutItem = [CCMenuItemImage itemWithNormalImage:@"about.png" selectedImage:@"about.png" target:self selector:@selector(about)];
    aboutItem.position =ccp(screenSize.width * 0.1,screenSize.height * 0.24);
    aboutItem.scale = 0.85;
    CCMenu *menu =[CCMenu menuWithItems:aboutItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu];
    
}

-(void)addSetItem{
    screenSize = [CCDirector sharedDirector].winSize;
    
    setItem = [CCMenuItemImage itemWithNormalImage:@"button_set.png" selectedImage:@"button_set.png" target:self selector:@selector(setGame)];
    setItem.position =ccp(screenSize.width * 0.1,screenSize.height * 0.42);
    CCMenu *menu =[CCMenu menuWithItems:setItem, nil];
    menu.position = CGPointZero;
    [self addChild:menu];
    
}






-(void) startGame{    
    //CCLOG(@"进入场景选择界面");
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionSlideInR transitionWithDuration:0.2f scene:[ChapterSelect scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}

//进入游戏介绍画面
-(void)about{
  
    //NSLog(@"进入关于界面");
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionSlideInL transitionWithDuration:0.2f scene:[About scene]];
    [[CCDirector sharedDirector]replaceScene:trans];

}

//进入游戏设置画面
-(void)setGame{
    //NSLog(@"进入设置界面");
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionSlideInB transitionWithDuration:0.2f scene:[SetGame scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
    
}



//添加背景图片
-(void)addBackground{
    
    screenSize= [CCDirector sharedDirector].winSize;
    //以后有时间添加 判断设备型号 iphone itouch ipad
    bgGameStart = [CCSprite spriteWithFile:@"bg_startGameScene.png"];
    bgGameStart.position = ccp(screenSize.width / 2, screenSize.height / 2);
    [self addChild:bgGameStart];
}


//添加背景音乐

-(void) playBackgroundMusic{
    [[CDAudioManager sharedManager] setMode:kAMM_FxPlusMusicIfNoOtherAudio];//如果别的应用正在播放音乐 ，不播放游戏音乐
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
    GameData *data = [GameData sharedData];
    if (data.backgroundMusicMuted == NO) {
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_startGameScene.mp3" loop:YES];
        [CDAudioManager sharedManager].backgroundMusic.volume = 0.5f;
        
    }
}





//场景初始化

-(id)init{
    if ((self = [super init])) {
        [self addBackground];
        [self addPlayItem];
        [self addSetItem];
        [self addAboutItem];
        [self playBackgroundMusic];
    }
    return self;
}





@end
