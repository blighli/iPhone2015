//
//  ZMHAccountTool.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/27.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHAccountTool.h"
#import "ZMHAccount.h"
#import "ZMHAccountParam.h"
#import "CONFIG.h"
#import "ZMHWeiboTool.h"
#import "MJExtension.h"

@implementation ZMHAccountTool



static ZMHAccount *_account;
+ (void)saveAccount:(ZMHAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:ZMHAccountFileName];
}

+ (ZMHAccount *)account
{
    if (_account == nil) {
        
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:ZMHAccountFileName];
        
        // 判断下账号是否过期，如果过期直接返回Nil
        // 2015 < 2017
        if ([[NSDate date] compare:_account.expires_date] != NSOrderedAscending) { // 过期
            return nil;
        }
        
    }
    
    
    return _account;
}

+ (void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    ZMHAccountParam *param = [[ZMHAccountParam alloc] init];
    param.client_id = ZMHClient_id;
    param.client_secret = ZMHClient_secret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = ZMHRedirect_uri;
    NSProgress *progress  = [[NSProgress alloc]init] ;
    
    [ZMHWeiboTool Post:@"https://api.weibo.com/oauth2/access_token" parameters:param.keyValues success:^(NSURLSessionDataTask * task ,id responseObject) {
        // 字典转模型
        ZMHAccount *account = [ZMHAccount accountWithDict:responseObject];
        
        // 保存账号信息:
        [ZMHAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
        
    } failure:^(NSURLSessionDataTask * task ,NSError *error) {
        if (failure) {
            failure(error);
            NSLog(@"%@",error) ;
            
        }
    }];
}


@end
