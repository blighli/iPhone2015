//
//  Bullet.m
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "Bullet.h"

@implementation Bullet

@synthesize damage = damage;

- (id)initBulletWithIndex:(int)index
{
    self = [super init];
    
    NSString *bulletName = [NSString stringWithFormat:@"bullet%d.png",index];
    self = [Bullet spriteWithImageNamed:bulletName];
    [self setScale:0.5];
    
    if (index == 1)
    {
        damage = 10;
    }
    else
    {
        damage = 50;
    }
    
    return self;
}

@end
