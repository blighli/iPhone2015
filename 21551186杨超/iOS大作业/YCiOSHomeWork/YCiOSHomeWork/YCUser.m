//
//  YCUser.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCUser.h"
#import "AFNetworkTool.h"
#import "AppDelegate.h"
#import "YCPermission.h"
#import "YCAPIManager.h"

@implementation YCUser

+ (void)getUser:(NSDictionary *)paramDic success:(void (^)(YCUser *))success failed:(void (^)(NSError *))failed
{
    NSString *url = [NSString stringWithFormat:@"/api/v1.0/users/%@", paramDic[@"email_or_token"]];
    [[YCAPIManager sharedManager] setUsername:paramDic[@"email_or_token"] andPassword:paramDic[@"password"]];
    [[YCAPIManager sharedManager] POST:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        YCUser *user = [[YCUser alloc] initWithDict:responseObject];
        user.email_or_token = paramDic[@"email_or_token"];
        user.password = paramDic[@"password"];
        success(user);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failed(error);
    }];
}

+ (void)sendNewPost:(NSDictionary *)paramDict success:(void (^)(YCUser *))success failed:(void (^)(NSError *))failed
{
    NSString *url = @"http://121.42.172.76/api/v1.0/posts/";
    return [AFNetworkTool postJSONWithUrl:url parameters:paramDict success:^(id responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        
        YCUser *user = [[YCUser alloc] initWithDict:dict];
        success(user);
        
        //判断用户权限示例
        NSLog(@"是否具有权限：%d", ([AppDelegate APP].user.permission & [YCPermission FOLLOW]) == [YCPermission FOLLOW]);
        NSLog(@"是否具有权限：%d", ([AppDelegate APP].user.permission & [YCPermission FOLLOW]) == [AppDelegate APP].user.permission);
    } fail:^(NSError *error){
        failed(error);
    }];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    //头像地址转换成网络地址 部分image_url是空值，因此需要筛选
    if (dict[@"image_url"] != [NSNull null]) {
        NSString *imgUrl = [self getImageUrl:dict[@"image_url"]];
        NSString *urlStr = [NSString stringWithFormat:@"http://121.42.172.76%@",imgUrl];
        self.image_url = urlStr;
    }else{
        self.image_url = NULL;
    }
    return self;
}

- (NSString *)getImageUrl:(NSString *)imgUrl
{
    return [imgUrl componentsSeparatedByString:@"app"][1];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n用户ID：%d\n邮箱：%@\n认证：%@\n权限：%d\nurl：%@\n用户名：%@\n注册时间：%@\n上次登录：%@\n文章地址：%@\n关注文章的地址：%@\n文章数量：%d\n", self.id, self.email, self.confirmed, self.permission, self.url, self.username, self.member_since, self.last_seen, self.posts, self.followed_posts, self.post_count];
}

- (Boolean)can:(int)permission
{
    return (self.permission & permission) == permission;
}

@end
