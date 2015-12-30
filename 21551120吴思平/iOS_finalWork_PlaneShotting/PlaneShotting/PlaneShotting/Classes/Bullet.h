//
//  Bullet.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "cocos2d.h"

@interface Bullet : CCSprite

- (id) initBulletWithIndex:(int)index;

@property(nonatomic,assign) int damage;

@end
