//
//  ZMHUserParam.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMHUserParam : NSObject
@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *uid;

+ (instancetype)param;

@end
