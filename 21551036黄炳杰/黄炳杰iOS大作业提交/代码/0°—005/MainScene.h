//
//  MainScene.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-26.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

//***

#import "Creep.h"
#import "Projectile.h"
#import "Tower.h"
#import "WayPoint.h"
#import "Wave.h"
#import "EnemySprite.h"
#import "GameHUD.h"

//**
@class AStar;
@class Creep;
@class ASWapPoints;
@class Tower;

@interface MainScene : CCLayer {
    int currentChapter;
    int currentLevel;
    CGSize screenSize;
    
    CCTMXTiledMap *_tileMap;
    CCTMXLayer *_background;
    GameHUD * gameHUD;
    NSMutableArray *_movableSprites;
    Tower * curTouchTower;
    id _enemAction;
    int _currentWave;
    CCSprite *developBackGround;
    CCMenu *developmenu;
    CCMenu *sellmenu;
    CCLabelTTF *_developCost;
    CCLabelTTF *_sellCost;
    
    CCMenu *gameSwitch;
    CCMenu *Speed;
    
    //****
    CGPoint _startLocation;
    CGPoint _endLocation;
    AStar *_aAlgorithm;
    CCSprite *_highlightMask;
    //***
}

//*****wowow
@property (nonatomic, retain) ASWapPoints *wayPoints;
@property (nonatomic, retain) ASWapPoints *wayPointsForLocation;
///**

@property (nonatomic, retain) CCTMXTiledMap *tileMap;
@property (nonatomic, retain) CCTMXLayer *background;

+(CCScene *) scene;

- (void)addWaypoint;
- (void)addTower:(CGPoint)pos :(int)towerTag;
- (BOOL)canBuildOnTilePosition:(CGPoint) pos;
- (void)developTower;
- (void)sellTower;

//**
+(void) resetGame;
-(void) resetLayer;


@property(nonatomic,assign) CCSprite *mySprite;

@property (nonatomic, assign) int currentWave;

//***wowo

-(void)enemysMovingByNewWay;
-(CGPoint)tilePosFromLocation:(CGPoint)location;
-(CGPoint)locationForTilePos:(CGPoint)pos;

//-(void)cancelHighlight;
//-(BOOL)isBuildableAtTilePos:(CGPoint)pos;
-(BOOL)isPassableAtTilePos:(CGPoint)pos;
//***

@end
