//
//  YCUser.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/11.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCUser : NSObject
@property (nonatomic,assign) int id;
@property (nonatomic,copy) NSString *email;
@property (nonatomic,copy) NSString *avatar_hash;
@property (nonatomic,copy) NSString *image_url;
@property (nonatomic,copy) NSString *confirmed;
@property (nonatomic,assign) int permission;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *member_since;
@property (nonatomic,copy) NSString *last_seen;
@property (nonatomic,copy) NSString *posts;
@property (nonatomic,copy) NSString *followed_posts;
@property (nonatomic,assign) int post_count;
@property (nonatomic,copy) NSString *email_or_token;
@property (nonatomic,copy) NSString *password;

- (instancetype)initWithDict:(NSDictionary *)dict;

- (Boolean)can:(int)permission;

//登录
+ (void)getUser:(NSDictionary *)paramDic success:(void (^)(YCUser *user))block failed:(void (^)(NSError *error))error;

//发表post
+ (void)sendNewPost:(NSDictionary *)paramDict success:(void (^)(YCUser *user))block failed:(void (^)(NSError *error))error;

+ (NSURLSessionDataTask *)getSomeTypes:(NSDictionary *)paramDic
                             withBlock:(void (^)(NSDictionary *types, NSError *error))block;

//注销
+ (void)logout;
///获取userdefault中存的邮箱 和 钥匙串中密码
+ (void)getAccount:(void (^)(NSString *username,NSString *password))block;
//存储用户名userdefault ,密码到钥匙串
+ (void)saveAccount:(NSString *)name andPassword:(NSString *)password;

@end
















