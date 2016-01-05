//
//  ZMHUserTool.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHUserTool.h"
#import "ZMHAccountTool.h"
#import "ZMHUserParam.h"
#import "ZMHUserResult.h"

#import "ZMHWeiboTool.h"
#import "ZMHAccountTool.h"
#import "ZMHAccount.h"
#import "MJExtension.h"
#import "ZMHUser.h"



@implementation ZMHUserTool :NSObject


+ (void)unreadWithSuccess:(void (^)(ZMHUserResult *))success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    ZMHUserParam *param = [ZMHUserParam param];
    param.uid = [ZMHAccountTool account].uid;
    
    [ZMHWeiboTool GET:@"https://rm.api.weibo.com/2/remind/unread_count.json" parameters:param.keyValues success:^(NSURLSessionDataTask *task,id responseObject) {
        
        // 字典转换模型
        ZMHUserResult *result = [ZMHUserResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSURLSessionDataTask * task ,NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
        
    }];
}

+ (void)userInfoWithSuccess:(void (^)(ZMHUser *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    ZMHUserParam *param = [ZMHUserParam param];
    param.uid = [ZMHAccountTool account].uid;
    
    [ZMHWeiboTool GET:@"https://api.weibo.com/2/users/show.json" parameters:param.keyValues success:^(NSURLSessionDataTask *task ,id responseObject) {
        
        // 用户字典转换用户模型
        ZMHUser *user = [ZMHUser objectWithKeyValues:responseObject];
        
        if (success) {
            success(user);
        }
        
    } failure:^(NSURLSessionDataTask *task ,NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
}




@end
