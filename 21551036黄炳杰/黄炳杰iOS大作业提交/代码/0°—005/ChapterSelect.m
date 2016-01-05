//
//  ChapterSelect.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ChapterSelect.h"

#import "SimpleAudioEngine.h"
#import "GameData.h"
#import "CCTouchDispatcher.h"
#import "CCScrollLayer.h"
#import "StartGameScene.h"

#import "Chapter.h"
#import "Chapters.h"
#import "ChapterParser.h"
#import "LevelSelect.h"
//#import "Constants.h"
@implementation ChapterSelect

+(id)scene{
    
    CCScene *scene =[CCScene node];
    ChapterSelect *layer = [ChapterSelect node];
    [scene addChild:layer];
    return scene;
    
}

//获取屏幕大小
-(void)getScreenSize{
    winSize = [CCDirector sharedDirector].winSize;
}

//设置位置

-(void)setMenuLocation{
    [self getScreenSize];
    //位置暂定 以后调试
    backButtonLocation = ccp(winSize.width * 0.9, winSize.height * 0.1);
    
    textLocation = ccp(winSize.width / 2,winSize.height * 0.75);
    
    chapterLocation = ccp(winSize.width / 2, winSize.height / 2);
    
    bgLocation = ccp(winSize.width / 2, winSize.height / 2);
    
}

//添加背景图片
-(void)addBackground{
    [self getScreenSize];
    CCSprite *background;
    background = [CCSprite spriteWithFile:@"bg_select.png"];
    //background.position = bgLocation;
    background.position = ccp(winSize.width / 2, winSize.height / 2);
    [self addChild:background z:-100];
}


//添加背景音乐
-(void) playBackgroundMusic{
    GameData *data = [GameData sharedData];
    if (data.backgroundMusicMuted == NO) {
        if ([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO) {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bgStartGameScene.mp3" loop:YES];
            
        }
    }
}

//返回游戏开始界面
-(void)backToStart{
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[StartGameScene scene]];
    [[CCDirector sharedDirector]replaceScene:trans];
}

//添加返回按钮
-(void)addBackButton{
    
    CCMenuItemImage *backButton = [CCMenuItemImage itemWithNormalImage:@"back.png" selectedImage:@"back.png" target:self selector:@selector(backToStart)];
    CCMenu *menuButton = [CCMenu menuWithItems:backButton, nil];
    
    //位置以后再调
    menuButton.position = ccp(winSize.width * 0.1, winSize.height * 0.9);
    [self addChild:menuButton z:1];
}

//选中后进入关卡选择场景

-(void) onSelectChapter:(CCMenuItemImage *) sender{

    GameData *gameData = [GameData sharedData];
    gameData.selectedChapter = sender.tag;
    
    //三张地形图********
    if (gameData.selectedChapter <= 3){
        
        
        CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[LevelSelect scene]];
        [[CCDirector sharedDirector]replaceScene:trans];
       
    }
    else{
        
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"对不起" message:@"未知之地尚未开启，敬请期待" delegate:self cancelButtonTitle:@"难道是传说中的BUG？" otherButtonTitles:nil,nil];
        
        [alert show];
        [alert release];
    }
    
}

//初始化层

-(CCLayer *) layerWithChapterName:(NSString*)chapterName chapterNumber:(int)chapterNumber chapterUnlocked:(BOOL)chapterUnlocked screenSize:(CGSize) screenSize {
    
    CCLayer *layer = [[CCLayer alloc] init];
    
    [self getScreenSize];
    if (chapterNumber == 1) {
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"dixing1.png" selectedImage:@"dixing1.png" target:self selector:@selector(onSelectChapter:)];
        image.tag = chapterNumber;
        
        //image.scale = 0.6;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"草地战"];
        text.tag = chapterNumber;
        text.color = ccc3(47,144,0);
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        //*******
        //[menu2 alignItemsVertically];
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(winSize.width / 2, winSize.height * 0.75);
        
        [layer addChild:menu2];
        
    }
    else if (chapterNumber == 2){
        
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"dixing2.png" selectedImage:@"dixing2.png" target:self selector:@selector(onSelectChapter:)];
        
        image.tag = chapterNumber;
        
        //image.scale = 0.6;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"沙漠战"];
        text.tag = chapterNumber;
        text.color = ccc3(142,57,0);
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///********************
        
        //[menu2 alignItemsVertically];
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(winSize.width / 2, winSize.height * 0.75);
        //***********************
        [layer addChild:menu2];
    }
    else if (chapterNumber == 3){
        
        CCMenuItemImage *image = [CCMenuItemImage itemWithNormalImage:@"dixing3.png" selectedImage:@"dixing3.png" target:self selector:@selector(onSelectChapter:)];

        image.tag = chapterNumber;
        
        //image.scale = 0.6;
        
        CCMenu *menu = [CCMenu menuWithItems:image, nil];
        [menu alignItemsVertically]; //将菜单居中对齐
        [layer addChild:menu];
        
        //添加文字****************
        [CCMenuItemFont setFontSize:15];
        CCMenuItemFont *text = [CCMenuItemFont itemWithString:@"雪地战"];
        text.tag = chapterNumber;
        
        CCMenu *menu2 = [CCMenu menuWithItems:text, nil];
        ///*********************
        //[menu2 alignItemsVertically];
        menu2.anchorPoint = ccp(0, 0);
        menu2.position = ccp(winSize.width / 2, winSize.height * 0.75);
        //***********************
        [layer addChild:menu2];
    }
    return layer;
    
}

-(void)setScrollLayerOffset{
    //iphone5
    scrollLayerOffset = 50;
    //iphone4
    //scrollLayerOffset = 180;
}


//添加滑动选择
-(void) addChapters{
    [self getScreenSize];
    
    NSMutableArray *layers = [NSMutableArray new];
    
    Chapters *chapters = [ChapterParser loadData];
    
    for (Chapter *chapter in chapters.chapters) {
        CCLayer *layer = [self layerWithChapterName:chapter.name chapterNumber:chapter.number chapterUnlocked:chapter.unlocked screenSize:winSize];
        
        [layers addObject:layer];
    }
    
    [self setScrollLayerOffset];
    CCScrollLayer *scroller = [[CCScrollLayer alloc]initWithLayers:layers widthOffset:scrollLayerOffset];
    
    
    GameData *gamedata = [GameData sharedData];
    
    [scroller selectPage:(gamedata.selectedChapter -1)];
    
        
    [self addChild:scroller];
    
    [scroller release];
    [layers release];
}


//初始化当前场景
-(id)init{
    if ((self = [super init])) {
        [self setMenuLocation];

        [self addBackground];
       
        [self playBackgroundMusic];
        
        [self addChapters];
        [self addBackButton];
    }
    return self;
}




@end
