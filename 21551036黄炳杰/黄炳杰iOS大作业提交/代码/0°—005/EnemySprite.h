//
//  EnemySprite.h
//  Cocos2dGame01
//
//  Created by jiangjunchen on 13-3-28.
//
//

#import "CCSprite.h"
@class ASWapPoints;

@interface EnemySprite : CCSprite
{
    //正面的朝向
    int _direction;
    NSMutableArray *_wayPoints;
    void(^_finishBlock)(void);
    float _moveDuration;
}

@property (nonatomic, assign) float m_speed;
@property (nonatomic, assign) int m_blood;
@property (nonatomic, assign) CGPoint m_curPoint;

+(id)spriteWithSpriteFrame:(CCSpriteFrame *)spriteFrame;
//-(void)moveWithNewCGPoint:(CGPoint)newPos andFinishBlock:(void(^)(void))finish;
-(void)moveWithWayPoints:(ASWapPoints*)points andFinishBlock:(void(^)(void))finish;
-(void)movingForNewWayPoints:(ASWapPoints*)newPoints;
@end
