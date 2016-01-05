//
//  JYUser.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/22.
//  Copyright © 2015年 GJY. All rights reserved.
//
//微博作者
#import "JYUser.h"

@implementation JYUser
+(instancetype)userWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self =[super init])
    {
        //self.idstr=dict[@"idstr"];
        self.name=dict[@"name"];
        self.profile_image_url=dict[@"profile_image_url"];
        self.mbrank=[dict[@"mbrank"]intValue];
        self.mbtype=[dict[@"mbtype"]intValue];
        //[self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
