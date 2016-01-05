//
//  EnemySprite.m
//  Cocos2dGame01
//
//  Created by jiangjunchen on 13-3-28.
//
//

#import "EnemySprite.h"
#import "AStar.h"

@implementation EnemySprite
@synthesize m_speed = _speed;
@synthesize m_blood = _blood;
@synthesize m_curPoint = _curPoint;

typedef enum
{
    DirectionTypeUp = 1,
    DirectionTypeDown,
    DirectionTypeLeft,
    DirectionTypeRight
}DirectionType;

+(id)spriteWithSpriteFrame:(CCSpriteFrame *)spriteFrame
{
    EnemySprite *enemy = [super spriteWithSpriteFrame:spriteFrame];
    [enemy reset];
    return enemy;
}

-(void)reset
{
    _speed = 100;
    _blood = 0;
    self.visible = NO;
    _curPoint = CGPointZero;
    _direction = DirectionTypeRight;
    if (!_wayPoints) 
        _wayPoints = [[NSMutableArray alloc]init];
    if (_wayPoints.count>0)
        [_wayPoints removeAllObjects];
}

-(void)dealloc
{
    [super dealloc];
    [_wayPoints release];
    _wayPoints = nil;
}

/*
-(void)moveWithNewCGPoint:(CGPoint)newPos andFinishBlock:(void(^)(void))finish
{
    _finishBlock = Block_copy(finish);
    NSValue *value = [NSValue valueWithCGPoint:newPos];
    [_wayPoints addObject:value];
    
    if (_wayPoints.count == 1) {
        [self moveTo:newPos];
    }
}
 */

-(void)moveWithWayPoints:(ASWapPoints*)points andFinishBlock:(void(^)(void))finish
{
    _finishBlock = Block_copy(finish);
    if (!points)
        return;
    if (points.count == 0)
        return;
    //设置position为起始点
    if (points.count > 0) {
        ASPoint *p = [points pointAtIndex:0];
        self.position = [p Cgpoint];
    }
    
    //保存要移动的路径点
    if (points.count > 1) {
        for (int i=1; i<points.count; i++) {
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

-(void)movingForNewWayPoints:(ASWapPoints *)newPoints
{
    int i=0;
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
@end
