//
//  STHtml.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STHtml.h"

@implementation STHtml
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        self.html=dict[@"html"];
        self.title=dict[@"title"];
        self.ID=dict[@"id"];
    }
    return self;
}
+(instancetype)htmlWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
