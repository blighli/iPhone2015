//
//  SetGame.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "SetGame.h"

#import "StartGameScene.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
//#import "Constants.h"
@implementation SetGame

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];//autorelease object
    
    SetGame *layer = [SetGame node];//autorelease object
    
    [scene addChild:layer];
    
    return scene;
    
}



//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine] playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionSlideInR transitionWithDuration:0.1f scene:[StartGameScene scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}



//添加返回按钮
-(void)addBackItem{
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"back.png" selectedImage:@"back.png" target:self selector:@selector(backToStart)];
    CCMenu *menuButton = [CCMenu menuWithItems:backButton, nil];
    
    //位置以后再调
    menuButton.position = ccp(screenSize.width * 0.1, screenSize.height * 0.9);
    [self addChild:menuButton z:10];
}

//添加背景图片
-(void)addBg{
    
    screenSize = [CCDirector sharedDirector].winSize;
    CCSprite *bg;
    bg = [CCSprite spriteWithFile:@"bg_set.png"];
    
    bg.position = ccp(screenSize.width / 2,screenSize.height / 2);
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

//禁用和启用音效
-(void) disableSoundEffect{
    [SimpleAudioEngine sharedEngine].effectsVolume = 0;
    
    [GameData sharedData].soundEffectMuted = YES;
    
}
-(void) enableSoundEffect{
    ////
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    [SimpleAudioEngine sharedEngine].effectsVolume = 1;
    [GameData sharedData].soundEffectMuted = NO;
}


-(void) createSoundEffectMenuOn{
    
    [self removeChild:soundEffectMenu cleanup:YES];
    
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"sound_on.png" selectedImage:@"sound_on.png" target:self selector:@selector(turnSoundEffectOff)];
    CCLabelTTF *sound = [CCLabelTTF labelWithString:@"音效" fontName:@"MarkerFelt-Thin" fontSize:12];
    sound.color = ccc3(0, 0, 0);
    soundEffectMenu = [CCMenu menuWithItems:button1, nil];
    soundEffectMenu.position= ccp(screenSize.width * 0.4, screenSize.height * 0.5);
    sound.position = ccpAdd(soundEffectMenu.position, ccp(0, -30));
    
    [self addChild:soundEffectMenu z:10];
    [self addChild:sound z:10];
    
    
    
}
-(void)createSoundEffectMenuOff{
    
    [self removeChild:soundEffectMenu cleanup:YES];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"sound_off.png" selectedImage:@"sound_off.png" target:self selector:@selector(turnSoundEffectOn)];
    
    soundEffectMenu = [CCMenu menuWithItems:button1, nil];
    soundEffectMenu.position= ccp(screenSize.width * 0.4, screenSize.height * 0.5);
    
    [self addChild:soundEffectMenu z:10  ];
}


-(void)turnSoundEffectOn{
    
    GameData *data = [GameData sharedData];
    data.soundEffectMuted = NO;
    [self enableSoundEffect];
    [self createSoundEffectMenuOn];
}

-(void)turnSoundEffectOff{
    
    GameData *data = [GameData sharedData];
    data.soundEffectMuted = YES;
    [self disableSoundEffect];
    [self createSoundEffectMenuOff];
}
//*****//创建背景音乐开关菜单选项

-(void) createBackgroundMusicMenuOn {
    
    [self removeChild:backgroundMusicMenu cleanup:YES];
    
    
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"music_on.png" selectedImage:@"music_on.png" target:self selector:@selector(turnBackgroundMusicOff)];
    
    CCLabelTTF *music = [CCLabelTTF labelWithString:@"音乐" fontName:@"MarkerFelt-Thin" fontSize:12];
    music.color = ccc3(0, 0, 0);
    backgroundMusicMenu = [CCMenu menuWithItems:button1, nil];
    backgroundMusicMenu.position= ccp(screenSize.width * 0.6, screenSize.height * 0.5);
    music.position = ccpAdd(backgroundMusicMenu.position, ccp(0, -30));
    [self addChild:backgroundMusicMenu z:10];
    [self addChild:music z:10];
    
    
}


-(void)createBackgroundMusicMenuOff{
    [self removeChild:backgroundMusicMenu cleanup:YES];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"music_off.png" selectedImage:@"music_off.png" target:self selector:@selector(turnBackgroundMusicOn)];
    
    backgroundMusicMenu = [CCMenu menuWithItems:button1, nil];
    backgroundMusicMenu.position= ccp(screenSize.width * 0.6, screenSize.height * 0.5);
    
    [self addChild:backgroundMusicMenu z:10  ];
}


-(void)turnBackgroundMusicOn{
    
    GameData *data = [GameData sharedData];
    data.backgroundMusicMuted = NO;
    [[SimpleAudioEngine sharedEngine]resumeBackgroundMusic];
    [self createBackgroundMusicMenuOn];
}

-(void)turnBackgroundMusicOff{
    
    GameData *data = [GameData sharedData];
    data.backgroundMusicMuted = YES;
    [[SimpleAudioEngine sharedEngine]pauseBackgroundMusic];
    [self createBackgroundMusicMenuOff];
}







-(void)createSoundSettingMenu{
    
    
    if([GameData sharedData].soundEffectMuted ==NO){
        [self createSoundEffectMenuOn];
    }else {
        [self createSoundEffectMenuOff];
    }
    if([GameData sharedData].backgroundMusicMuted ==NO){
        [self createBackgroundMusicMenuOn];
    }else {
        [self createBackgroundMusicMenuOff];
    }

       
    
}

-(id) init
{
    if ((self = [super init])) {
        [self addBg];
        [self addBackItem];
        [self addBgMusic];
        //[self addMusicButton];
        //[self addSoundButton];
        [self createSoundSettingMenu];
        
    }
    return self;
}




@end
