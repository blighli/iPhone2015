//
//  CCProps.m
//  PlayThePlane
//
//  Created by zhongweiwei on 15/12/11.
//  Copyright cspilgrimzww 2016年 . All rights reserved.
//

#import "CCProps.h"

@implementation CCProps

- (void) initWithType:(propsType)type {
    _type = type;
    NSString *propKey = [NSString stringWithFormat:@"enemy%d_fly_1.png",type];
    _prop = [CCSprite spriteWithSpriteFrameName:propKey];
    [_prop setPosition:ccp((arc4random()%268)+23, 732)];
}

- (void) propAnimation {
    id act1 = [CCMoveTo actionWithDuration:1 position:ccp(_prop.position.x, 400)];
    id act2 = [CCMoveTo actionWithDuration:0.2 position:ccp(_prop.position.x, 402)];
    id act3 = [CCMoveTo actionWithDuration:1 position:ccp(_prop.position.x, 732)];
    id act4 = [CCMoveTo actionWithDuration:2 position:ccp(_prop.position.x, -55)];
    
    [_prop runAction:[CCSequence actions:act1, act2, act3, act4, nil]];
}

@end
