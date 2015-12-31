//
//  YCAPIManager.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCAPIManager.h"
#import "AFNetworkActivityIndicatorManager.h"

@implementation YCAPIManager

- (void)setUsername:(NSString *)username andPassword:(NSString *)password
{
    [self.requestSerializer clearAuthorizationHeader];
    [self.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:password];
}

- (void)setToken:(NSString *)token
{
    [self.requestSerializer clearAuthorizationHeader];
    [self.requestSerializer setAuthorizationHeaderFieldWithToken:token];
}

#pragma mark - Initialization

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if(!self)
        return nil;
    
    self.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    return self;
}

#pragma mark - Singleton Methods

+ (YCAPIManager *)sharedManager
{
    static dispatch_once_t pred;
    static YCAPIManager *_sharedManager = nil;
    
    dispatch_once(&pred, ^{ _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://121.42.172.76"]]; }); // You should probably make this a constant somewhere
    return _sharedManager;
}

@end
