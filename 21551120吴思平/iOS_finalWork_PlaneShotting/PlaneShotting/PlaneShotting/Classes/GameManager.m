//
//  GameManager.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

@synthesize hero = hero;
@synthesize score = score;
@synthesize enemy_array = enemy_array;
@synthesize enemy_remove_array = enemy_remove_array;
@synthesize bullet_array = bullet_array;
@synthesize voice = voice;
@synthesize bgVoice = bgVoice;
@synthesize audio = audio;

static GameManager * sharedInstance = nil;

+ (GameManager *)sharedInstanceMethod
{
    sharedInstance = [[self alloc]init];
    return sharedInstance;
}

- (id)init
{
    enemy_array = [[NSMutableArray alloc]init];
    enemy_remove_array = [[NSMutableArray alloc]init];
    bullet_array = [[NSMutableArray alloc]init];
    hero = [[Plane alloc]init];
    audio = [OALSimpleAudio sharedInstance];
    voice = [audio effectsVolume];
    bgVoice = [audio bgVolume];
    
    return self;
}

//添加飞机
- (void) addPlane:(Plane*)plane
{
    hero = plane;
}

- (void) addEnemy:(Enemy*)enemy
{
    [enemy_array addObject:enemy];
}

- (void) addBullet:(Bullet*)bullet;
{
    [bullet_array addObject:bullet];
}

//移除
- (void) removeEnemy:(Enemy*)enemy
{
    [enemy removeFromParentAndCleanup:YES];
    [enemy_array removeObject:enemy];
}

- (void) removeBullet:(Bullet*)bullet
{
    [bullet removeFromParentAndCleanup:YES];
    [bullet_array removeObject:bullet];
}

//碰撞检测
- (Enemy*) collidePlaneWithEnemy
{
    //遍历所有还存活的敌人
    for (int i = 0; i<[enemy_array count]; i++)
    {
        Enemy* enemy = [enemy_array objectAtIndex:i];
        //飞机与敌人碰撞
        if ( enemy.isDead == NO && CGRectIntersectsRect([enemy boundingBox],[hero boundingBox]))
        {
            return enemy;
        }
    }
    return nil;
}

- (BOOL) collideEnemyWithBullet
{
    //遍历所有的敌人
    for (int i = 0; i<[enemy_array count]; i++)
    {
        Enemy* enemy = [enemy_array objectAtIndex:i];
        for (int j = 0; j< [bullet_array count]; j++)
        {
            //遍历所有的子弹
            Bullet *bullet = [bullet_array objectAtIndex:j];
            
            //子弹和敌人碰撞
            if (CGRectIntersectsRect([enemy boundingBox], [bullet boundingBox]))
            {
                enemy.hp = enemy.hp - bullet.damage;
                
                //子弹消失
                [bullet removeFromParentAndCleanup:YES];
                [bullet_array removeObject:bullet];
                
                if (enemy.hp <= 0 && [enemy_remove_array containsObject:enemy] == NO)
                {
                    [enemy_remove_array addObject:enemy];
                    enemy.isDead = YES;
                    //更新分数
                    score = score + enemy.score;
                    
                    //敌人消失并播放死亡动画
                    [[OALSimpleAudio sharedInstance] playEffect:@"break.mp3"];
                    CCAnimation *enemy_dead_animation = [Enemy deadAnimationOfEnemy];
                    CCActionAnimate *enemy_dead_actionAnimate = [CCActionAnimate actionWithAnimation:enemy_dead_animation];
                    //移除所有命中的子弹和敌人
                    id remove_enemy = [CCActionCallFunc actionWithTarget:self selector:@selector(removeActionWithEnemy)];
                    id enemy_dead_action = [CCActionSequence actions:enemy_dead_actionAnimate,remove_enemy,nil];
                    
                    [enemy runAction:enemy_dead_action];
                    
                    return YES;
                }
            }
        }
    }
    return NO;
}

- (void) removeActionWithEnemy
{
    for (int i =0; i < [enemy_remove_array count]; i++)
    {
        Enemy *enemy = [enemy_remove_array objectAtIndex:i];
        [enemy_remove_array removeObject:enemy];
        
        [enemy removeFromParentAndCleanup:YES];
        //判断enemy是否已经移出屏幕
        if ([enemy_array containsObject:enemy])
        {
            [enemy_array removeObject:enemy];
        }
    }
}

@end
