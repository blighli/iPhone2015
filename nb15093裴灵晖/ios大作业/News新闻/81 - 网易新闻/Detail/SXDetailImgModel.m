//
//  SXDetailImgModel.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXDetailImgModel.h"

@implementation SXDetailImgModel

/** 便利构造器方法 */
+ (instancetype)detailImgWithDict:(NSDictionary *)dict
{
    SXDetailImgModel *imgModel = [[self alloc]init];
    imgModel.ref = dict[@"ref"];
    imgModel.pixel = dict[@"pixel"];
    imgModel.src = dict[@"src"];
    
    return imgModel;
}

@end
