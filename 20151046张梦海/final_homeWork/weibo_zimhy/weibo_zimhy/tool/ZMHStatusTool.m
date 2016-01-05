//
//  ZMHStatusTool.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHStatusTool.h"


#import "ZMHWeiboTool.h"
#import "ZMHStatus.h"
#import "ZMHAccountTool.h"
#import "ZMHAccount.h"
#import "ZMHStatusResult.h"
#import "ZMHStatusParam.h"
//#import "ZMHStatusResult.h"

@implementation ZMHStatusTool


+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    ZMHStatusParam *param = [[ZMHStatusParam alloc] init];
    param.access_token = [ZMHAccountTool account].access_token;
    if (sinceId) { // 有微博数据，才需要下拉刷新
        param.since_id = sinceId;
        
    }
    
    [ZMHWeiboTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(NSURLSessionDataTask * task,id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        
        ZMHStatusResult *result = [ZMHStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSURLSessionDataTask * task ,NSError *error) {
        if (failure) {
            NSLog(@"%@",error) ;
            failure(error);
        }
    }];
    
}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    ZMHStatusParam *param = [[ZMHStatusParam alloc] init];
    param.access_token = [ZMHAccountTool account].access_token;
    if (maxId) { // 有微博数据，才需要下拉刷新
        param.max_id = maxId;
        
    }
    
    [ZMHWeiboTool GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:param.keyValues success:^(NSURLSessionDataTask * task ,id responseObject) { // HttpTool请求成功的回调
        // 请求成功代码先保存
        
        // 把结果字典转换结果模型
        ZMHStatusResult *result = [ZMHStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSURLSessionDataTask * task ,NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}





@end
