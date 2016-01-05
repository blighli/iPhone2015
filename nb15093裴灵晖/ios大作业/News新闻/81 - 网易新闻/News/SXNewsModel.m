//
//  SXNewsModel.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXNewsModel.h"

@implementation SXNewsModel

+ (instancetype)newsModelWithDict:(NSDictionary *)dict
{
    SXNewsModel *model = [[self alloc]init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

@end
