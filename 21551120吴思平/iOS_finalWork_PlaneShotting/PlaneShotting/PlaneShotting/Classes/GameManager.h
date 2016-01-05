//
//  GameManager.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "CCScene.h"
#import "Plane.h"
#import "Enemy.h"
#import "Bullet.h"

@interface GameManager : NSObject
{
    
}
//单例
+ (GameManager *)sharedInstanceMethod;
- (instancetype)init;

//添加
- (void) addPlane:(Plane*)plane;
- (void) addEnemy:(Enemy*)enemy;
- (void) addBullet:(Bullet*)bullet;

//移除
- (void) removeEnemy:(Enemy*)enemy;
- (void) removeBullet:(Bullet*)bullet;
- (void) removeActionWithEnemy;

//碰撞检测
//返回被击毁的敌机对象
- (Enemy*) collidePlaneWithEnemy;
//返回敌机是否被击毁
- (BOOL) collideEnemyWithBullet;

@property(retain,nonatomic) Plane* hero;
@property(nonatomic,assign) int score;
@property(nonatomic,strong) NSMutableArray *enemy_array;
//将要播放死亡动画的敌机序列
@property(nonatomic,strong) NSMutableArray *enemy_remove_array;
@property(nonatomic,strong) NSMutableArray *bullet_array;
@property(nonatomic,strong) OALSimpleAudio *audio;
@property(nonatomic,assign) float voice;
@property(nonatomic,assign) float bgVoice;

@end
