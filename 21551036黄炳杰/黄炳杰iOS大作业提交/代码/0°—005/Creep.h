//
//  Creep.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"

#import "DataModel.h"
#import "WayPoint.h"
#import "GameHUD.h"

@class ASWapPoints;

@interface Creep : CCSprite <NSCopying> {
    int _curHp;//当前的血量
    int maxHp;//最大血量
    
	int _moveDuration;//移动速度
	
	int _curWaypoint;//当前的路点
    int _lastWaypoint;//最后的路点
    float firstDistance;
    
    int _curPWaypoint;
    int _lastPWaypoint;

    GameHUD * gameHUD;
    CCProgressTimer *creepHealthBar;//血条
    CCProgressTimer *creepHealthBarBg;//血量背景图
    int _totalHp;//全部血量
    
    int rag;
    
    //***
    int _direction;
    NSMutableArray *_wayPoints;
    void(^_finishBlock)(void);
    
    
}
@property(nonatomic ,assign) int rag;
@property (nonatomic, assign) int hp;
@property (nonatomic, assign) int moveDuration;
@property (nonatomic, assign) int curWaypoint;
@property (nonatomic, assign) int lastWaypoint;
@property (nonatomic, assign) int curPWaypoint;
@property (nonatomic, assign) int lastPWaypoint;
@property(nonatomic,assign) CCSprite *mySprite;
@property(nonatomic ,assign)int totalHp;
@property(nonatomic,assign) CCProgressTimer *creepHealthBar;
@property(nonatomic,assign) CCProgressTimer *creepHealthBarBg;
- (Creep *) initWithCreep:(Creep *) copyFrom;
- (float) moveDurScale;
//——————————————————————————————————————————————获得地面部队的路点
- (WayPoint *)getCurrentWaypoint;
- (WayPoint *)getNextWaypoint;
- (WayPoint *)getLastWaypoint;
//——————————————————————————————————————————————获得空中部队的路点
- (WayPoint *)getCurrentPWaypoint;
- (WayPoint *)getNextPWaypoint;
- (WayPoint *)getLastPWaypoint;

//**
@property (nonatomic, assign) float m_speed;
@property (nonatomic, assign) int m_blood;
@property (nonatomic, assign) CGPoint m_curPoint;

-(void)moveWithWayPoints:(ASWapPoints *)points andFinishBlock:(void(^)(void))finish;
-(void)movingForNewWayPoints:(ASWapPoints *)newPoints;

//void ccFillPoly(CGPoint *poli,int points,BOOL closePolygon);
@end

@interface XiaoBin1 : Creep {
}
+(id)creep;
@end
@interface Plane : Creep{
    
}
+(id)creep;
@end
@interface Plane2 : Creep{
    
}
+(id)creep;
@end
@interface Moto : Creep{
    
}
+(id)creep;
@end
@interface TanKe1 : Creep{
    
}
+(id)creep;
@end
@interface TanKe2 : Creep{
    
}
+(id)creep;
@end
@interface KaChe : Creep{
    
}
+(id)creep;
@end