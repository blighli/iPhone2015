
#import "LevelResult.h"
#import "LevelSelect.h"
#import "MainScene.h"
#import "About.h"
#import "SimpleAudioEngine.h"
#import "SceneManager.h"
#import "Level.h"
#import "Levels.h"
#import "LevelParser.h"
#import "GameHUD.h"
#import "ChapterSelect.h"
#import "GameData.h"
//#import "Constants.h"


@implementation LevelResult

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
	
	LevelResult *layer = [LevelResult node];
	
	[scene addChild: layer];
	
	return scene;
}

//读取LevelManager中的数据

-(void)readData{
    
    GameData *data =[GameData sharedData];
    levelScore =    data.currentLevelScore;
    levelNumber =   data.selectedLevel;
    chapterNumber = data.selectedChapter ;
    
    levelSolved =   data.levelsCompleted;
    
    highestScore =  [[GameData sharedData]returnHighScoreForCurrentLevel];
    
    levelClear =    data.currentLevelSolved;
}

//添加背景并设置透明度

-(void)addResultBg{
    
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    if (levelClear == YES) {
        resultBg = [CCSprite spriteWithFile:@"victory1.png"];
    }else{
        resultBg = [CCSprite spriteWithFile:@"defeat.png"];
    }
    //透明度
    //resultBg.opacity = 100;
    
    resultBg.position =ccp(screenSize.width/2,screenSize.height/2);
    [self addChild:resultBg z:-1];
    
}



/*
//显示关卡名称和历史最高得分
-(void)addLevelTitle{
    
    //获取屏幕大小
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    //NSString *normal = [NSString stringWithFormat:@"%istar.png"];
    
    
    //显示关卡名称
    NSString *name = [NSString stringWithFormat:@"第%d关",levelNumber];
    CCLabelTTF *level = [CCLabelTTF labelWithString:name fontName:@"Courier-Bold" fontSize:25];
    
    level.position = ccp(screenSize.width*0.4,screenSize.height*0.65);
    [self addChild:level z:1];
    
    //显示文本
    CCLabelTTF *text = [CCLabelTTF labelWithString:@"历史最高得分" fontName:@"Courier" fontSize:20];
    text.position = ccp(screenSize.width*0.5,screenSize.height*0.8);
    [self addChild:text z:1];
    
    //显示历史最高得分
    NSString *highScore = [NSString stringWithFormat:@"%d",highestScore];
    CCLabelTTF *showScore = [CCLabelTTF labelWithString:highScore fontName:@"Courier" fontSize:25];
    
    showScore.position = ccp(screenSize.width*0.58,screenSize.height*0.65);
    [self addChild:showScore z:2];
    
}
*/
//显示游戏结果

-(void)addResult{
    
    //获取屏幕大小
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    if(levelClear == FALSE){
        
        //暂时不定义
        [[SimpleAudioEngine sharedEngine]playEffect:@"lose.mp3"];
        CCSprite *sprite = [CCSprite spriteWithFile:@"0star.png"];
        sprite.position = ccp(screenSize.width * 0.5, screenSize.height * 0.5);
        sprite.scale = 1.5;
        [self addChild:sprite z:1];
        //NSString *failure =@"当前关卡失败!";
       // CCLabelTTF *showFailure = [CCLabelTTF labelWithString:failure fontName:@"ArialMT" fontSize:20];
        //showFailure.position = ccp(screenSize.width*0.5,screenSize.height*0.35);
        //[self addChild:showFailure];
        
    } else if(levelClear == YES){
        /*
        NSString *clear = @"当前关卡胜利!";
        CCLabelTTF *showClear = [CCLabelTTF labelWithString:clear fontName:@"ArialMT" fontSize:20];
        showClear.position = ccp(screenSize.width*0.45,screenSize.height*0.4);
        [self addChild:showClear z:2];
        
        CCLabelTTF *text = [CCLabelTTF labelWithString:@"得分" fontName:@"ArialMT" fontSize:20];
        text.position = ccp(screenSize.width*0.35,screenSize.height*0.3);
        [self addChild:text z:2];
        
        NSString *score = [NSString stringWithFormat:@"%d",levelScore];
        CCLabelTTF *showScore = [CCLabelTTF labelWithString:score fontName:@"ArialMT" fontSize:20];
        showScore.position = ccp(screenSize.width*0.55,screenSize.height*0.3);
        [self addChild:showScore z:2];
        */
        [[SimpleAudioEngine sharedEngine]playEffect:@"win.mp3"];
        if ([GameHUD sharedHUD].baseHp == 10) {
            CCSprite *sprite = [CCSprite spriteWithFile:@"3star.png"];
            sprite.position = ccp(screenSize.width * 0.5, screenSize.height * 0.5);
            sprite.scale = 1.5;
            [self addChild:sprite z:1];
        }else if ([GameHUD sharedHUD].baseHp < 10 && [GameHUD sharedHUD].baseHp >= 6)
        {
            CCSprite *sprite = [CCSprite spriteWithFile:@"2star.png"];
            sprite.position = ccp(screenSize.width * 0.5, screenSize.height * 0.5);
            sprite.scale = 1.5;
            [self addChild:sprite z:1];
        }else if ([GameHUD sharedHUD].baseHp < 6 && [GameHUD sharedHUD].baseHp >= 1)
        {
            CCSprite *sprite = [CCSprite spriteWithFile:@"1star.png"];
            sprite.position = ccp(screenSize.width * 0.5, screenSize.height * 0.5);
            sprite.scale = 1.5;
            [self addChild:sprite z:1];
        }
    }
    
}
//返回关卡选择界面

-(void)backToLevelSelection{
    
    //停止播放背景音乐
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:0.1f scene:[LevelSelect scene]];
    [[CCDirector sharedDirector]replaceScene:trans];

    //  NSLog(@"back to level selection scene");
}

//重玩当前关卡
-(void)replayCurrentLevel{
    
    //停止播放背景音乐
    /*[[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    [GameData sharedData].selectedLevel =levelNumber;
    CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[MainScene scene]];
    [[CCDirector sharedDirector]replaceScene:trans];*/
    [GameData sharedData].selectedLevel =levelNumber;
    [SceneManager goGameScene];
    [[GameHUD sharedHUD]resetGameHUDLayer];
    [MainScene resetGame];

    
    
    
}

//进入下一个关卡
-(void)playNextLevel{
    
    //停止播放背景音乐
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic];
    GameData *gamedata =[GameData sharedData];
    
    //判断是否下一个关卡已解锁
    if(levelClear ==YES && gamedata.selectedLevel < 5)
    {
        
        gamedata.selectedLevel++;
        
        
        CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[MainScene scene]];
        [[CCDirector sharedDirector]replaceScene:trans];

        
    }
    
    else if(gamedata.selectedLevel == 5 && gamedata.selectedChapter <3  && levelClear)
    {
        
        gamedata.selectedChapter ++;
        gamedata.selectedLevel =1;
        
        Levels *selectedLevels = [LevelParser loadLevelsForChapter:gamedata.selectedChapter];
        
        for (Level *level in selectedLevels.levels)
        {
            
            // look for currently selected level
            
            if(level.number == gamedata.selectedLevel)
            {
                //新章节的关卡1解锁
                
                [level setUnlocked:YES];
            }else
            {
                
                //其它关卡锁定
                [level setUnlocked:NO];
            }
            
        }
        
        // Write the new xml
        [LevelParser saveData:selectedLevels forChapter:gamedata.selectedChapter];
        
        //进入新的场景
        CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[LevelSelect scene]];
        [[CCDirector sharedDirector]replaceScene:trans];

        
    }else if(chapterNumber >=3)
    {
        
        CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:1.0f scene:[ChapterSelect scene]];
        [[CCDirector sharedDirector]replaceScene:trans];

    }

    
}

//显示三个菜单选项
-(void)addMenuItems{
    
    //获取屏幕大小
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    NSString *nextItemImage =@"button_speed.png";
    if(levelClear == NO){
        nextItemImage = @"button_speed2.png";//不能进入下一关卡
    }
    
    CCMenuItemImage *backItem = [CCMenuItemImage itemWithNormalImage:@"button_select.png" selectedImage:nil target:self selector:@selector(backToLevelSelection)];
    
    CCMenuItemImage *replayItem = [CCMenuItemImage itemWithNormalImage:@"button_replay.png" selectedImage:nil target:self selector:@selector(replayCurrentLevel)];
    
    CCMenuItemImage *nextItem = [CCMenuItemImage itemWithNormalImage:nextItemImage selectedImage:nil target:self selector:@selector(playNextLevel)];
    
    backItem.position = ccp(screenSize.width * 0.35,screenSize.height * 0.3);
    replayItem.position = ccp(screenSize.width * 0.5,screenSize.height * 0.3);
    nextItem.position = ccp(screenSize.width * 0.65,screenSize.height * 0.3);
    
    CCMenu *menu = [CCMenu menuWithItems:backItem,replayItem,nextItem, nil];
    menu.position = ccp(0,0);
    [self addChild:menu];
    
}

-(void)playBgmusic{
    
    if(levelClear){
        
     
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"gamewin.mp3" loop:YES];
        
    }else{
        
      
        [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"fail.mp3" loop:YES];
    }
}



-(id) init
{
		if( (self = [super init])) {
        
        
        //读取LevelManager中的数据
        
        [self readData];
        
        //获取游戏关卡的背景并设置透明度
        
        [self addResultBg];
        
        //显示关卡名称
        //[self addLevelTitle];
        
        //显示上面的方框
        //[self addTopBar];
        
        //显示菜单选项
        
        [self addMenuItems];
        
        //显示游戏结果
        [self addResult];
        
        //播放背景音乐
        [self playBgmusic];
    }
	return self;
}

- (void) dealloc
{
	[super dealloc];
}


@end
