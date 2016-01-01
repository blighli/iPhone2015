//
//  MainScene.m
//  0°—Test002
//
//  Created by huangbingjie on 13-7-26.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainScene.h"
#import "GameData.h"
#import "SimpleAudioEngine.h"
#import "GamePause.h"
#import "LevelResult.h"
#import "Creep.h"
#import "DataModel.h"
#import "GameHUD.h"
#import "CCTMXXMLParser+parser.h"
#import "SceneManager.h"
#import "AStar.h"

#define _MaxEnemy 10
@implementation MainScene

@synthesize tileMap = _tileMap;
@synthesize background = _background;
@synthesize currentWave=_currentWave;
bool resetGame;
int reset = 0;
int flag_touch=0;//用于标记塔是否被点击
static int temp=0;

///***wowo
@synthesize wayPoints = _wayPoints;
@synthesize wayPointsForLocation = _wayPointsForLocation;

//***


+(id)scene{
    
    CCScene *scene =[CCScene node];
    MainScene *layer = [MainScene node];
    [scene addChild:layer z:1];
    //**
    GameHUD * myGameHUD = [GameHUD sharedHUD];
	[scene addChild:myGameHUD z:2];
    
    DataModel *m = [DataModel getModel];
	m._gameLayer = layer;
	m._gameHUDLayer = myGameHUD;
    
    return scene;
    
}

typedef enum
{
    ChildTagSpriteBatch = 100,
}ChildTag;

-(void)enemyMovingByNewWay
{
    CCSpriteBatchNode *batch = (CCSpriteBatchNode *)[self getChildByTag:ChildTagSpriteBatch];
    if (batch) {
        for (Creep *creep in batch.children) {
            if (creep.visible) {
                [creep movingForNewWayPoints:self.wayPointsForLocation];
            }
        }
    }
}


//从gl坐标获得tile坐标
-(CGPoint)tilePosFromLocation:(CGPoint)location
{
    return [self tilePosFromLocation:location tileMap:_tileMap];
}

-(CGPoint)tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap
{
    CGPoint pos = CGPointZero;
    pos.x = (int)(location.x / tileMap.tileSize.width);
    pos.y = (int)(tileMap.mapSize.height - location.y/tileMap.tileSize.height);
    return pos;
}

//是否允许敌人通过该tile点
-(BOOL)isPassableAtTilePos:(CGPoint)pos
{
    if (pos.x<0 || pos.y<0 || pos.x>=_tileMap.mapSize.width || pos.y>=_tileMap.mapSize.height)
        return NO;
    
    CCTMXLayer* background = [_tileMap layerNamed:@"background"];
    int tileGID = [background tileGIDAt:pos];
    NSDictionary *dic = [_tileMap propertiesForGID:tileGID];
    if (dic) {
        NSString *buildable = (NSString*)[dic valueForKey:@"buildable"];
        if ([buildable intValue] != 1)
            return NO;
        
    }
    else
        return NO;
    DataModel *m=[DataModel getModel];
    for (Tower *tower in m._towers)
    {
        if (CGPointEqualToPoint([self tilePosFromLocation:tower.position], pos))
            return NO;
    }
    return YES;
}


-(void)getEnemyWayPoints
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        self.wayPoints = nil;
        self.wayPoints = [_aAlgorithm getWayPointsWithStartPoint:[self tilePosFromLocation:_startLocation tileMap:_tileMap] endPoint:[self tilePosFromLocation:_endLocation tileMap:_tileMap] UnimpedeBlock:^BOOL(CGPoint p) {
            return [self isPassableAtTilePos:p];
        }];
        
      
        self.wayPointsForLocation = nil;
        //将tile路径点转换到gl坐标
        self.wayPointsForLocation = [self getLocationWayPointsFromTilePoints:_wayPoints];
    });
}

//将tile路径点转换到gl坐标
-(ASWapPoints*)getLocationWayPointsFromTilePoints:(ASWapPoints*)tilePoints
{
    ASWapPoints *locationPoints = [ASWapPoints wayPoints];
    for (int i=0; i<tilePoints.count; i++) {
        CGPoint p = [tilePoints pointAtIndex:i].Cgpoint;
        ASPoint *lp = [ASPoint pointWithCGPoint:[self locationForTilePos:p]];
        [locationPoints addPoint:lp];
    }
    return locationPoints;
}
//从tile坐标获得gl坐标
-(CGPoint)locationForTilePos:(CGPoint)pos
{
    return [self locationForTilePos:pos tileMap:_tileMap];
}

-(CGPoint)locationForTilePos:(CGPoint)pos tileMap:(CCTMXTiledMap*)tileMap
{
    float x = (pos.x*tileMap.tileSize.width + tileMap.tileSize.width*0.5f);
    float tileHeight = tileMap.tileSize.height;
    float y = tileHeight*tileMap.mapSize.height-(tileHeight*pos.y + tileHeight/2.0f);
    CGPoint location = ccp(x,y);
    return location;
}

//是否允许建造在该tile点
-(BOOL)isBuildableAtTilePos:(CGPoint)pos
{
    
    if (![self isPassableAtTilePos:pos])
        return NO;
    
    if (!_wayPoints)
        return NO;
    
    ASWapPoints *newPoints;
    int prevIndex;
    for (int i=0; i<_wayPoints.count; i++) {
        ASPoint *point = [_wayPoints pointAtIndex:i];
        
        //如果建造的点刚好落在路径点上
        if (CGPointEqualToPoint(point.Cgpoint, pos)){
            
            //当为路径的起点或者终点时，返回NO
            if (i==_wayPoints.count-1 || i==0)
                return NO;
            
            //前一个路径点
            prevIndex = i-1;
            ASPoint *prev = [_wayPoints pointAtIndex:prevIndex];
            newPoints =
            
            [_aAlgorithm getWayPointsWithStartPoint:prev.Cgpoint endPoint:[_wayPoints lastPoint].Cgpoint UnimpedeBlock:^BOOL(CGPoint p){
                if ([self isPassableAtTilePos:p]) {
                    if (!CGPointEqualToPoint(p, pos)) {
                        return YES;
                    }
                }
                return NO;
            }];
            //如果没有新的路径，返回NO
            if (!newPoints)
                return NO;
            if (newPoints.count==0)
                return NO;
            
            //获得新的路径点
            [_wayPoints replacePointsFromIndex:prevIndex withNewPoints:newPoints];
            self.wayPointsForLocation = nil;
            self.wayPointsForLocation = [self getLocationWayPointsFromTilePoints:_wayPoints];
            break;
        }
    }
    return YES;
}

//每隔一段时间出现一个敌人
-(void)updateEnemy:(ccTime)delta
{
    
    CCLOG(@"wopdasjdoasdhas2");
    //DataModel *m = [DataModel getModel];
    CCSpriteBatchNode *batch = (CCSpriteBatchNode *)[self getChildByTag:100];
    int count = batch.children.count;
    //int count = m._targets.count;
    if (batch) {
        CCLOG(@"wopdasjdoasdhas31");
        static int movedCount=0;
        static BOOL allowMove = YES;
        CCLOG(@"wopdasjdoasdhas222");
        for (EnemySprite *enemy in batch.children)
        {
            
            if (!enemy.visible && allowMove) {
                
                enemy.visible = YES;
                if (++movedCount >= count)
                    allowMove = NO;
                
                [enemy moveWithWayPoints:self.wayPointsForLocation andFinishBlock:^{
                    enemy.visible = NO;
                    if (--movedCount == 0) {
                        allowMove = YES;
                        [self getEnemyWayPoints];
                    }
                }];
                break;
            }
        }
    }
/*
    CCLOG(@"wopdasjdoasdhas36666");
    DataModel *m = [DataModel getModel];
    int count = 0;
    for (Creep *creep in m._targets) {
        count ++;
        CCLOG(@"我我我%i",count);
    }
    if (m._targets) {
        static int movedCount=0;
        static BOOL allowMove = YES;
        for (Creep *creep in m._targets) {
            CCLOG(@"wopdasjdoasdhas36677");
            if (!creep.visible && allowMove) {
                creep.visible = YES;
                if (++movedCount >= count) {
                    [creep moveWithWayPoints:self.wayPointsForLocation andFinishBlock:^{
                        creep.visible = NO;
                        allowMove = YES;
                        [self getEnemyWayPoints];
                    }];
                     break;

                }
            }
            CCLOG(@"wopdasjdoasdhas36889");
           
        }

    }
    */
}


//****
-(id) init {
    if((self = [super init])) {
         [self readData];
        if (currentChapter == 1) {
            [self getScreenSize];
            
            NSString *normal = [NSString stringWithFormat:@"CaoDi_%i.tmx",currentLevel];
            
            self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:normal];
            self.background = [_tileMap layerNamed:@"Background"];
            self.background.anchorPoint = ccp(0, 0);
            [self addChild:_tileMap z:0];
            [self addWaypoint];
            [[GameHUD sharedHUD]resetGameHUDLayer];
            [self resetLayer];
            //**
            [self addWaves];
            
            
            [self schedule:@selector(update:)];
            [self schedule:@selector(gameLogic:) interval:0.2];
            //**
            resetGame = NO;
            
            [self readData];
            [self createMenu];
            
            [self creatButtonMenu];
            
            self.currentWave = 0;
            
            self.position = ccp(0, 0);
            
            gameHUD = [GameHUD sharedHUD];
            
           // [gameHUD schedule:@selector(updateResourcesNom) interval: 2.0];
            
            [[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:2 swallowsTouches:YES];
        }else if (currentChapter == 2) {
            [self getScreenSize];
            
            NSString *normal = [NSString stringWithFormat:@"ShaMo_%i.tmx",currentLevel];
            
            self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:normal];
            self.background = [_tileMap layerNamed:@"Background"];
            self.background.anchorPoint = ccp(0, 0);
            [self addChild:_tileMap z:0];
            [self addWaypoint];
            [[GameHUD sharedHUD]resetGameHUDLayer];
            [self resetLayer];
            //**
            [self addWaves];
            
            
            [self schedule:@selector(update:)];
            [self schedule:@selector(gameLogic:) interval:0.2];
            //**
            resetGame = NO;
            
            [self readData];
            [self createMenu];
            
            [self creatButtonMenu];
            
            self.currentWave = 0;
            
            self.position = ccp(0, 0);
            
            gameHUD = [GameHUD sharedHUD];
            
        //    [gameHUD schedule:@selector(updateResourcesNom) interval: 2.0];
            
            [[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:2 swallowsTouches:YES];
           
        }else if (currentChapter == 3) {
            
            [self getScreenSize];
            
            NSString *normal = [NSString stringWithFormat:@"XueDi_%i.tmx",currentLevel];
            
            self.tileMap = [CCTMXTiledMap tiledMapWithTMXFile:normal];
            self.background = [_tileMap layerNamed:@"Background"];
            self.background.anchorPoint = ccp(0, 0);
            [self addChild:_tileMap z:0];
            
            [self addWaypoint];
            [[GameHUD sharedHUD]resetGameHUDLayer];
            [self resetLayer];
            //***
            //[self addWaypoint];
            [self addWaves];
            
            
            [self schedule:@selector(update:)];
            [self schedule:@selector(gameLogic:) interval:0.2];
            //***

            [self readData];
            [self createMenu];
            [self creatButtonMenu];
            resetGame = NO;
            self.currentWave = 0;
            
            self.position = ccp(0, 0);
            gameHUD = [GameHUD sharedHUD];
            
            //[gameHUD schedule:@selector(updateResourcesNom) interval: 2.0];
            
            [[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:2 swallowsTouches:YES];

        }
    }
    return self;
}


//***
+(void) resetGame{
    resetGame = YES;
}

-(void) resetLayer{
    resetGame = NO;

    DataModel *m = [DataModel getModel];
    [GameData sharedData].waveCount =1;
    
    NSMutableArray *towersToDelete = [[NSMutableArray alloc] init];
    NSMutableArray *targetToDelete = [[NSMutableArray alloc] init];
	for (Tower *tower in m._towers) {
        
        [towersToDelete addObject:tower];
        [self removeChild:tower cleanup:YES];
    }
    
    for (Tower *tower in towersToDelete) {
        
        [self removeChild:tower cleanup:YES];
    }
    
    [towersToDelete release];
    
    for (Creep *target in m._targets) {
        
        [targetToDelete addObject:target];
        [self removeChild:target cleanup:YES];
    }
    for (Creep *target in targetToDelete) {
       
        [self removeChild:target cleanup:YES];
    }
    
    NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
	for (Projectile *projectile in m._projectiles) {
        
        [projectilesToDelete addObject:projectile];
    }
    for (Projectile *projectile in projectilesToDelete) {
        
        [self removeChild:projectile cleanup:YES];
    }
    [projectilesToDelete release];
    
    [m._towers removeAllObjects];
    [m._targets removeAllObjects];
    [m._projectiles removeAllObjects];
    [m._waves removeAllObjects];
    [m._waypoints removeAllObjects];
    [m._pwaypoints removeAllObjects];
    
    [self addWaves];
    [self addWaypoint];
    
    // Call game logic about every second
    [self schedule:@selector(update:)];
    
    [self schedule:@selector(gameLogic:) interval:0.2];
    
    self.currentWave = 0;
    
    self.position = ccp(0, 0);
    
    //[gameHUD schedule:@selector(updateResourcesNom) interval: 2.0];
    
}
//**


-(void)addWaves {
	DataModel *m = [DataModel getModel];
	//注意：：GreenCreeps只能为0！！！！
	Wave *wave = nil;//-----------------------------------------------------------1
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:10  Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------2
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:0 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------3
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:0 Planes:0 Plane2s:10 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------4
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:0 Planes:0 Plane2s:0 Motos:10 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------5
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:0 Planes:0 Plane2s:0 Motos:0 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------6
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:0 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:10 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------7
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:0 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:10];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------8
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:1 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------9
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:1 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------10
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:1 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------11
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:10 Planes:0 Plane2s:10 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------12
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:2 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------13
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:3 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------14
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:40 Planes:0 Plane2s:0 Motos:20 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------15
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:50 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------16
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:5 Planes:0 Plane2s:5 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------17
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:10 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------18
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:30 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------19
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:40 Planes:0 Plane2s:0 Motos:20 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------20
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:50 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------21
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:5 Planes:0 Plane2s:5 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------22
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:10 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------23
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:30 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------24
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:40 Planes:0 Plane2s:0 Motos:20 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------25
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:50 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------26
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:5 Planes:0 Plane2s:5 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------27
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:10 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------28
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:30 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------29
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:40 Planes:0 Plane2s:0 Motos:20 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------30
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:50 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------31
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:2.0 RedCreeps:5 Planes:0 Plane2s:5 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------32
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.8 RedCreeps:10 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------33
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.6 RedCreeps:30 Planes:10 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;//-----------------------------------------------------------34
	wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.4 RedCreeps:40 Planes:0 Plane2s:0 Motos:20 TanKe1s:10 TanKe2s:0 KaChes:0];
	[m._waves addObject:wave];
    wave = nil;//-----------------------------------------------------------35
    wave = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:0.2 RedCreeps:50 Planes:0 Plane2s:0 Motos:0 TanKe1s:0 TanKe2s:2 KaChes:0];
	[m._waves addObject:wave];
	wave = nil;
}



- (Wave *)getCurrentWave{
	
	DataModel *m = [DataModel getModel];
    
    //**
	Wave * wave = (Wave *) [m._waves objectAtIndex:self.currentWave];
	
	return wave;
}


- (Wave *)getNextWave{
	
	DataModel *m = [DataModel getModel];
	[self readData];
	self.currentWave ++;
	
    /*if (currentChapter == 3 && self.currentWave >= 3) {
        Wave * wave = (Wave *) [m._waves objectAtIndex:1];
        return wave;
    }*/
    int WCount;
    if ([GameData sharedData].selectedLevel == 1) {
        
        WCount = [GameData sharedData].level1Wave;
        
    }else if ([GameData sharedData].selectedLevel == 2) {
        
        WCount = [GameData sharedData].level2Wave;
        
    }else if ([GameData sharedData].selectedLevel == 3) {
        
        WCount = [GameData sharedData].level3Wave;
        
    }else if ([GameData sharedData].selectedLevel == 4) {
        
        WCount = [GameData sharedData].level4Wave;
        
    }else if ([GameData sharedData].selectedLevel == 5) {
        WCount = [GameData sharedData].level5Wave;
    }

	if (currentChapter == 3 && self.currentWave >= WCount){
        [m._waves removeAllObjects];
        [self addWaves];
        self.currentWave = WCount - 5;
        Wave * wave = (Wave *) [m._waves objectAtIndex:self.currentWave];
        Wave * wa = [[Wave alloc] initWithCreep:[XiaoBin1 creep] SpawnRate:wave.spawnRate*1.2 RedCreeps:wave.redCreeps*1.2 Planes:wave.planes*1.2 Plane2s:wave.plane2s*1.2 Motos:wave.motos*1.2 TanKe1s:wave.tanke1*1.2 TanKe2s:wave.tanke2*1.2 KaChes:wave.kache*1.2];
        CCLOG(@"%d 1.REDCREEP:   %i    2.REDCREEP:   %i   ",self.currentWave,wave.redCreeps,wa.redCreeps);
        return wa;
        //CCLOG(@"系统崩溃");

    }
	
    Wave * wave = (Wave *) [m._waves objectAtIndex:self.currentWave];
    
    return wave;
}

-(void)addWaypoint {
	DataModel *m = [DataModel getModel];
	
	CCTMXObjectGroup *objects = [self.tileMap objectGroupNamed:@"Objects"];
    CCTMXObjectGroup *pobjects = [self.tileMap objectGroupNamed:@"PObjects"];
	WayPoint *wp = nil;
    WayPoint *pwp = nil;
	
	int wayPointCounter = 0;
    int pwayPointCounter=0;
	NSMutableDictionary *wayPoint;
    NSMutableDictionary *pwayPoint;
    [self readData];
    while ((wayPoint = [objects objectNamed:[NSString stringWithFormat:@"Waypoint%d", wayPointCounter]])) {
            int x = [[wayPoint valueForKey:@"x"] intValue];
            int y = [[wayPoint valueForKey:@"y"] intValue];
            
            wp = [WayPoint node];
            wp.position = ccp(x, y);
            [m._waypoints addObject:wp];
            wayPointCounter++;
        }
        
        NSAssert([m._waypoints count] > 0, @"Waypoint objects missing");
        wp = nil;
        //循环从文件中读取飞机路点坐标并加入游戏
        while ((pwayPoint = [pobjects objectNamed:[NSString stringWithFormat:@"PWaypoint%d", pwayPointCounter]])) {
            int x = [[pwayPoint valueForKey:@"x"] intValue];
            int y = [[pwayPoint valueForKey:@"y"] intValue];
            pwp = [WayPoint node];
            pwp.position = ccp(x, y);
            [m._pwaypoints addObject:pwp];
            pwayPointCounter++;
        }
        NSAssert([m._pwaypoints count] > 0, @"Waypoint objects missing");
        pwp = nil;
	
}


- (CGPoint) tileCoordForPosition:(CGPoint) position
{
	int x = position.x / (self.tileMap.tileSize.width/2);
	int y = ((self.tileMap.mapSize.height * (self.tileMap.tileSize.height/2)) - position.y) / (self.tileMap.tileSize.height/2);
	
	return ccp(x,y);
}

- (BOOL) canBuildOnTilePosition:(CGPoint) pos
{
	CGPoint towerLoc = [self tileCoordForPosition: pos];
	
	int tileGid = [self.background tileGIDAt:towerLoc];
	NSDictionary *props = [self.tileMap propertiesForGID:tileGid];
	NSString *type = [props valueForKey:@"buildable"];
    
    bool occupied = NO;
    DataModel *m = [DataModel getModel];
    for (Tower *tower in m._towers) {
        
        CGRect towerRect = CGRectMake(tower.position.x - (tower.contentSize.width/2), tower.position.y - (tower.contentSize.height/2), tower.contentSize.width, tower.contentSize.height);
        
        if (CGRectContainsPoint(towerRect, pos)) {
            occupied = YES;
        }
        
    }
	if([type isEqualToString: @"1"]&&occupied==NO) {
		return YES;
	}
	
	return NO;
}




-(void)addTower: (CGPoint)pos :(int)towerTag{
	DataModel *m = [DataModel getModel];
	
	Tower *target = nil;
    
	
	CGPoint towerLoc = [self tileCoordForPosition: pos];
	
	int tileGid = [self.background tileGIDAt:towerLoc];
	NSDictionary *props = [self.tileMap propertiesForGID:tileGid];
	NSString *type = [props valueForKey:@"buildable"];
	
    bool occupied = NO;
    for (Tower *tower in m._towers) {
        
        CGRect towerRect = CGRectMake(tower.position.x - (tower.contentSize.width/2), tower.position.y - (tower.contentSize.height/2), tower.contentSize.width, tower.contentSize.height);
        
        if (CGRectContainsPoint(towerRect, pos)) {
            occupied = YES;
            
        }
        
        
    }
	
	CCLOG(@"Buildable: %@", type);
	if([type isEqualToString: @"1"]&&occupied==NO) {
        
        
        switch (towerTag) {
            case 1:
                CCLOG(@"a");
                if (gameHUD.resources >= 25) {
                    target = [MachineGunTower tower];
                    
                    target.towerBase = [CCSprite spriteWithFile:@"danpaojizuo.png"];
                    target.towerBase.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
                    
                    [self addChild:target.towerBase z:1];
                    target.towerBase.tag = towerTag;
                    
                    [m._towersBase addObject:target.towerBase];
                    [gameHUD updateResources:-25];
                    CCLOG(@"999999");
                }
                else
                    return;
                break;
            case 2:
                
                if (gameHUD.resources >= 35) {
                    target = [FreezeTower tower];
                    target.towerBase = [CCSprite spriteWithFile:@"jiansujizuo.png"];
                    target.towerBase.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
                    [self addChild:target.towerBase z:1];
                    target.towerBase.tag = towerTag;
                    
                    [m._towersBase addObject:target.towerBase];
                    [gameHUD updateResources:-35];
                    CCLOG(@"1234455");
                }
                else
                    return;
                break;
            case 3:
                if (gameHUD.resources >= 65) {
                    target = [LongDistanceTower tower];
                    target.towerBase = [CCSprite spriteWithFile:@"shuangpaojizuo.png"];
                    target.towerBase.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
                    [self addChild:target.towerBase z:1];
                    target.towerBase.tag = towerTag;
                    
                    [m._towersBase addObject:target.towerBase];
                    [gameHUD updateResources:-65];
                    CCLOG(@"333333");
                }
                else
                    return;
                break;
            case 4:
                if (gameHUD.resources >= 75) {
                    target = [GreatPowerTower tower];
                    target.towerBase = [CCSprite spriteWithFile:@"sanpaojizuo.png"];
                    target.towerBase.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
                    [self addChild:target.towerBase z:1];
                    target.towerBase.tag = towerTag;
                    
                    [m._towersBase addObject:target.towerBase];                    [gameHUD updateResources:-75];
                }
                else
                    return;
                break;
            case 5:
                if (gameHUD.resources >= 150) {
                    target = [SuperTower tower];
                    target.towerBase = [CCSprite spriteWithFile:@"wudijizuo.png"];
                    target.towerBase.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
                    [self addChild:target.towerBase z:1];
                    target.towerBase.tag = towerTag;
                    
                    [m._towersBase addObject:target.towerBase];                    [gameHUD updateResources:-150];
                }
                else
                    return;
                break;
            default:
                break;
                
        }
        
		target.position = ccp(((towerLoc.x * 32) + 16), (self.tileMap.contentSize.height - (towerLoc.y * 32) - 16));
		[self addChild:target z:1];
		
		target.tag = towerTag;
		[m._towers addObject:target];
		
	} else {
		CCLOG(@"Tile Not Buildable");
	}
	
}


-(void) developTower {
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    if(curTouchTower.level == 1){
        switch (curTouchTower.tag) {
                
            case 1:
                if (gameHUD.resources>=15 ) {
                    
                    
                    
                    curTouchTower.range = 100;
                    // curTouchTower.pao.damage = 8;
                    [curTouchTower schedule:@selector(towerLogic:) interval:0.1];
                    
                    [gameHUD updateResources:-15];
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"danpao2.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                
                break;
            case 2:
                if(gameHUD.resources>=20){
                    curTouchTower.range = 100;
                    [gameHUD updateResources:-20];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    //[self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"jiansu2.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                break;
            case 3:
                if(gameHUD.resources>=35){
                    curTouchTower.range = 100;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    [gameHUD updateResources:-35];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"shuangpao2.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                break;
            case 4:
                if(gameHUD.resources>=40){
                    curTouchTower.range = 100;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    [gameHUD updateResources:-40];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"sanpao2.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                break;
                
            case 5:
                if(gameHUD.resources>=80){
                    curTouchTower.range = 100;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    [gameHUD updateResources:-80];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"wudi2.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                break;
                
            default:
                break;
        }
    curTouchTower.level = 2;
    }
    else if(curTouchTower.level == 2){
        switch (curTouchTower.tag) {
                
            case 1:
                
                
                if (gameHUD.resources>=15 ) {
                    curTouchTower.range = 150;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    // [tower schedule:@selector(towerLogic:) interval:0.1];
                    [gameHUD updateResources:-15];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                   // [self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"danpao3.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                
                break;
            case 2:
                if (gameHUD.resources>=20 ) {
                    curTouchTower.range = 150;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    // [tower schedule:@selector(towerLogic:) interval:0.1];
                    [gameHUD updateResources:-20];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    //[self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"jiansu3.png"];
                    [curTouchTower setDisplayFrame:frame];
                    CCLOG(@"12444");
                }
                
                break;
            case 3:
                if (gameHUD.resources>=35 ) {
                    curTouchTower.range = 150;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    // [tower schedule:@selector(towerLogic:) interval:0.1];
                    [gameHUD updateResources:-35];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                   // [self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"shuangpao3.png"];
                    [curTouchTower setDisplayFrame:frame];
                }
                break;
            case 4:
                if (gameHUD.resources>=40 ) {
                    curTouchTower.range = 150;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    // [tower schedule:@selector(towerLogic:) interval:0.1];
                    [gameHUD updateResources:-40];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                   // [self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"sanpao3.png"];
                    [curTouchTower setDisplayFrame:frame];                }
                break;
                
            case 5:
                if (gameHUD.resources>=80 ) {
                    curTouchTower.range = 150;
                    curTouchTower.target.hp=curTouchTower.target.hp-10;
                    // [tower schedule:@selector(towerLogic:) interval:0.1];
                    [gameHUD updateResources:-80];
                    
                    [self removeChild:developBackGround cleanup:YES];
                    [self removeChild:developmenu cleanup:YES];
                    [self removeChild:sellmenu cleanup:YES];
                    [self removeChild:_developCost cleanup:YES];
                    [self removeChild:_sellCost cleanup:YES];
                    //[self removeChild:curTouchTower cleanup:YES];
                    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"developtower.plist"];
                    CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"wudi3.png"];
                    [curTouchTower setDisplayFrame:frame];
                   
                }
                break;
            default:
                break;
        }
        curTouchTower.level = 3;
    }
    else if(curTouchTower.level==3){
        
    }
}

- (void) sellTower {
    
    DataModel * m=[DataModel getModel];
    [[SimpleAudioEngine sharedEngine]playEffect:@"unable.mp3"];
    if(curTouchTower.level == 1){
        switch (curTouchTower.tag) {
                
            case 1:
                
                [gameHUD updateResources:15];
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 2:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 3:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 4:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 5:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            default:
                break;
        }
        
    }
    if (curTouchTower.level == 2) {
        switch (curTouchTower.tag) {
                
            case 1:
                
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 2:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 3:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 4:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 5:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            default:
                break;
        }
    }
    if (curTouchTower.level == 3) {
        switch (curTouchTower.tag) {
                
            case 1:
                
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 2:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 3:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 4:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            case 5:
                [gameHUD updateResources:15];
                
                [self removeChild:developBackGround cleanup:YES];
                [self removeChild:developmenu cleanup:YES];
                [self removeChild:sellmenu cleanup:YES];
                [self removeChild:curTouchTower cleanup:YES];
                [self removeChild:curTouchTower.towerBase cleanup:YES];
                [self removeChild:_developCost cleanup:YES];
                [self removeChild:_sellCost cleanup:YES];
                [m._towers removeObject:curTouchTower];
                curTouchTower = nil;
                break;
            default:
                break;
                
        }
    }
}

//————————————————————————————————————————————————————————————————接收单击事件
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
   
    DataModel *m = [DataModel getModel];
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    //如果存在升级菜单，则先消除
    if ([self getChildByTag:100]!=nil) {
        CCNode * backGroud=[self getChildByTag:100];
        [self removeChild:backGroud cleanup:YES];
        [self removeChild:developmenu cleanup:YES];
        [self removeChild:sellmenu cleanup:YES];
        [self removeChild:_developCost cleanup:YES];
        [self removeChild:_sellCost cleanup:YES];
    }
    
    for (Tower *tower in m._towers) {
        
        
        if (CGRectContainsPoint(tower.boundingBox, touchLocation)) {
                curTouchTower = tower;       
            [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
            //升级和卖出的图片背景图
            if(curTouchTower.level == 1){//flag用于判断这个塔被升级了几次
                //curTouchTower = tower;
                CCSprite *spriteBackGround = [CCSprite spriteWithFile:@"Range.png"];
                spriteBackGround.position=curTouchTower.position;
                spriteBackGround.tag=100;
                
                //升级花费的lable
                [self addChild:spriteBackGround z:1];
                CCMenuItem *item1 = [CCMenuItemImage itemWithNormalImage:@"level-1.png" selectedImage:@"level-1.png" target:self selector:@selector(developTower)];
                developmenu = [CCMenu menuWithItems:item1, nil];
                developmenu.position = ccp(spriteBackGround.position.x-40,spriteBackGround.position.y);
                [self addChild:developmenu z:2];
                CCMenuItem *item2 = [CCMenuItemImage itemWithNormalImage:@"sell1.png" selectedImage:@"sell1.png" target:self selector:@selector(sellTower)];
                
                sellmenu = [CCMenu menuWithItems:item2, nil];
                sellmenu.position = ccp(spriteBackGround.position.x+40, spriteBackGround.position.y);
                [self addChild:sellmenu z:2];
                
                developBackGround = spriteBackGround;
                CCLabelTTF *developCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
                developCost.position = ccp(curTouchTower.position.x-40,curTouchTower.position.y-50);
                developCost.color = ccc3(255, 0, 0);
                [self addChild:developCost z:1];
                
                CCLabelTTF *sellCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
                sellCost.position = ccp(curTouchTower.position.x+40,curTouchTower.position.y-50);
                developCost.color = ccc3(255, 0, 0);
                [self addChild:sellCost z:1];
                
                _developCost = developCost;
                _sellCost = sellCost;
                
                switch (curTouchTower.tag) {
                    case 1:
                        spriteBackGround.scale = 2.1;
                        [developCost setString:[NSString stringWithFormat:@"$ 15"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 15"]];
                        
                        
                        break;
                    case 2:
                        spriteBackGround.scale = 2.1;
                        [developCost setString:[NSString stringWithFormat:@"$ 20"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 20"]];
                        break;
                    case 3:
                        spriteBackGround.scale = 2.1;
                        [developCost setString:[NSString stringWithFormat:@"$ 35"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 35"]];
                        break;
                    case 4:
                        spriteBackGround.scale = 2.1;
                        [developCost setString:[NSString stringWithFormat:@"$ 40"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 40"]];
                        break;
                    case 5:
                        spriteBackGround.scale = 2.1;
                        [developCost setString:[NSString stringWithFormat:@"$ 80"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 80"]];
                        break;
                        
                    default:
                        break;
                }//End switch
            }//End if(curTouchTower.level == 1)
            else if(curTouchTower.level == 2){
                CCSprite *spriteBackGround = [CCSprite spriteWithFile:@"Range.png"];
                spriteBackGround.position=curTouchTower.position;
                spriteBackGround.tag=100;
                //升级花费的lable
                [self addChild:spriteBackGround z:1];
                CCMenuItem *item1 = [CCMenuItemImage itemWithNormalImage:@"level-2.png" selectedImage:@"level-2.png" target:self selector:@selector(developTower)];
                CCMenu *mn1 = [CCMenu menuWithItems:item1, nil];
                mn1.position = ccp(spriteBackGround.position.x-40,spriteBackGround.position.y);
                [self addChild:mn1 z:2];
                CCMenuItem *item2 = [CCMenuItemImage itemWithNormalImage: @"sell1.png" selectedImage:@"sell1.png" target:self selector:@selector(sellTower)];
                
                CCMenu *mn2 = [CCMenu menuWithItems:item2, nil];
                mn2.position = ccp(spriteBackGround.position.x+40, spriteBackGround.position.y);
                [self addChild:mn2 z:2];
                
                developBackGround = spriteBackGround;
               
                developmenu = mn1;
                sellmenu = mn2;
                CCLabelTTF *developCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
                developCost.position = ccp(curTouchTower.position.x-40,curTouchTower.position.y-50);
                developCost.color = ccc3(255, 0, 0);
                [self addChild:developCost z:1];
                
                CCLabelTTF *sellCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
                sellCost.position = ccp(curTouchTower.position.x+40,curTouchTower.position.y-50);
                developCost.color = ccc3(255, 0, 0);
                [self addChild:sellCost z:1];
                
                _developCost = developCost;
                _sellCost = sellCost;
                
                switch (curTouchTower.tag) {
                    case 1:
                        developBackGround.scale = 3;
                        [developCost setString:[NSString stringWithFormat:@"$ 25"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 25"]];
                        
                        break;
                    case 2:
                        developBackGround.scale = 3;
                        [developCost setString:[NSString stringWithFormat:@"$ 30"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 30"]];
                        break;
                    case 3:
                        developBackGround.scale = 3;
                        [developCost setString:[NSString stringWithFormat:@"$ 45"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 45"]];
                        break;
                    case 4:
                        developBackGround.scale = 3;
                        [developCost setString:[NSString stringWithFormat:@"$ 50"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 50"]];
                        break;
                    case 5:
                        developBackGround.scale = 3;
                        [developCost setString:[NSString stringWithFormat:@"$ 80"]];
                        [sellCost setString:[NSString stringWithFormat:@"$ 80"]];
                        break;
                        
                    default:
                        break;
                }
            }//End if(curTouchTower.level == 2)
      
        else if (curTouchTower.level == 3)
        {
            CCSprite *spriteBackGround = [CCSprite spriteWithFile:@"Range.png"];
            spriteBackGround.position=curTouchTower.position;
            spriteBackGround.tag=100;
            //升级花费的lable
            [self addChild:spriteBackGround z:1];
            CCMenuItem *item1 = [CCMenuItemImage itemWithNormalImage:@"level-3.png" selectedImage:@"level-3.png" target:self selector:@selector(developTower)];
            CCMenu *mn1 = [CCMenu menuWithItems:item1, nil];
            mn1.position = ccp(spriteBackGround.position.x-40,spriteBackGround.position.y);
            [self addChild:mn1 z:2];
            CCMenuItem *item2 = [CCMenuItemImage itemWithNormalImage: @"sell1.png" selectedImage:@"sell1.png" target:self selector:@selector(sellTower)];
            
            CCMenu *mn2 = [CCMenu menuWithItems:item2, nil];
            mn2.position = ccp(spriteBackGround.position.x+40, spriteBackGround.position.y);
            [self addChild:mn2 z:2];
            
            developBackGround = spriteBackGround;
            developmenu = mn1;
            sellmenu = mn2;
            CCLabelTTF *developCost = [CCLabelTTF labelWithString:@"max" fontName:@"Marker Felt" fontSize:10];
            developCost.position = ccp(curTouchTower.position.x-40,curTouchTower.position.y-50);
            developCost.color = ccc3(255, 0, 0);
            [self addChild:developCost z:1];
            
            CCLabelTTF *sellCost = [CCLabelTTF labelWithString:@"$" fontName:@"Marker Felt" fontSize:10];
            sellCost.position = ccp(curTouchTower.position.x+40,curTouchTower.position.y-50);
          
            [self addChild:sellCost z:1];
            
            _developCost = developCost;
            _sellCost = sellCost;
            
            switch (curTouchTower.tag) {
                case 1:
                    developBackGround.scale = 4.5;
                    [developCost setString:[NSString stringWithFormat:@"max"]];
                    [sellCost setString:[NSString stringWithFormat:@"$ 25"]];
                    
                    break;
                case 2:
                    developBackGround.scale = 4.5;
                    [developCost setString:[NSString stringWithFormat:@"max"]];
                    [sellCost setString:[NSString stringWithFormat:@"$ 25"]];
                    break;
                case 3:
                    developBackGround.scale = 4.5;
                    [developCost setString:[NSString stringWithFormat:@"max"]];
                    [sellCost setString:[NSString stringWithFormat:@"$ 35"]];
                    break;
                case 4:
                    developBackGround.scale = 4.5;
                    [developCost setString:[NSString stringWithFormat:@"max"]];
                    [sellCost setString:[NSString stringWithFormat:@"$ 45"]];
              
                    break;
                case 5:
                    developBackGround.scale = 4.5;
                    [developCost setString:[NSString stringWithFormat:@"max"]];                  
                    [sellCost setString:[NSString stringWithFormat:@"$ 55"]];
                    break;
                    
                default:
                    break;
                }
            }//End if(curTouchTower.level == 3)
        }//End for循环遍历
    }
    return YES;
}

- (void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector]touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

///***********
-(void)createEnemys
{
    DataModel *m=[DataModel getModel];
    if (!m._arrEnemy)
        m._arrEnemy = [[CCArray alloc]init];
    else
        [m._arrEnemy removeAllObjects];
    
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"xiaobin_default.plist"];
    
    CCSpriteBatchNode *bachNode = [CCSpriteBatchNode batchNodeWithFile:@"xiaobin_default.png"];
    
    [self addChild:bachNode z:0 tag:ChildTagSpriteBatch];
    
    for (int i=0; i<_MaxEnemy; i++) {
        NSString *spriteName = [NSString stringWithFormat:@"xiaoren%d.png",1];
        EnemySprite *enemy = [EnemySprite spriteWithSpriteFrameName:spriteName];
        enemy.visible = NO;
        enemy.scale = 1.0;
        enemy.anchorPoint = ccp(.5f,.5f);
        enemy.position = _startLocation;
        enemy.m_speed = CCRANDOM_0_1()*80+60;
        [bachNode addChild:enemy];
        [m._arrEnemy addObject:enemy];
    }
    [self schedule:@selector(updateEnemy:) interval:.8f];
}
-(void)addTarget {
    
	DataModel *m = [DataModel getModel];
	Wave * wave = [self getCurrentWave];
	if (wave.redCreeps <= 0 && wave.planes <=0 &&wave.plane2s <=0 && wave.motos<=0 && wave.tanke1<=0 && wave.tanke2<=0 && wave.kache<=0) {
        
        return; //
	}
	
    Creep *target = nil;
    int flag=0;
    if (wave.planes>0) {
        target=[Plane creep];
        wave.planes--;
        flag=1;
    }
    else if (wave.plane2s>0){
        target=[Plane2 creep];
        wave.plane2s--;
        flag=3;
    }
    else if (wave.redCreeps>0){
        target=[XiaoBin1 creep];
        wave.redCreeps--;
        flag=2;
    }
    else if (wave.motos>0){
        target=[Moto creep];
        wave.motos--;
    }
    else if (wave.tanke1>0){
        target=[TanKe1 creep];
        wave.tanke1--;
    }
    else if (wave.tanke2>0){
        target=[TanKe2 creep];
        wave.tanke2--;
    }
    else if (wave.kache)
    {
        target=[KaChe creep];
        wave.kache--;
    }
   
	if (flag==0||flag==2) {
         [self readData];
           
            WayPoint *waypoint = [target getCurrentWaypoint ];
            target.position = waypoint.position;
            waypoint = [target getNextWaypoint];
            [self addChild:target z:1];
            //****
            CCSprite *sprite1 = [CCSprite spriteWithFile:@"health_bar_red.png"];
            target.creepHealthBarBg = [CCProgressTimer progressWithSprite:sprite1];
            target.creepHealthBarBg.percentage = 100;
            [target.creepHealthBarBg setScale:0.1];
            target.creepHealthBarBg.position = ccp(target.position.x,(target.position.y+20));
            [self addChild:target.creepHealthBarBg z:3];
            
            //***
            CCSprite *sprite2 = [CCSprite spriteWithFile:@"health_bar_green.png"];
            target.creepHealthBar = [CCProgressTimer progressWithSprite:sprite2];
            ///////***
            target.creepHealthBar.midpoint = ccp(0, 0.5);
            target.creepHealthBar.barChangeRate = ccp(1, 0);//进度条如何缩放
            //****
            target.creepHealthBar.type = kCCProgressTimerTypeBar;
            //**target.creepHealthBar.type = kCCProgressTimerTypeHorizontalBarLR;
            target.creepHealthBar.percentage = 100;
            [target.creepHealthBar setScale:0.1];
            target.creepHealthBar.position = ccp(target.position.x,(target.position.y+20));
            [self addChild:target.creepHealthBar z:4];
            
            
            int moveDuration = target.moveDuration;
            
            id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
            id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
            [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
            
            // Add to targets array
            target.tag = 1;
            [m._targets addObject:target];

    }
       else if ((flag==1||flag==3) )
    {
        WayPoint *pwaypoint = [target getCurrentPWaypoint ];
        target.position = pwaypoint.position;
        pwaypoint = [target getNextPWaypoint ];
        [self addChild:target z:1];
        //****
        CCSprite *sprite1 = [CCSprite spriteWithFile:@"health_bar_red.png"];
        target.creepHealthBarBg = [CCProgressTimer progressWithSprite:sprite1];
        //target.creepHealthBar = [CCProgressTimer progressWithFile:@"health_bar_red.png"];
        //***
        // target.creepHealthBarBg.type = kCCProgressTimerTypeHorizontalBarLR;
        target.creepHealthBarBg.percentage = 100;
        [target.creepHealthBarBg setScale:0.1];
        target.creepHealthBarBg.position = ccp(target.position.x,(target.position.y+20));
        [self addChild:target.creepHealthBarBg z:3];
        
        //***
        CCSprite *sprite2 = [CCSprite spriteWithFile:@"health_bar_green.png"];
        target.creepHealthBar = [CCProgressTimer progressWithSprite:sprite2];
        ///////***
        target.creepHealthBar.midpoint = ccp(0, 0.5);
        target.creepHealthBar.barChangeRate = ccp(1, 0);//进度条如何缩放
        //****
        target.creepHealthBar.type = kCCProgressTimerTypeBar;
        //**target.creepHealthBar.type = kCCProgressTimerTypeHorizontalBarLR;
        target.creepHealthBar.percentage = 100;
        [target.creepHealthBar setScale:0.1];
        target.creepHealthBar.position = ccp(target.position.x,(target.position.y+20));
        [self addChild:target.creepHealthBar z:4];
        
        
        int moveDuration = target.moveDuration;
        id actionMove = [CCMoveTo actionWithDuration:moveDuration position:pwaypoint.position];
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPPath:)];
        [target runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
        
        // Add to targets array
        target.tag = 10;
        [m._targets addObject:target];
    }}

-(void)FollowPath:(id)sender {
    [self readData];
        Creep *creep = (Creep *)sender;
        
        WayPoint * waypoint = [creep getNextWaypoint];
        float moveDuration = [creep moveDurScale];
        
        id actionMove = [CCMoveTo actionWithDuration:moveDuration position:waypoint.position];
        
        id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
        //[creep stopAllActions];
        [creep runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
    
	
}
-(void)FollowPPath:(id)sender {
    
	Creep *creep = (Creep *)sender;
	
	WayPoint * pwaypoint = [creep getNextPWaypoint];
    CGFloat x=pwaypoint.position.x;
    CGFloat y=pwaypoint.position.y;
    CCLOG(@"飞机经过的第----%d个-------点：x:%f  y:%f",++temp,x,y);
    
	int moveDuration = creep.moveDuration;
	id actionMove = [CCMoveTo actionWithDuration:moveDuration position:pwaypoint.position];
    
	id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPPath:)];
	[creep stopAllActions];
	[creep runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}
//------------------------------------------------------------------------
//------------------------------------------------------------------------
//敌人每走到一个点之后，获取下一个路点，继续行走_________________________________地面部队
-(void)ResumePath:(id)sender {
    Creep *creep = (Creep *)sender;
    
    WayPoint * cWaypoint = [creep getCurrentWaypoint];//destination
    WayPoint * lWaypoint = [creep getLastWaypoint];//startpoint
    
    float waypointDist = fabsf(cWaypoint.position.x - lWaypoint.position.x);
    float creepDist = fabsf(cWaypoint.position.x - creep.position.x);
    float distFraction = creepDist / waypointDist;
    //float moveDuration = creep.moveDuration * distFraction; //Time it takes to go from one way point to another * the fraction of how far is left to go (meaning it will move at the correct speed)
    float durScale = [creep moveDurScale];
    float moveDuration = durScale * distFraction;
    id actionMove = [CCMoveTo actionWithDuration:moveDuration position:cWaypoint.position];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPath:)];
    //[creep stopAllActions];
    //id jianactionMove = [CCMoveTo actionWithDuration:moveDuration position:cWaypoint.position];
    [creep runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}
-(void)ResumePPath:(id)sender {
    Creep *creep = (Creep *)sender;
    
    WayPoint * cWaypoint = [creep getCurrentPWaypoint];//destination
    WayPoint * lWaypoint = [creep getLastPWaypoint];//startpoint
    
    float pwaypointDist = fabsf(cWaypoint.position.x - lWaypoint.position.x);
    float creepDist = fabsf(cWaypoint.position.x - creep.position.x);
    float distFraction = creepDist / pwaypointDist;
    float moveDuration = creep.moveDuration * distFraction; //Time it takes to go from one way point to another * the fraction of how far is left to go (meaning it will move at the correct speed)
    id actionMove = [CCMoveTo actionWithDuration:moveDuration position:cWaypoint.position];
    id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(FollowPPath:)];
	//[creep stopAllActions];
    //id jianactionMove = [CCMoveTo actionWithDuration:moveDuration position:cWaypoint.position];
	[creep runAction:[CCSequence actions:actionMove, actionMoveDone, nil]];
}
//------------------------------------------------------------------------
//------------------------------------------------------------------------

-(void)gameLogic:(ccTime)dt {
    
    
	
    //	DataModel *m = [DataModel getModel];
	Wave * wave = [self getCurrentWave];
	static double lastTimeTargetAdded = 0;
    double now = [[NSDate date] timeIntervalSince1970];
    [self readData];
    if(lastTimeTargetAdded == 0 || now - lastTimeTargetAdded >= wave.spawnRate) {
        [self addTarget];
        /*if (currentChapter != 2) {
            [self addTarget];
        }else{
        [self createEnemys];
        }*/
        lastTimeTargetAdded = now;
    }
	
}

- (void)update:(ccTime)dt {
    if (resetGame == YES) {
        [self resetLayer];
    }

    DataModel *m = [DataModel getModel];
	NSMutableArray *projectilesToDelete = [[NSMutableArray alloc] init];
    for (Projectile *projectile in m._projectiles) {
		
		CGRect projectileRect = CGRectMake(projectile.position.x - (projectile.contentSize.width/2),
										   projectile.position.y - (projectile.contentSize.height/2),
										   projectile.contentSize.width,
										   projectile.contentSize.height);
        
		NSMutableArray *targetsToDelete = [[NSMutableArray alloc] init];
        
		for (CCSprite *target in m._targets) {
            
			CGRect targetRect = CGRectMake(target.position.x - (target.contentSize.width/2),
										   target.position.y - (target.contentSize.height/2),
										   target.contentSize.width,
										   target.contentSize.height);
            
			if (CGRectIntersectsRect(projectileRect, targetRect)) {
                //实现碰撞检测
				[projectilesToDelete addObject:projectile];
                
                Creep *creep = (Creep *)target;
//——————————————————————————————————————————————————————这里的if语句可以用switch
                //tower.target = creep;
                if (projectile.tag ==1){//MachineGun Projectile
                    [[SimpleAudioEngine sharedEngine]playEffect:@"ta1.wav"];
                    CCParticleSystem *explosion = [CCParticleSystemQuad particleWithFile:@"explosion3.plist"];
                    explosion.positionType = kCCPositionTypeGrouped;
                    // 随发射器的位置变动而变动
                    explosion.autoRemoveOnFinish = YES;
                    explosion.position = creep.position;
                    [self addChild:explosion z:4];
                    creep.hp = creep.hp - 1.5 ;
                    
                    if (creep.hp <= 0) {
                        [[SimpleAudioEngine sharedEngine]playEffect:@"xiaobing.wav"];
                        
                        [self removeChild:creep.creepHealthBar cleanup:YES];
                        [targetsToDelete addObject:target];
                        [gameHUD updateResources:1];
                        switch (creep.rag) {
                            case 1:
                                [gameHUD updateResources:1];
                                break;
                            case 2:
                                [gameHUD updateResources:2];
                                break;
                            case 3:
                                [gameHUD updateResources:3];
                                break;
                            case 4:
                                [gameHUD updateResources:4];
                                break;
                            case 5:
                                [gameHUD updateResources:5];
                                break;
                            case 6:
                                [gameHUD updateResources:6];
                                break;
                            case 7:
                                [gameHUD updateResources:7];
                                break;
                        }
                        
                    }
                    break;
                }
                if (projectile.tag ==2){//Freeze projectile
                    CCParticleSystem *explosion = [CCParticleSystemQuad particleWithFile:@"explosion5.plist"];
                    [[SimpleAudioEngine sharedEngine]playEffect:@"jiansu.wav"];
                    explosion.positionType = kCCPositionTypeGrouped;
                    // 随发射器的位置变动而变动
                    explosion.autoRemoveOnFinish = YES;
                    explosion.position = creep.position;
                    [self addChild:explosion z:4];
                    WayPoint *next_tar = nil;
                    id actionFreeze = nil;
                    float slowDuration = creep.moveDuration * 2;
                    if (target.tag==10 ||target.tag==11) {
                        next_tar = [creep getCurrentPWaypoint];
                        actionFreeze = [CCMoveTo actionWithDuration:slowDuration position:next_tar.position];
                        id actionMoveResume = [CCCallFuncN actionWithTarget:self selector:@selector(ResumePPath:)];
                        //[creep stopAllActions];
                        [creep runAction:[CCSequence actions:actionFreeze, actionMoveResume, nil]];
                    }
                    else
                    {
                        next_tar = [creep getCurrentWaypoint];
                        actionFreeze = [CCMoveTo actionWithDuration:slowDuration position:next_tar.position];
                        id actionMoveResume = [CCCallFuncN actionWithTarget:self selector:@selector(ResumePath:)];
                        //[creep stopAllActions];
                        [creep runAction:[CCSequence actions:actionFreeze, actionMoveResume, nil]];
                    }
                    break;
                }
                if (projectile.tag ==3){
                    //远程炮弹
                    CCParticleSystem *explosion = [CCParticleSystemQuad particleWithFile:@"explosion2.plist"];
                    [[SimpleAudioEngine sharedEngine]playEffect:@"ta3.wav"];
                    explosion.positionType = kCCPositionTypeGrouped;
                    // 随发射器的位置变动而变动
                    explosion.autoRemoveOnFinish = YES;
                    explosion.position = creep.position;
                    [self addChild:explosion z:4];

                    creep.hp = creep.hp - 2;
                    
                    if (creep.hp <= 0) {
                        [targetsToDelete addObject:target];
                        switch (creep.rag) {
                            case 1:
                                [gameHUD updateResources:1];
                                break;
                            case 2:
                                [gameHUD updateResources:2];
                                break;
                            case 3:
                                [gameHUD updateResources:3];
                                break;
                            case 4:
                                [gameHUD updateResources:4];
                                break;
                            case 5:
                                [gameHUD updateResources:5];
                                break;
                            case 6:
                                [gameHUD updateResources:6];
                                break;
                            case 7:
                                [gameHUD updateResources:7];
                                break;
                        }
                    }
                    break;
                }
                if (projectile.tag ==4){
                    CCParticleSystem *explosion = [CCParticleSystemQuad particleWithFile:@"explosion1.plist"];
                    [[SimpleAudioEngine sharedEngine]playEffect:@"ta4.wav"];
                    explosion.positionType = kCCPositionTypeGrouped;
                    // 随发射器的位置变动而变动
                    explosion.autoRemoveOnFinish = YES;
                    explosion.position = creep.position;
                    [self addChild:explosion z:4];
                    creep.hp = creep.hp - 6;
                    
                    if (creep.hp <= 0) {
                        [targetsToDelete addObject:target];
                        switch (creep.rag) {
                            case 1:
                                [gameHUD updateResources:1];
                                break;
                            case 2:
                                [gameHUD updateResources:2];
                                break;
                            case 3:
                                [gameHUD updateResources:3];
                                break;
                            case 4:
                                [gameHUD updateResources:4];
                                break;
                            case 5:
                                [gameHUD updateResources:5];
                                break;
                            case 6:
                                [gameHUD updateResources:6];
                                break;
                            case 7:
                                [gameHUD updateResources:7];
                                break;
                        }
                    }
                    break;
                }
                if (projectile.tag ==5){
                    CCParticleSystem *explosion = [CCParticleSystemQuad particleWithFile:@"explosion4.plist"];
                    [[SimpleAudioEngine sharedEngine]playEffect:@"ta5.wav"];
                    explosion.positionType = kCCPositionTypeGrouped;
                    // 随精灵的位置变动而变动
                    explosion.autoRemoveOnFinish = YES;
                    explosion.position = creep.position;
                    [self addChild:explosion z:4];
                    for (CCSprite *target in m._targets) {
                        Creep *creep = (Creep *)target;
                        double distance = ccpDistance(projectile.position, creep.position);
                        if (distance <= 100) {
                            creep.hp = creep.hp - 1;
                            if (creep.hp <= 0) {
                                
                                [targetsToDelete addObject:target];
                                switch (creep.rag) {
                                    case 1:
                                        [gameHUD updateResources:1];
                                        break;
                                    case 2:
                                        [gameHUD updateResources:2];
                                        break;
                                    case 3:
                                        [gameHUD updateResources:3];
                                        break;
                                    case 4:
                                        [gameHUD updateResources:4];
                                        break;
                                    case 5:
                                        [gameHUD updateResources:5];
                                        break;
                                    case 6:
                                        [gameHUD updateResources:6];
                                        break;
                                    case 7:
                                        [gameHUD updateResources:7];
                                        break;
                                }
                            }
                        }
                    }
                    
                    break;
                }
                break;
                
			}
		}
        
		
		for (CCSprite *target in targetsToDelete) {
            Creep *creep = (Creep *)target;
			[m._targets removeObject:target];
			[self removeChild:target cleanup:YES];
            [self removeChild:creep.creepHealthBar cleanup:YES];
            [self removeChild:creep.creepHealthBarBg cleanup:YES];
		}
        
		[targetsToDelete release];
	}
	
	for (CCSprite *projectile in projectilesToDelete) {
		[m._projectiles removeObject:projectile];
        
		[self removeChild:projectile cleanup:YES];
	}
	[projectilesToDelete release];
    
    
    Wave *wave = [self getCurrentWave];
    int WCount;
    if ([GameData sharedData].selectedLevel == 1) {
        
        WCount = [GameData sharedData].level1Wave;
        
    }else if ([GameData sharedData].selectedLevel == 2) {
        
        WCount = [GameData sharedData].level2Wave;
        
    }else if ([GameData sharedData].selectedLevel == 3) {
        
        WCount = [GameData sharedData].level3Wave;
        
    }else if ([GameData sharedData].selectedLevel == 4) {
        
        WCount = [GameData sharedData].level4Wave;
        
    }else if ([GameData sharedData].selectedLevel == 5) {
        WCount = [GameData sharedData].level5Wave;
    }

    if ([m._targets count] ==0 && wave.redCreeps <= 0 &&wave.planes<=0 && wave.plane2s<=0 &&wave.motos<=0 && wave.tanke1<=0 && wave.tanke2<=0 &&wave.kache<=0) {
        if (currentChapter != 3 && [GameData sharedData].waveCount >= WCount) {
            [GameData sharedData].currentLevelSolved = YES;
            CCTransitionFade *t = [CCTransitionSlideInR transitionWithDuration:0.2f scene:[LevelResult scene]];
            [[CCDirector sharedDirector]replaceScene:t];
        }
        [self getNextWave];
        [GameData sharedData].waveCount ++;
        [gameHUD updateWaveCount];
    }
}


- (CGPoint)boundLayerPos:(CGPoint)newPos {
    CGSize winSize = [CCDirector sharedDirector].winSize;
    CGPoint retval = newPos;
    retval.x = MIN(retval.x, 0);
    retval.x = MAX(retval.x, -_tileMap.contentSize.width+winSize.width);
    retval.y = MIN(0, retval.y);
    retval.y = MAX(-_tileMap.contentSize.height+winSize.height, retval.y);
    return retval;
}

- (void)handlePanFrom:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint touchLocation = [recognizer locationInView:recognizer.view];
        touchLocation = [[CCDirector sharedDirector] convertToGL:touchLocation];
        touchLocation = [self convertToNodeSpace:touchLocation];
        
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [recognizer translationInView:recognizer.view];
        translation = ccp(translation.x, -translation.y);
        CGPoint newPos = ccpAdd(self.position, translation);
        self.position = [self boundLayerPos:newPos];
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
        
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
		float scrollDuration = 0.2;
		CGPoint velocity = [recognizer velocityInView:recognizer.view];
		CGPoint newPos = ccpAdd(self.position, ccpMult(ccp(velocity.x, velocity.y * -1), scrollDuration));
		newPos = [self boundLayerPos:newPos];
        
		[self stopAllActions];
		CCMoveTo *moveTo = [CCMoveTo actionWithDuration:scrollDuration position:newPos];
		[self runAction:[CCEaseOut actionWithAction:moveTo rate:1]];
        
    }
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	[super dealloc];
}






-(void)getScreenSize{
    screenSize = [CCDirector sharedDirector].winSize;
}

-(void)readData{
    currentChapter = [GameData sharedData].selectedChapter;
    currentLevel = [GameData sharedData].selectedLevel;
}
/*-(void)addBg{
    [self getScreenSize];
    CCSprite *background;
    NSString *normal = [NSString stringWithFormat:@"%i-level%i.png",currentChapter,currentLevel];
    background = [CCSprite spriteWithFile:normal];
    
    background.position = ccp(screenSize.width / 2, screenSize.height / 2);
    
    [self addChild:background z:-100];
}
*/
-(void)playBackgrounMusic{
    GameData *data = [GameData sharedData];
    
    if (data.backgroundMusicMuted == NO) {
        if ([SimpleAudioEngine sharedEngine].isBackgroundMusicPlaying == NO) {
            [[SimpleAudioEngine sharedEngine]playBackgroundMusic:@"bg_startGameScene.mp3" loop:YES];
            [CDAudioManager sharedManager].backgroundMusic.volume = 0.5f;
        }
    }else{
        [CDAudioManager sharedManager].backgroundMusic.volume = 0.15f;
    }
}

//菜单
-(void)createMenu{
    [self getScreenSize];
    
    CCMenuItemImage *buttonMenu = [CCMenuItemImage itemWithNormalImage:@"button_menu.png" selectedImage:@"button_menu.png" target:self selector:@selector(goMenu)];
    
    buttonMenu.position = ccp(screenSize.width * 0.7,screenSize.height * 0.9);
    
    
    CCMenu *menu = [CCMenu menuWithItems:buttonMenu, nil];
    
    menu.position = CGPointZero;
    [self addChild:menu z:2];
    
}

-(void)goMenu{
    ccColor4B c = {0,0,0,0};
    
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    //[[CCDirector sharedDirector]pause];

    [GamePause layerWithColor:c delegate:self];
}
-(void)goSpeed{
    GameData *data = [GameData sharedData];
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    data.speed = 2.0f;
    [[[CCDirector sharedDirector]scheduler]setTimeScale:2.0f];
    [self createSpeedOn];
}
-(void)goSpeedSlow{
    GameData *data = [GameData sharedData];
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    data.speed = 1.0f;
    [[[CCDirector sharedDirector]scheduler]setTimeScale:1.0f];
    [self createSpeedOff];
}

-(void) createOn {
    [self removeChild:gameSwitch cleanup:YES];
    [self getScreenSize];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"game_on.png" selectedImage:@"game_on.png" target:self selector:@selector(turnGameOff)];
    
    gameSwitch = [CCMenu menuWithItems:button1, nil];
    gameSwitch.position= ccp(screenSize.width * 0.8, screenSize.height * 0.9);
    
    [self addChild:gameSwitch z:11];
    
    
    
}


-(void)createOff{
    [self removeChild:gameSwitch cleanup:YES];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"game_off.png" selectedImage:@"game_off.png" target:self selector:@selector(turnGameOn)];
    
    gameSwitch = [CCMenu menuWithItems:button1, nil];
    gameSwitch.position= ccp(screenSize.width * 0.8, screenSize.height * 0.9);
    
    [self addChild:gameSwitch z:11];
}


-(void)turnGameOn{
    
    GameData *data = [GameData sharedData];
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    data.gamePaused = YES;
    [[CCDirector sharedDirector] resume];
    [self createOn];
}

-(void)turnGameOff{
    
    GameData *data = [GameData sharedData];
    [[SimpleAudioEngine sharedEngine]playEffect:@"sound.caf"];
    data.gamePaused = NO;
    [[CCDirector sharedDirector] pause];
    [self createOff];
}
-(void) createSpeedOn {
    [self removeChild:Speed cleanup:YES];
    [self getScreenSize];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"button_speed2.png" selectedImage:@"button_speed2.png" target:self selector:@selector(goSpeedSlow)];
    
    Speed = [CCMenu menuWithItems:button1, nil];
    Speed.position= ccp(screenSize.width * 0.9, screenSize.height * 0.9);
    
    [self addChild:Speed z:11];
    
    
    
}


-(void)createSpeedOff{
    [self removeChild:Speed cleanup:YES];
    CCMenuItem *button1 = [CCMenuItemImage itemWithNormalImage:@"button_speed.png" selectedImage:@"button_speed.png" target:self selector:@selector(goSpeed)];
    
    Speed = [CCMenu menuWithItems:button1, nil];
    Speed.position= ccp(screenSize.width * 0.9, screenSize.height * 0.9);
    
    [self addChild:Speed z:10];
}

-(void)creatButtonMenu{
    if ([GameData sharedData].gamePaused == NO) {
        [self createOn];
    }else{
        [self createOff];
    }
    if ([GameData sharedData].speed == 1.0f) {
        [self createSpeedOn];
    }else{
        [self createSpeedOff];
    }
}

@end
