//
//  ZMHUserTool.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMHUser.h"
#import "ZMHUserResult.h"
@class ZMHUserResult,ZMHUser;

@interface ZMHUserTool : NSObject
/**
 *  请求用户的未读书
 *
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)unreadWithSuccess:(void(^)(ZMHUserResult *result))success failure:(void(^)(NSError *error))failure;

/**
 *  请求用户的信息
 *
 *  @param success 请求成功的回调
 *  @param failure 请求失败的回调
 */
+ (void)userInfoWithSuccess:(void(^)(ZMHUser *user))success failure:(void(^)(NSError *error))failure;

@end
