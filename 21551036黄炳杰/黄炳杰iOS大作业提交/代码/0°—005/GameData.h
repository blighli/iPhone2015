//
//  GameData.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject{
    //音乐、音效开关
    BOOL soundEffectMuted; //音效开关
    BOOL backgroundMusicMuted;//背景音乐
    
    //游戏相关
    
    //是否是第一次玩这款游戏
    BOOL notFirstTimeEnterStore;
    BOOL notFirstTimePlayThisGame;
    
    //是否暂停游戏
    BOOL gamePaused;
    
    float speed;
    //系统默认设置
    NSUserDefaults *defaults;
    
    //关卡相关
    int levelsCompleted;//已通过的关卡数量
    int chaptersCompleted;//已完成的场景数量
    BOOL currentlevelSolved;//当前关卡是否已通过
    
    //所选场景和关卡
    
    int _selectedChapter;
    int _selectedLevel;
    
    //关卡波数
    int _level1Wave;
    int _level2Wave;
    int _level3Wave;
    int _level4Wave;
    int _level5Wave;
    
    int _waveCount;
    
    
    //当前关卡的评价（是否已完美通关）
    int currentLevelStars;
    
    //该游戏专用
    
    int enemyNumberOfWavesForCurrentLevel;//当前关卡敌人的波数
    
    //当前关卡名称
    NSString *currentLevelName;
    
    //当前关卡的得分
    int currentLevelScore;
    //所有关卡的得分
    int scoreForAllLevels;
    //各关卡的历史最高得分
    int highScoreLevel1;
    int highScoreLevel2;
    int highScoreLevel3;
    int highScoreLevel4;
    int highScoreLevel5;
    
}

@property (nonatomic)NSInteger levelsCompleted,chaptersCompleted;

@property (nonatomic, assign) int selectedChapter;
@property (nonatomic, assign) int selectedLevel;

@property (nonatomic, assign) int level1Wave;
@property (nonatomic, assign) int level2Wave;
@property (nonatomic, assign) int level3Wave;
@property (nonatomic, assign) int level4Wave;
@property (nonatomic, assign) int level5Wave;

@property (nonatomic, assign) int waveCount;


@property (nonatomic) BOOL soundEffectMuted,backgroundMusicMuted;
@property (nonatomic) BOOL notFirstTimePlayThisGame,notFirstTimeEnterStore;

@property (nonatomic) BOOL gamePaused;

//**
@property (nonatomic, assign)float speed;
//**
@property (nonatomic) NSInteger highScoreLevel1,highScoreLevel2,highScoreLevel3,highScoreLevel4,highScoreLevel5;

@property (nonatomic) NSInteger currentLevel,currentLevelScore,scoreForAllLevels;
@property (nonatomic) BOOL currentLevelSolved;
@property (nonatomic) NSInteger enemyNumberOfWavesForCurrentLevel;

+(GameData *)sharedData;


//设置和返回当前关卡的历史最高评价（是否完美通过）
-(int) returnHighScoreForCurrentLevel;
-(void) setHighScoreForCurrentlevel:(int) theScore;

+(GameData *) sharedData;

//初始化

-(id)init;


@end
