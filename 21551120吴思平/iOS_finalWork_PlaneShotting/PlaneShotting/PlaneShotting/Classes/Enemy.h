//
//  Enemy.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "cocos2d.h"

@interface Enemy : CCSprite
{

}

- (id) initEnemyWithIndex:(int)index;
+ (CCAnimation*) deadAnimationOfEnemy;

@property(nonatomic,assign) int hp;
@property(nonatomic,assign) int damage;
@property(nonatomic,assign) int score;
@property(nonatomic,assign) BOOL isDead;

@end
