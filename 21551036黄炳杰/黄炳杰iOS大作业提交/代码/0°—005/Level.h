//
//  Level.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Level : NSObject {
    //关卡名称
    NSString *_name;
    //关卡编号
    int _number;
    //是否已经解锁
    BOOL _unlocked;
    //关卡星级评价
    int _stars;
    //其他数据
    NSString *_data;
    //关卡是否已经通过
    BOOL _levelClear;
    
}

@property (nonatomic, copy) NSString*name;
@property (nonatomic, assign) int number;
@property (nonatomic, assign) BOOL unlocked;
@property (nonatomic, assign) int stars;
@property (nonatomic, copy) NSString *data;
@property (nonatomic, assign) BOOL levelClear;



-(id) initWithName:(NSString *)name number:(int)number unlocked:(BOOL)unlocked stars:(int)stars data:(NSString *)data levelClear:(BOOL)levelClear;


@end
