//
//  ZMHWeiboTool.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/26.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHWeiboTool.h"
#import "AFNetworking.h"
//#import "AFHTTPRequestOperationManager.h"

@implementation ZMHWeiboTool

//+ (void)GET:(NSString *)URLString parameters:(id)parameters NSProgress:(id)progress success:(void (^)(id))success failure:(void (^)(NSError *))failure success:(void (^)(id))success failure:(void (^)(NSError *))failure
//{
//    // 创建请求管理者
//    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//    mgr GET:(nonnull NSString *) parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
//        <#code#>
//    } success:success failure:failure
//    
//    
//    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        // AFN请求成功时候调用block
//        // 先把请求成功要做的事情，保存到这个代码块
//        if (success) {
//            success(responseObject);
//        }
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure) {
//            failure(error);
//        }
//    }];
//}

+ (void)GET:(NSString *)URLString parameters:(id)parameters
 //NSProgress:(id)progress
    success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure

{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSLog(URLString) ;
   [mgr GET:URLString parameters:parameters success:success    failure:failure
    ];
}


+ (void)Post:(NSString *)URLString parameters:(id)parameters
  //NSProgress:(id)progress
     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure

{
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    NSLog(URLString) ;
    [mgr POST:URLString parameters:parameters success:success failure:failure];
}


@end
