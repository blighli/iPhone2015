//
//  DataModel.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"

@interface DataModel : NSObject <NSCoding> {
	CCLayer *_gameLayer;//游戏层
	CCLayer *_gameHUDLayer;	//HUD层
	
	NSMutableArray *_projectiles;//炮弹
	NSMutableArray *_towers; //炮塔
    NSMutableArray *_towerBase;
    CCArray *_arrEnemy;
	NSMutableArray *_targets;
	NSMutableArray *_waypoints;	//路点
    NSMutableArray *_pwaypoints;
	
	NSMutableArray *_waves;	//波
	
	UIPanGestureRecognizer *_gestureRecognizer;
}

@property (nonatomic, retain) CCLayer *_gameLayer;
@property (nonatomic, retain) CCLayer *_gameHUDLayer;

@property (nonatomic, retain) NSMutableArray * _projectiles;
@property (nonatomic, retain) NSMutableArray * _towers;
@property (nonatomic, retain) NSMutableArray * _towersBase;
@property (nonatomic, retain) CCArray * _arrEnemy;

@property (nonatomic, retain) NSMutableArray * _targets;
@property (nonatomic, retain) NSMutableArray * _waypoints;
@property (nonatomic, retain) NSMutableArray * _pwaypoints;

@property (nonatomic, retain) NSMutableArray * _waves;

@property (nonatomic, retain) UIPanGestureRecognizer *_gestureRecognizer;
+ (DataModel*)getModel;

@end
