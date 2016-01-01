//
//  AStar.m
//  0°—003
//
//  Created by huangbingjie on 13-7-31.
//
//

#import "AStar.h"
//ARC
#if __has_feature(objc_arc)
//如果项目为ARC
#define AutoRelease(obj)
#define Release(obj)
#define Retain(obj)
#define Dealloc()
#else
//不是ARC
#define AutoRelease(obj) [(obj) autorelease]
#define Release(obj) [(obj) release]
#define Retain(obj) [(obj) retain]
#define Dealloc() [super dealloc]
#endif

@implementation AStar

@synthesize startPoint = _startPoint;
@synthesize endPoint = _endPoint;
@synthesize path = _path;

-(void)reset{
    if (_open) {
        Release(_open);
    }
    _open = [[ASWapPoints alloc]init];
    if (_close) {
        
        Release(_close);
    }
    _close = [[ASWapPoints alloc] init];
    if (_path) {
        Release(_path);
    }
    _path = [[ASWapPoints alloc]init];
    if (_startPoint) {
        Release(_startPoint);
    }
    _startPoint = nil;
    if (_endPoint) {
        Release(_endPoint);
    }
    _endPoint = nil;
}

-(void)dealloc{
    if (_open) {
        Release(_open);
    }
    _open = nil;
    if (_close) {
        Release(_close);
    }
    _close = nil;
    if (_path) {
        Release(_path);
        _path = nil;
    }

    if (_startPoint) {
        Release(_startPoint);
        _startPoint = nil;
    }

    if (_endPoint) {
        Release(_endPoint);
        _endPoint = nil;
    }
    Dealloc();

}


-(ASWapPoints*)getWayPointsWithStartPoint:(CGPoint)sp endPoint:(CGPoint)ep UnimpedeBlock:(BOOL (^)(CGPoint))isUnimpeded
{
    [self reset];
    _startPoint = Retain([ASPoint pointWithCGPoint:sp]);//保持引用
    _endPoint = Retain([ASPoint pointWithCGPoint:ep]);
    [_open addPoint:_startPoint];
    
    while (_open.count > 0) {
        ASPoint *curPoint = [_open pointAtIndex:0];
        [_close addPoint:curPoint];
        [_open removePointAtIndex:0];
        //找到路径 返回
        if ([curPoint isEqual:_endPoint]) {
            [_path addPoint:curPoint];
            
            while ((curPoint = curPoint.parentPoint)) {
                [_path insertPoint:curPoint atIndex:0];
            }
            break;
        }
        
        //当前位置附近可移动的点
        ASWapPoints *nearbyPoints = [self nearbyWalkablePointsForPosition:curPoint UnimpededdBlock:isUnimpeded];
        for (int i = 0; i < nearbyPoints.count; i++) {
            ASPoint *nearPoint = [nearbyPoints pointAtIndex:i];
            //close表中已存在则忽略
            if ([_close pointIfExist:nearPoint]) {
                continue;
            }
            //open表中已存在则更新open表中的该点
            ASPoint *p = [_open pointIfExist:nearPoint];
            if (p) {
                if (p.gScore > nearPoint.gScore) {
                    p.gScore = nearPoint.gScore;
                    p.parentPoint = nearPoint.parentPoint;
                    Retain(p);
                    [_open removePoint:p];
                    [_open addPoint:p bySort:YES];
                    Release(p);
                }
            }
            //不存在open中则添加
            else{
                [_open addPoint:nearPoint bySort:YES];
            }
        }
    }
    return _path;
}


-(ASWapPoints *)nearbyWalkablePointsForPosition:(ASPoint*)position UnimpededdBlock:(BOOL(^)(CGPoint po))isUnimpeded{
    CGPoint p = position.Cgpoint;
    CGPoint tmpP;
    ASWapPoints *nearbyPoints = [ASWapPoints wayPoints];
    //left
    tmpP = CGPointMake(p.x - 1, p.y);
    if (isUnimpeded(tmpP)) {
        ASPoint *point = [ASPoint pointWithCGPoint:tmpP];
        if (![_close pointIfExistAtCGPoint:tmpP]) {
            point.hScore = [self getHValueForCGPoint:tmpP];
            point.gScore = position.gScore + 1;
            point.parentPoint = position;
            [nearbyPoints addPoint:point];
        }
    }
    
    //right
    tmpP = CGPointMake(p.x+1, p.y);
    if (isUnimpeded(tmpP)) {
        ASPoint *point = [ASPoint pointWithCGPoint:tmpP];
        if (![_close pointIfExistAtCGPoint:tmpP]) {
            point.hScore = [self getHValueForCGPoint:tmpP];
            point.gScore = position.gScore+1;
            point.parentPoint = position;
            [nearbyPoints addPoint:point];
        }
    }
    //upper
    tmpP = CGPointMake(p.x, p.y-1);
    if (isUnimpeded(tmpP)) {
        ASPoint *point = [ASPoint pointWithCGPoint:tmpP];
        if (![_close pointIfExistAtCGPoint:tmpP]) {
            point.hScore = [self getHValueForCGPoint:tmpP];
            point.gScore = position.gScore+1;
            point.parentPoint = position;
            [nearbyPoints addPoint:point];
        }
    }
    //under
    tmpP = CGPointMake(p.x, p.y+1);
    if (isUnimpeded(tmpP)) {
        ASPoint *point = [ASPoint pointWithCGPoint:tmpP];
        if (![_close pointIfExistAtCGPoint:tmpP]) {
            point.hScore = [self getHValueForCGPoint:tmpP];
            point.gScore = position.gScore+1;
            point.parentPoint = position;
            [nearbyPoints addPoint:point];
        }
    }
    return nearbyPoints;

}

-(NSUInteger)getHValueForCGPoint:(CGPoint)p
{
    NSUInteger h = abs(_endPoint.Cgpoint.x-p.x)+abs(_endPoint.Cgpoint.y-p.y);
    return h;
}

@end

@implementation ASWapPoints

@synthesize  count;

+(id)wayPoints{
    ASWapPoints *wayPoints = [[ASWapPoints alloc]init];
    return wayPoints;
}

-(id) init{
    if ((self = [super init])) {
        _points = [[CCArray alloc]init];
    }
    return self;

}

-(void)dealloc
{
    Release(_points);
    _points = nil;
    Dealloc();
}

-(NSInteger) count{
    if (_points) {
        return _points.count;
    }
    return 0;
}

//什么用？？？
-(ASPoint *)pointAtIndex:(NSUInteger)index
{
    return (ASPoint *) [_points objectAtIndex:index];
}

-(void)insertPoint:(ASPoint *)point atIndex:(NSUInteger)index
{
    [_points insertObject:point atIndex:index];
}


-(void)addPoint:(ASPoint *)point bySort:(BOOL)sort
{
    if (sort) {
        int i;
        float f,cf;
        for (i = 0; i < _points.count; i++) {
            ASPoint *curP = [_points objectAtIndex:i];
            f = [point fScore];
            cf = [curP fScore];
            if (f < cf) {
                [_points insertObject:point atIndex:i];
                break;
            }
            else if (f == cf)
            {
                if (point.gScore <curP.gScore) {
                    [_points insertObject:point atIndex:i];
                    break;
                }
            }
        }
        if (i == _points.count) {
            [_points addObject:point];
        }
    }
    else{
        [_points addObject:point];
    }
}

-(void)addPoint:(ASPoint *)point{
    [_points addObject:point];
}

-(void) replacePointsFromIndex:(NSInteger)index withNewPoints:(ASWapPoints *)newPoints{
    int c = _points.count;
    for (int i = index; i < c; i++) {
        [_points removeObjectAtIndex:index];
    }
    for (int i = 0; i < newPoints.count; i++) {
        [_points addObject:[newPoints pointAtIndex:i]];
    }
}

-(void)removeAllPoints
{
    [_points removeAllObjects];
}

-(void) removeLastPoint{
    [_points removeLastObject];
}

-(void) removePointAtIndex:(NSUInteger)index{
    [_points removeObjectAtIndex:index];
}

-(ASPoint *)pointIfExistAtCGPoint:(CGPoint)cgpoint{
    for (ASPoint *p in _points) {
        if (CGPointEqualToPoint([p Cgpoint], cgpoint)) {
            return p;
        }
    }
    return nil;
}



-(ASPoint *)lastPoint{
    return (ASPoint *)[_points lastObject];
}


-(void) removePoint:(ASPoint *)point
{
    for (ASPoint *curPoint in _points) {
        if ([curPoint isEqual:point]) {
            [_points removeObject:curPoint];
        }
    }
}

-(ASPoint *)pointIfExist:(ASPoint *)point
{
    for (ASPoint *p in _points) {
        if ([p isEqual:point]) {
            return p;
        }
    }
    return nil;
}

-(NSInteger)indexOfPoint:(ASPoint *)point
{
    for (ASPoint *p in _points) {
        if ([p isEqual:point]) {
            return [_points indexOfObject:p];
        }
    }
    return  -1;
}

@end


@implementation ASPoint

@synthesize Cgpoint = _Cgpoint;
@synthesize gScore = _gScore;
@synthesize hScore = _hScore;
@synthesize parentPoint = _parentPoint;

-(float)fScore{
    return _hScore + _gScore;
}

+(id) pointWithCGPoint:(CGPoint)point
{
    return [[[ASPoint alloc]initWithCGPoint:point]autorelease];
}

-(id) initWithCGPoint:(CGPoint)point
{
    if ((self = [super init])) {
        _Cgpoint = point;
        _hScore = 0;
        _gScore = 0;
        _parentPoint = nil;
    }
    return self;
}

-(NSString *)description{
    NSString *strParent = @"null";
    if (_parentPoint) {
        strParent = NSStringFromCGPoint(_parentPoint.Cgpoint);
    }
    return [NSString stringWithFormat:@"ASPoint:%@, G:%.0f, H:%.0f, F:%.0f, _parentPoint:%@",NSStringFromCGPoint(_Cgpoint),_gScore,_hScore,[self fScore],strParent];
}

-(BOOL)isEqual:(ASPoint *)object
{
    return CGPointEqualToPoint(_Cgpoint, [object Cgpoint]);
}

@end


