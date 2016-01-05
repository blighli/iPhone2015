//
//  Plane.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "Plane.h"
#import "cocos2d.h"

@implementation Plane

@synthesize hp = hp;

- (id) initPlaneWithIndex:(int)index
{
    self = [super init];
    
    CGSize win_size = [CCDirector sharedDirector].viewSize;
    
    CCAnimation *plane_animation = [[CCAnimation alloc]init];
    NSString *frameName1 = [NSString stringWithFormat:@"plane%d_1.png",index];
    NSString *frameName2 = [NSString stringWithFormat:@"plane%d_2.png",index];
    [plane_animation addSpriteFrameWithFilename:frameName1];
    [plane_animation addSpriteFrameWithFilename:frameName2];
    [plane_animation setDelayPerUnit:0.1];
    [plane_animation setLoops:-1];
    CCActionAnimate *plane_actionAnimate = [CCActionAnimate actionWithAnimation:plane_animation];
    
    self = [Plane spriteWithImageNamed:frameName1];
    
    //初始化飞机血量
    hp = 100;
    
    [self setScale:0.5];
    [self setPosition:CGPointMake(win_size.width/2, 70)];
    [self runAction:[CCActionRepeatForever actionWithAction:plane_actionAnimate]];
    
    return self;
}

@end
