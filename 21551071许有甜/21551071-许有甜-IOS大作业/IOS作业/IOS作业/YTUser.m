//
//  YTUser.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTUser.h"

@implementation YTUser

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.account forKey:@"account"];
    [aCoder encodeObject:self.userPWD forKey:@"userPWD"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.account = [aDecoder decodeObjectForKey:@"account"];
    self.userPWD = [aDecoder decodeObjectForKey:@"userPWD"];
    return self;
}

@end
