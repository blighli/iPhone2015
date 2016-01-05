//
//  ZMHAccount.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/27.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHAccount.h"

#import "MJExtension.h"

@implementation ZMHAccount


MJCodingImplementation
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    ZMHAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dict];
    
    return account;
}

- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    
    // 计算过期的时间 = 当前时间 + 有效期
    _expires_date = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}


@end
