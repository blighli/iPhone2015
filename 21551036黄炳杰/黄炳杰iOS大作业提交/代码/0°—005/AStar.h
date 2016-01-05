//
//  AStar.h
//  0°—003
//
//  Created by huangbingjie on 13-7-31.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class ASWapPoints;
@class ASPoint;

@interface AStar : NSObject
{
    @private
    ASWapPoints *_open;
    ASWapPoints *_close;
}


@property (readonly,assign) ASPoint *startPoint;
@property (readonly,assign) ASPoint *endPoint;
@property (readonly,assign) ASWapPoints *path;

-(ASWapPoints *)getWayPointsWithStartPoint:(CGPoint)sp endPoint:(CGPoint)ep UnimpedeBlock:(BOOL(^)(CGPoint po))isUnimpeded;

@end


@interface ASWapPoints : NSObject
{
@private  CCArray *_points;
    
}

@property(readonly,assign)NSInteger count;

+(id)wayPoints;
-(void)addPoint:(ASPoint *)point bySort:(BOOL)sort;
-(void)addPoint:(ASPoint *)point;
-(void) replacePointsFromIndex:(NSInteger)index withNewPoints:(ASWapPoints*)newPoints;

-(ASPoint *)pointIfExistAtCGPoint:(CGPoint) cgpoint;
-(ASPoint *)pointIfExist:(ASPoint *)point;
-(ASPoint *)lastPoint;
-(ASPoint *)pointAtIndex:(NSUInteger)index;
-(void)removeAllPoints;
-(void)removeLastPoint;
-(void)removePointAtIndex:(NSUInteger)index;
-(void)removePoint:(ASPoint *)point;
-(void)insertPoint:(ASPoint *)point atIndex:(NSUInteger)index;

@end

@interface ASPoint : NSObject

@property (nonatomic,assign)ASPoint *parentPoint;
@property (nonatomic,assign)CGPoint Cgpoint;
@property (nonatomic,assign)float hScore;
@property (nonatomic,assign)float gScore;

-(float)fScore;
+(id)pointWithCGPoint:(CGPoint)point;
-(id)initWithCGPoint:(CGPoint)point;
-(BOOL)isEqual:(ASPoint*)object;

@end












