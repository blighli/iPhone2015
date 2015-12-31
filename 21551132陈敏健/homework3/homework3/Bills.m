//
//  Bills.m
//  homework3
//
//  Created by 敏少eclipse on 15/11/1.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import "Bills.h"

@implementation Bills

+(instancetype)billWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(NSMutableDictionary *)getDictionary
{
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    [dict setObject:self.title forKey:@"title"];
    return dict;
}

@end
