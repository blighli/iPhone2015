//
//  LevelSelect.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "LevelSelect.h"

#import "ChapterSelect.h"
#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "Chapters.h"
#import "ChapterParser.h"
#import "Chapter.h"
#import "Levels.h"
#import "Level.h"
#import "LevelParser.h"

#import "CCTouchDispatcher.h"
#import "CCScrollLayer.h"
#import "MainScene.h"


@implementation LevelSelect

+(id)scene{
    
    CCScene *scene =[CCScene node];
    LevelSelect *layer = [LevelSelect node];
    [scene addChild:layer];
    return scene;
    
}



-(void) getScreenSize{
    winSize = [CCDirector sharedDirector].winSize;
}


-(void)setMenuLocation{
    [self getScreenSize];
    
    backButtonLocation = ccp(winSize.width * 0.9, winSize.height * 0.1);
    
    bgLocation = ccp(winSize.width / 2, winSize.height / 2);
    
    ChapterTitleLocation = ccp(winSize.width*0.5,winSize.height*0.9);
    
    levelMenuLocation = ccp(winSize.width*0.5,winSize.height*0.45);

}

//从Gamedata类获取默认的选取地形

-(void)readData{
    
    
    currentChapter =[GameData sharedData].selectedChapter;
}
/*
//添加章节的文字介绍
-(void)addLevelTitle{
    
    switch (currentChapter) {
        case 1:
            
            ChapterTitle = [CCLabelTTF labelWithString:@"丛林" fontName:@"ArialMT" fontSize:16];
            ChapterTitle.position = ChapterTitleLocation;
            ChapterTitle.color = ccc3(47, 144 ,0);
            [self addChild:ChapterTitle z:20];
            break;
            
        case 2:
            
            ChapterTitle = [CCLabelTTF labelWithString:@"沙漠" fontName:@"ArialMT" fontSize:16];
            ChapterTitle.position = ChapterTitleLocation;
            [self addChild:ChapterTitle];
            
            
            
            break;
        case 3:
            
            
            ChapterTitle = [CCLabelTTF labelWithString:@"极地" fontName:@"ArialMT" fontSize:16];
            ChapterTitle.position = ChapterTitleLocation;
            [self addChild:ChapterTitle];
            
            break;
            
        default:
            
            ChapterTitle = [CCLabelTTF labelWithString:@"丛林" fontName:@"ArialMT" fontSize:16];
            ChapterTitle.position = ChapterTitleLocation;
            [self addChild:ChapterTitle];
            
            break;
    }
    
}

*/


//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[ChapterSelect scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}

//添加返回按钮
-(void)addBackButton{
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"back.png" selectedImage:@"back.png" target:self selector:@selector(backToStart)];
    CCMenu *menuButton = [CCMenu menuWithItems:backButton, nil];
    
    //位置以后再调
    menuButton.position = ccp(winSize.width * 0.1, winSize.height * 0.9);
  
    
    [self addChild:menuButton z:10];
    
}


-(void)playBackgrounMusic{
    GameData *data = [GameData sharedData];
    if (data.backgroundMusicMuted == NO) {
        if ([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO) {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_startGameScene.mp3" loop:YES];
        }
    }
}

-(void)addLevelSelectBg{
    [self getScreenSize];
    CCSprite *background;
    background = [CCSprite spriteWithFile:@"bg_select.png"];
    
    background.position = ccp(winSize.width / 2, winSize.height / 2);
   
    [self addChild:background z:-100];
}



//选中后进入关卡选择场景

-(void) onSelectLevel:(CCMenuItemImage *) sender{
    
    GameData *gameData = [GameData sharedData];
    gameData.selectedLevel = sender.tag;
    //三张地形图********
    if (gameData.selectedLevel <= 5){
        CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[MainScene scene]];
        [[CCDirector sharedDirector]replaceScene:trans];
    }
    else{
        
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"对不起" message:@"未知之地尚未开启，敬请期待" delegate:self cancelButtonTitle:@"难道是传说中的BUG？" otherButtonTitles:nil,nil];
        
        [alert show];
        [alert release];
    }
    
}

//初始化层

-(CCLayer *) layerWithLevelName:(NSString*)levelName LevelNumber:(int)levelNumber LevelUnlocked:(BOOL)levelUnlocked screenSize:(CGSize) screenSize {
    CCLayer *layer = [[CCLayer alloc] init];
    
    [self getScreenSize];
    if (levelNumber == 1) {
        NSString *normal = [NSString stringWithFormat:@"%i-level1.png",currentChapter];
        NSString *selected = [NSString stringWithFormat:@"%i-level1.png",currentChapter];
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:normal selectedImage:selected target:self selector:@selector(onSelectLevel:)];
        
        image.tag = levelNumber;
        [image setIsEnabled:levelUnlocked];
        image.scale = 1.5;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"关卡1"];
        text.tag = levelNumber;
        //text.color = ccc3(47, 144 ,0);
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************暂定
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(winSize.width / 2, winSize.height * 0.8);
        //***********************
        [layer addChild:menu2 z:0];
        
    }
    else if (levelNumber == 2){
        
        NSString *normal = [NSString stringWithFormat:@"%i-level2.png",currentChapter];
        NSString *selected = [NSString stringWithFormat:@"%i-level2.png",currentChapter];
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:normal selectedImage:selected target:self selector:@selector(onSelectLevel:)];
        
        image.tag = levelNumber;
        [image setIsEnabled:levelUnlocked];
        image.scale = 1.5;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"关卡2"];
        text.tag = levelNumber;
        
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************暂定
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(winSize.width / 2, winSize.height * 0.8);
        //***********************
        [layer addChild:menu2 z:0];
    }
    else if (levelNumber == 3){
        
        NSString *normal = [NSString stringWithFormat:@"%i-level3.png",currentChapter];
        NSString *selected = [NSString stringWithFormat:@"%i-level3.png",currentChapter];
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:normal selectedImage:selected target:self selector:@selector(onSelectLevel:)];
        
        image.tag = levelNumber;
        [image setIsEnabled:levelUnlocked];
        image.scale = 1.5;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"关卡3"];
        text.tag = levelNumber;
        
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************暂定
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(screenSize.width / 2, screenSize.height * 0.8);
        //***********************
        [layer addChild:menu2 z:0];
        
    }
    else if (levelNumber == 4){
        
        NSString *normal = [NSString stringWithFormat:@"%i-level4.png",currentChapter];
        NSString *selected = [NSString stringWithFormat:@"%i-level4.png",currentChapter];
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:normal selectedImage:selected target:self selector:@selector(onSelectLevel:)];
        
        image.tag = levelNumber;
        [image setIsEnabled:levelUnlocked];
        image.scale = 1.5;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"关卡4"];
        text.tag = levelNumber;
        
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************暂定
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(screenSize.width / 2, screenSize.height * 0.8);
        //***********************
        [layer addChild:menu2 z:0];
    }
    else if (levelNumber == 5){
        
        NSString *normal = [NSString stringWithFormat:@"%i-level5.png",currentChapter];

        NSString *selected = [NSString stringWithFormat:@"%i-level5.png",currentChapter];
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:normal selectedImage:selected target:self selector:@selector(onSelectLevel:)];
        
        image.tag = levelNumber;
        
        [image setIsEnabled:levelUnlocked];
        image.scale = 1.5;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"关卡5"];
        text.tag = levelNumber;
        
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************暂定
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(screenSize.width / 2, screenSize.height * 0.8);
        //***********************
        [layer addChild:menu2 z:0];
    }
    return layer;
    
}

-(void)setScrollLayerOffset{
    //iphone5
    scrollLayerOffset = 250;
    //iphone4
    //scrollLayerOffset = 180;
}


//添加滑动选择
-(void) addLevels{
    [self getScreenSize];
    
    //**********跟地形选择一样********
   
    NSMutableArray *layers = [NSMutableArray new];

    Levels *selectedLevels = [LevelParser loadLevelsForChapter:currentChapter];
    
    for (Level *level in selectedLevels.levels) {
        
        CCLayer *layer = [self layerWithLevelName:level.name LevelNumber:level.number LevelUnlocked:level.unlocked screenSize:winSize];
                  
        NSMutableArray *overlay = [NSMutableArray new];
        if (!level.unlocked) {
            
            NSString *overlayImage = [NSString stringWithFormat:@"level_lock.png"];
            CCSprite *overlaySprite = [CCSprite spriteWithFile:overlayImage];
            overlaySprite.position = ccp(winSize.width / 2, winSize.height / 2);
            [overlaySprite setTag:level.number];
            [overlay addObject:overlaySprite];
            [layer addChild:overlaySprite z:1];
        }
        else {
            
            NSString *stars = [[NSNumber numberWithInt:level.stars] stringValue];
            NSString *overlayImage = [NSString stringWithFormat:@"%@star.png",stars];
            CCSprite *overlaySprite = [CCSprite spriteWithFile:overlayImage];
            overlaySprite.position = ccp(winSize.width * 0.5, winSize.height * 0.4);
            [overlaySprite setTag:level.number];
            [overlay addObject:overlaySprite ];
            [layer addChild:overlaySprite z:1];
        }
        
        [layers addObject:layer];
    }

    //*******
    [self setScrollLayerOffset];
    CCScrollLayer *scroller = [[CCScrollLayer alloc]initWithLayers:layers widthOffset:scrollLayerOffset];
    
    
    GameData *gamedata = [GameData sharedData];
    
    //*****
    
    
    //******
    [scroller selectPage:(gamedata.selectedLevel -1)];
    
    [self addChild:scroller];
    
    [scroller release];
    [layers release];
}


-(id)init{
    if ((self = [super init] )) {
        
        
        [self addLevelSelectBg];
        [self playBackgrounMusic];
        [self readData];
        
        [self addLevels];
        
        //[self addLevelTitle];
        [self addBackButton];
        
    }
    return self;
}

@end
