//
//  Creep.m
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "Creep.h"
#import "AStar.h"
//#define HEALTH_BAR_WIDTH 20 //血条长度
//#define HEALTH_BAR_ORIGIN -10 //血条开始的位置
@implementation Creep
@synthesize mySprite;

@synthesize creepHealthBar;
@synthesize creepHealthBarBg;
@synthesize rag;
@synthesize hp = _curHp;//当前血量
@synthesize moveDuration = _moveDuration;//移动速度
@synthesize totalHp = _totalHp;

@synthesize curWaypoint = _curWaypoint;//当前路点
@synthesize lastWaypoint = _lastWaypoint;//下一个路点
@synthesize curPWaypoint = _curPWaypoint;//当前路点
@synthesize lastPWaypoint = _lastPWaypoint;//下一个路点

float setRedHp = 9; //红色敌人的血量
float setRedSpeed = 6;//红色敌人的速度

float setPlaneHp=7;
float setPlaneSpeed=18;

float setMotoHp=15;
float setMotoSpeed=6;

float setTanKe1Hp=25;
float setTanKe1Speed=6;

float setTanKe2Hp=50;
float setTanKe2Speed=2;

float setKaCheHp=30;
float setKaCheSpeed=4;


//***
@synthesize  m_speed = _speed;
@synthesize  m_blood = _blood;
@synthesize  m_curPoint = _curPoint;

typedef enum
{
    DirectionTypeUp = 1,
    DirectionTypeDown,
    DirectionTypeLeft,
    DirectionTypeRight
}DirectionType;


-(void)dealloc{
    [super dealloc];
    [_wayPoints release];
    _wayPoints = nil;
}

-(void)moveWithWayPoints:(ASWapPoints *)points andFinishBlock:(void (^)(void))finish
{

    _finishBlock = Block_copy(finish);
    if (!points) {
        return;
    }
    if (points.count == 0) {
        return;
    }
   

    //设置position为起点
    if (points.count > 0) {
        ASPoint *p = [points pointAtIndex:0];
        self.position = [p Cgpoint];
    }
    CCLOG(@"sdasdasdasdasdasdasda-------");
    //保存要移动的路径点
    if (points.count > 1) {
        for (int i = 1; i< points.count; i++) {
            ASPoint *p = [points pointAtIndex:i];
            NSValue *value = [NSValue valueWithCGPoint:[p Cgpoint]];
            [_wayPoints addObject:value];
        }
    }
        //第一个路径点
    NSValue *value = [_wayPoints objectAtIndex:0];
    if (value) {
        CGPoint firstP = [value CGPointValue];
        [self moveTo:firstP];
    }
    
}

-(void)moveTo:(CGPoint)newPos
{
    _curPoint = newPos;
    
    CGPoint tmpPos;
    float xoffset = fabsf(newPos.x - self.position.x);
    float yoffset = fabsf(newPos.y - self.position.y);
    CCMoveTo *firstMove = nil;
    CCMoveTo *secondMove = nil;
    CCSequence *sequence = nil;
    CCCallFuncND *funcFirst = nil;
    
    CCCallFunc *funcSecond = [CCCallFunc actionWithTarget:self selector:@selector(onCallSeconedMove)];
    if (xoffset) {
        ccTime duration = xoffset/_speed;
        tmpPos = ccp(newPos.x,self.position.y);
        firstMove = [CCMoveTo actionWithDuration:duration position:tmpPos];
    }
    if (yoffset) {
        ccTime duration = yoffset/_speed;
        secondMove = [CCMoveTo actionWithDuration:duration position:newPos];
        static CGPoint pos;
        pos = newPos;
        funcFirst = [CCCallFuncND actionWithTarget:self selector:@selector(onCallFirstMove:data:) data:&pos];
    }
    
    if (firstMove && secondMove) {
        [self rotateFromPos:self.position toNewPos:tmpPos];
        sequence = [CCSequence actions:firstMove,funcFirst,secondMove,funcSecond, nil];
    }
    else if(firstMove) {
        [self rotateFromPos:self.position toNewPos:tmpPos];
        sequence = [CCSequence actions:firstMove,funcSecond, nil];
    }
    else if(secondMove) {
        [self rotateFromPos:self.position toNewPos:newPos];
        sequence = [CCSequence actions:secondMove,funcSecond, nil];
    }
    
    if (sequence)
        [self runAction:sequence];
}

-(void)movingForNewWayPoints:(ASWapPoints *)newPoints
{
    int i =0;
    int count = newPoints.count;
    for (; i<count; i++) {
        if (CGPointEqualToPoint(_curPoint, [newPoints pointAtIndex:i].Cgpoint)) {
            break;
        }
    }
    if (i >= count)
        return;
    
    [_wayPoints removeAllObjects];
    for (; i<count; i++) {
        ASPoint *p = [newPoints pointAtIndex:i];
        NSValue *value = [NSValue valueWithCGPoint:[p Cgpoint]];
        [_wayPoints addObject:value];
    }

}

//到达了本次指定路径的移动的中转点
-(void)onCallFirstMove:(id)sender data:(void*)data
{
    //改变正面朝向
    CGPoint *pos = (CGPoint*)data;
    [self rotateFromPos:self.position toNewPos:*pos];
}

//完成了一次指定路径的移动
-(void)onCallSeconedMove
{
    if (_wayPoints.count)
        [_wayPoints removeObjectAtIndex:0];
    
    [self stopAllActions];
    if (_wayPoints.count>0) {
        NSValue *pointVal = (NSValue*)[_wayPoints objectAtIndex:0];
        //开始移动到下个指定路径
        CGPoint newPos = pointVal.CGPointValue;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self moveTo:newPos];
        });
    }
    else {
        if (_finishBlock) {
            _finishBlock();
        }
    }
}

-(void)rotateFromPos:(CGPoint)pos toNewPos:(CGPoint)newPos
{
    CGPoint vectorPoint = ccpSub(newPos, pos);
    float angle = ccpToAngle(vectorPoint);
    float angleDegrees = 90-CC_RADIANS_TO_DEGREES(angle);
    self.rotation = angleDegrees;
}

//****






- (id) copyWithZone:(NSZone *)zone {
	Creep *copy = [[[self class] allocWithZone:zone] initWithCreep:self];
	return copy;
}
//敌人初始化
- (Creep *) initWithCreep:(Creep *) copyFrom {
    if ((self = [[[super alloc] initWithFile:@"enemy.png"] autorelease])) {
        self.hp = copyFrom.hp;
        self.moveDuration = copyFrom.moveDuration;
        self.curWaypoint = copyFrom.curWaypoint;
        
        
	}

    [self retain];
	return self;
}
//获得当前路点
- (WayPoint *)getCurrentWaypoint{
	
	DataModel *m = [DataModel getModel];
	
	WayPoint *waypoint = (WayPoint *) [m._waypoints objectAtIndex:self.curWaypoint];
	
	return waypoint;
}

//获得下一个路点
- (WayPoint *)getNextWaypoint{
	
	DataModel *m = [DataModel getModel];
    
	self.curWaypoint++;
	
	if (self.curWaypoint >= m._waypoints.count){
        self.curWaypoint--;
        gameHUD = [GameHUD sharedHUD];
        if (gameHUD.baseHp > 0) {
            [gameHUD updateBaseHp:-1];
        }
        
        Creep *target = (Creep *) self;
        
        NSMutableArray *endtargetsToDelete = [[NSMutableArray alloc] init];
        [endtargetsToDelete addObject:target];
        for (CCSprite *target in endtargetsToDelete) {
            [m._targets removeObject:target];
            [self.parent removeChild:target cleanup:YES];
        }
        return NULL;
    }
	
	WayPoint *waypoint = (WayPoint *) [m._waypoints objectAtIndex:self.curWaypoint];
	
	return waypoint;
}

//获得最后的路点
- (WayPoint *)getLastWaypoint{
	
	DataModel *m = [DataModel getModel];
    
	self.lastWaypoint = self.curWaypoint -1;
	
	WayPoint *waypoint = (WayPoint *) [m._waypoints objectAtIndex:self.lastWaypoint];
	
	return waypoint;
}

//————————————————————————————————————————————————————————————————————————————————————获得空中部队的路点

//获得当前路点
- (WayPoint *)getCurrentPWaypoint{
	
	DataModel *m = [DataModel getModel];
	
	WayPoint *pwaypoint = (WayPoint *) [m._pwaypoints objectAtIndex:self.curPWaypoint];
	
	return pwaypoint;
}

//获得下一个路点
- (WayPoint *)getNextPWaypoint{
	
	DataModel *m = [DataModel getModel];
    
	self.curPWaypoint++;
	
	if (self.curPWaypoint >= m._pwaypoints.count){
        self.curPWaypoint--;
        gameHUD = [GameHUD sharedHUD];
        if (gameHUD.baseHp > 0) {
            [gameHUD updateBaseHp:-1];
        }
        
        Creep *target = (Creep *) self;
        
        NSMutableArray *endtargetsToDelete = [[NSMutableArray alloc] init];
        [endtargetsToDelete addObject:target];
        for (CCSprite *target in endtargetsToDelete) {
            [m._targets removeObject:target];
            [self.parent removeChild:target cleanup:YES];
        }
        return NULL;
    }
	
	WayPoint *pwaypoint = (WayPoint *) [m._pwaypoints objectAtIndex:self.curPWaypoint];
	
	return pwaypoint;
}

//获得最后的路点
- (WayPoint *)getLastPWaypoint{
	
	DataModel *m = [DataModel getModel];
    
	self.lastPWaypoint = self.curPWaypoint -1;
	
	WayPoint *pwaypoint = (WayPoint *) [m._pwaypoints objectAtIndex:self.lastPWaypoint];
	
	return pwaypoint;
}

//控制敌人旋转函数
-(void)creepLogic:(ccTime)dt {
	/*
	// 旋转敌人获得下一个路点
	WayPoint *waypoint = [self getCurrentWaypoint ];
	
	CGPoint waypointVector = ccpSub(waypoint.position, self.position);
	CGFloat waypointAngle = ccpToAngle(waypointVector);
	CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * waypointAngle);
	
	float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
	float rotateDuration = fabs(waypointAngle * rotateSpeed);    
	
	[self runAction:[CCSequence actions:
					 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
					 nil]];
     */
    WayPoint *cwaypoint = [self getCurrentWaypoint ];
switch (self.rag) {
    case 1://小兵
        if ((self.position.x-cwaypoint.position.x >= 1)) {
            [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"xiaobin_default.plist"];
            CCSpriteBatchNode *batchNode=[CCSpriteBatchNode batchNodeWithFile:@"xiaobin_default.png"];
            [self addChild:batchNode ];
            NSMutableArray *animFrames=[NSMutableArray array];
            for (int i =1 ; i < 3; i++ ) {
                [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:[NSString stringWithFormat:@"xiaoren%dy.png",i]]];
            }
            CCAnimation *walkAnim=[CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
            id walkAction=[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim]];
            [self runAction:walkAction];
        }
        else if((self.position.x-cwaypoint.position.x < 1)){
            [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"xiaobin_default.plist"];
            CCSpriteBatchNode *batchNode=[CCSpriteBatchNode batchNodeWithFile:@"xiaobin_default.png"];
            [self addChild:batchNode ];
            NSMutableArray *animFrames=[NSMutableArray array];
            for (int i =1 ; i < 3; i++ ) {
                [animFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:[NSString stringWithFormat:@"xiaoren%d.png",i]]];
            }
            CCAnimation *walkAnim=[CCAnimation animationWithSpriteFrames:animFrames delay:0.1f];
            id walkAction=[CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkAnim]];
            [self runAction:walkAction];
        }
        break;
    case 2://飞艇
        break;
    case 3://飞机
        break;
    case 4://摩托
        if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y>cwaypoint.position.y)) {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"moto_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"motuoxia.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y<cwaypoint.position.y)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"moto_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"motuoshang.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x>cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"moto_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"motuozuo.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x<cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"moto_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"motuoyou.png"];
            [self setDisplayFrame:frame];
        }
        break;
    case 5://坦克1
        if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y>cwaypoint.position.y)) {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke1_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke1xia.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y<cwaypoint.position.y)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke1_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke1shang.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x>cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke1_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke1zuo.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x<cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke1_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke1you.png"];
            [self setDisplayFrame:frame];
        }
        break;
    case 6://坦克2
        if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y>cwaypoint.position.y)) {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke2_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke2xia.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y<cwaypoint.position.y)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke2_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke2shang.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x>cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke2_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke2zuo.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x<cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"tanke2_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"tanke2you.png"];
            [self setDisplayFrame:frame];
        }
        break;
    case 7://卡车
        if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y>cwaypoint.position.y)) {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kache_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"kachexia.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.x-cwaypoint.position.x==0)&&(self.position.y<cwaypoint.position.y)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kache_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"kacheshang.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x>cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kache_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"kachezuo.png"];
            [self setDisplayFrame:frame];
        }
        else if ((self.position.y-cwaypoint.position.y==0)&&(self.position.x<cwaypoint.position.x)){
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"kache_default.plist"];
            CCSpriteFrame* frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"kacheyou.png"];
            [self setDisplayFrame:frame];
        }
        break;
    default:
        break;
}
	
}
-(float) moveDurScale {
    DataModel *m = [DataModel getModel];
    
    WayPoint *waypoint0 = (WayPoint *) [m._waypoints objectAtIndex:0];
    WayPoint *waypoint1 = (WayPoint *) [m._waypoints objectAtIndex:1];
    
    firstDistance = ccpDistance(waypoint0.position, waypoint1.position);
    WayPoint *waypoint2 = (WayPoint *) [m._waypoints objectAtIndex:(self.curWaypoint-1)];
    WayPoint *waypoint3 = (WayPoint *) [m._waypoints objectAtIndex:(self.curWaypoint)];
    
    float thisDistance = ccpDistance(waypoint2.position, waypoint3.position);
    float moveScale = thisDistance/firstDistance; return (self.moveDuration * moveScale);
}
-(void)planeLogic:(ccTime)dt {
	
	
	// -——————————————————————————————————————————————————————————————————————————————————旋转敌人获得下一个路点
	WayPoint *pwaypoint = [self getCurrentPWaypoint];
	
	CGPoint pwaypointVector = ccpSub(pwaypoint.position, self.position);
	CGFloat pwaypointAngle = ccpToAngle(pwaypointVector);
	CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * pwaypointAngle);
	
	float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
	float rotateDuration = fabs(pwaypointAngle * rotateSpeed);
	
	[self runAction:[CCSequence actions:
					 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
					 nil]];
	
}

-(void)healthBarLogic:(ccTime)dt {
    //更新血条的位置和血量
    
    creepHealthBar.position = ccp(self.position.x, (self.position.y+20));
    creepHealthBarBg.position = ccp(self.position.x, (self.position.y+20));
    creepHealthBar.percentage = ((float)self.hp/(float)self.totalHp) *100;
    //creepHealthBarBg.percentage = 100;
    if (creepHealthBar.percentage <= 0) {
        
        [self removeChild:creepHealthBar cleanup:YES];
        
    }
    
}
@end

@implementation XiaoBin1

+ (id)creep {
    
    XiaoBin1 *creep = nil;

    
    if ((creep = [[[super alloc] initWithFile:@"xiaoren1.png"] autorelease])) {
        creep.hp = setRedHp;
        creep.moveDuration = setRedSpeed;
		creep.curWaypoint = 0;
        creep.rag = 1;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	[creep schedule:@selector(creepLogic:) interval:0.2];
	
    return creep;
}

@end

@implementation Plane

+ (id)creep {
    
    Plane *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"feiting.png"] autorelease])) {
        creep.hp = setPlaneHp;
        creep.moveDuration = setPlaneSpeed;
		creep.curPWaypoint = 0;
        creep.rag = 2;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	//[creep schedule:@selector(creepLogic:) interval:0.2];
    
	return creep;
}

@end

@implementation Plane2

+ (id)creep {
    
    Plane2 *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"plane1.png"] autorelease])) {
        creep.hp = setPlaneHp;
        creep.moveDuration = setPlaneSpeed;
		creep.curPWaypoint = 0;
        creep.rag = 3;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	//[creep schedule:@selector(creepLogic:) interval:0.2];
    
	return creep;
}

@end

@implementation Moto

+ (id)creep {
    
    Moto *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"motuoyou.png"] autorelease])) {
        creep.hp = setRedHp;
        creep.moveDuration = setRedSpeed;
		creep.curWaypoint = 0;
        creep.rag = 4;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	[creep schedule:@selector(creepLogic:) interval:0.2];
	
    return creep;
}

@end

@implementation TanKe1

+ (id)creep {
    
    TanKe1 *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"tanke1you.png"] autorelease])) {
        creep.hp = setRedHp;
        creep.moveDuration = setRedSpeed;
		creep.curWaypoint = 0;
        creep.rag = 5;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	[creep schedule:@selector(creepLogic:) interval:0.2];
	
    return creep;
}

@end

@implementation TanKe2

+ (id)creep {
    
    TanKe2 *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"tanke2you.png"] autorelease])) {
        creep.hp = setRedHp;
        creep.moveDuration = setRedSpeed;
		creep.curWaypoint = 0;
        creep.rag = 6;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	[creep schedule:@selector(creepLogic:) interval:0.2];
	
    return creep;
}

@end

@implementation KaChe

+ (id)creep {
    
    KaChe *creep = nil;
    
    
    if ((creep = [[[super alloc] initWithFile:@"kacheyou.png"] autorelease])) {
        creep.hp = setRedHp;
        creep.moveDuration = setRedSpeed;
		creep.curWaypoint = 0;
        creep.rag = 7;
    }
    creep.hp = creep.totalHp = setRedHp;
    [creep schedule:@selector(healthBarLogic:)];
	[creep schedule:@selector(creepLogic:) interval:0.2];
	
    return creep;
}



@end