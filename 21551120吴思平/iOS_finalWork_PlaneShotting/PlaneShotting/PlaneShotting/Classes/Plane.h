//
//  Plane.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/2.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "cocos2d.h"

@interface Plane : CCSprite
{

}

- (id) initPlaneWithIndex:(int)index;

@property(nonatomic,assign) int hp;

@end
