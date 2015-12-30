//
//  Enemy.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "Enemy.h"
#import "cocos2d.h"

@implementation Enemy

@synthesize hp = hp;
@synthesize damage = damage;
@synthesize score = score;
@synthesize isDead = isDead;

- (id) initEnemyWithIndex:(int)index
{
    self = [super init];
    
    NSString *enemyName = [NSString stringWithFormat:@"enemy%d.png",index];
    self = [Enemy spriteWithImageNamed:enemyName];
    [self setScale:0.5];
    isDead = NO;
    
    if (index == 1)
    {
        hp = 20;
        damage = 20;
        score = 20;
    }
    else
    {
        hp = 40;
        damage = 40;
        score = 40;
    }
    
    return self;
}


+ (CCAnimation*) deadAnimationOfEnemy
{
    //敌人播放死亡动画
    CCAnimation *enemy_dead_animation = [[CCAnimation alloc]init];
    NSString *frame1 = [NSString stringWithFormat:@"b1.png"];
    NSString *frame2 = [NSString stringWithFormat:@"b2.png"];
    NSString *frame3 = [NSString stringWithFormat:@"b3.png"];
    [enemy_dead_animation addSpriteFrameWithFilename:frame1];
    [enemy_dead_animation addSpriteFrameWithFilename:frame2];
    [enemy_dead_animation addSpriteFrameWithFilename:frame3];
    [enemy_dead_animation setDelayPerUnit:0.1];
    [enemy_dead_animation setLoops:1];
    
    return enemy_dead_animation;
}
@end
