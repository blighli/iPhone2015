//
//  CCProps.h
//  PlayThePlane
//
//  Created by zhongweiwei on 15/12/11.
//  Copyright cspilgrimzww 2016年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    propsTypeBomb = 4,
    propsTypeBullet = 5
}propsType;

@interface CCProps : CCNode

@property (assign) CCSprite *prop;
@property (assign) propsType type;
- (void) initWithType:(propsType)type;
- (void) propAnimation;
@end
