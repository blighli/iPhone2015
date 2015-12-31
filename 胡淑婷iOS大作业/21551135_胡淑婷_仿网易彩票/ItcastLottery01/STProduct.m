//
//  STProduct.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/28.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STProduct.h"

@implementation STProduct
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
//        [self setValuesForKeysWithDictionary:dict];
        self.icon=dict[@"icon"];
        self.title=dict[@"title"];
        self.scheme=dict[@"customUrl"];
        self.url=dict[@"url"];
        self.identifier=dict[@"id"];
    }
    return self;
}

+(instancetype)productWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
