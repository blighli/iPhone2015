//
//  GameData.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import "GameData.h"
//还剩游戏常量

#import "SimpleAudioEngine.h"

@implementation GameData

@synthesize notFirstTimePlayThisGame,notFirstTimeEnterStore;
@synthesize gamePaused;
//***
//@synthesize speed ;
//***
@synthesize level1Wave = _level1Wave;
@synthesize level2Wave = _level2Wave;
@synthesize level3Wave = _level3Wave;
@synthesize level4Wave = _level4Wave;
@synthesize level5Wave = _level5Wave;

@synthesize waveCount = _waveCount;


@synthesize selectedChapter = _selectedChapter;
@synthesize selectedLevel = _selectedLevel;
@synthesize soundEffectMuted,backgroundMusicMuted;

@synthesize levelsCompleted,chaptersCompleted;
@synthesize currentLevelSolved;

@synthesize highScoreLevel1,highScoreLevel2,highScoreLevel3,highScoreLevel4,highScoreLevel5;
@synthesize currentLevel,currentLevelScore;

@synthesize scoreForAllLevels,enemyNumberOfWavesForCurrentLevel;


static GameData *sharedData = nil;

+(GameData *) sharedData {
    if (sharedData == nil) {
        sharedData = [[GameData alloc] init];
    }
    return sharedData;
}

-(id) init
{
    if ((self = [super init])) {
        sharedData = self;
        defaults = [NSUserDefaults standardUserDefaults];
        
        soundEffectMuted = [defaults boolForKey:@"soundEffectMuted"];//音效开关默认值为NO
        backgroundMusicMuted = [defaults boolForKey:@"backgroundMusicMuted"];//默认值为NO
        gamePaused = [defaults boolForKey:@"ganmePaused"];
        //**
        speed = 1.0f;
        //**
        notFirstTimePlayThisGame = [defaults boolForKey:@"notFirstTimePlayThisGame"];
        notFirstTimeEnterStore = [defaults boolForKey:@"notFirstTimeEnterStore"];
        
        levelsCompleted = [defaults integerForKey:@"lecelsCompleteTotal"];
        chaptersCompleted = [defaults integerForKey:@"chaptersCompleted"];
        
        currentLevelSolved = [defaults boolForKey:@"currentLevelSolved"];
        
        //默认选择的关卡和场景
        _selectedChapter = 1;
        _selectedLevel = 1;
        
        _level1Wave = 15;
        _level2Wave = 20;
        _level3Wave = 25;
        _level4Wave = 30;
        _level5Wave = 35;
        
        _waveCount = 1;
    }
    return self;
}

#pragma mark 关卡的历史最高评价

//设置不同关卡的历史最高评价

-(void) setHighScoreForCurrentlevel:(int)theScore{
    switch (_selectedLevel) {
        case 0:
            //do nothing
            break;
        case 1:
            if (theScore > highScoreLevel1) {
                highScoreLevel1 = theScore;
                [defaults setInteger:highScoreLevel1 forKey:@"highScoreLevel1"];
            }
            break;
        case 2:
            if (theScore > highScoreLevel2) {
                highScoreLevel2 = theScore;
                [defaults setInteger:highScoreLevel2 forKey:@"highScoreLevel2"];
            }
            break;
        case 3:
            if (theScore > highScoreLevel3) {
                highScoreLevel3 = theScore;
                [defaults setInteger:highScoreLevel3 forKey:@"highScoreLevel3"];
            }
            break;
        case 4:
            if (theScore > highScoreLevel4) {
                highScoreLevel4 = theScore;
                [defaults setInteger:highScoreLevel4 forKey:@"highScoreLevel4"];
            }
            break;
        case 5:
            if (theScore > highScoreLevel5) {
                highScoreLevel5 = theScore;
                [defaults setInteger:highScoreLevel5 forKey:@"highScoreLevel5"];
            }
            break;
            
        default:
            break;
    }
}


//返回不同关卡的历史最高评价

-(int) returnHighScoreForCurrentLevel{
    int higeScore;
    
    switch (_selectedLevel) {
        case 0:
            higeScore = 0;
            break;
        case 1:
            higeScore = highScoreLevel1;
            break;
        case 2:
            higeScore = highScoreLevel2;
            break;
        case 3:
            higeScore = highScoreLevel3;
            break;
        case 4:
            higeScore = highScoreLevel4;
            break;
        case 5:
            higeScore = highScoreLevel5;
            break;
        default:
            higeScore = 0;
            break;
    }
    return higeScore;
}




@end
