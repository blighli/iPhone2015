//
//  YCAPIManager.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface YCAPIManager : AFHTTPRequestOperationManager

- (void)setUsername:(NSString *)username andPassword:(NSString *)password;

- (void)setToken:(NSString *)token;

+ (YCAPIManager *)sharedManager;

@end
