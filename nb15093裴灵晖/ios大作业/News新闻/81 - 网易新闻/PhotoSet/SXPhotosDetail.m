//
//  SXPhotosDetail.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//


#import "SXPhotosDetail.h"

@implementation SXPhotosDetail

+ (instancetype)photoDetailWithDict:(NSDictionary *)dict
{
    SXPhotosDetail *photoDetail = [[SXPhotosDetail alloc]init];
    [photoDetail setValuesForKeysWithDictionary:dict];
    
    return photoDetail;
}

@end
