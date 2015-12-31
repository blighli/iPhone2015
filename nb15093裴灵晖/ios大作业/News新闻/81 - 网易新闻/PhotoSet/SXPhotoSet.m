//
//  SXPhotoSet.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXPhotoSet.h"
#import "SXPhotosDetail.h"

@implementation SXPhotoSet

+ (instancetype)photoSetWith:(NSDictionary *)dict
{
    SXPhotoSet *photoSet = [[SXPhotoSet alloc]init];
    [photoSet setValuesForKeysWithDictionary:dict];
    
    NSArray *photoArray = photoSet.photos;
    NSMutableArray *temArray = [NSMutableArray arrayWithCapacity:photoArray.count];
    
    for (NSDictionary *dict in photoArray) {
        SXPhotosDetail *photoModel = [SXPhotosDetail photoDetailWithDict:dict];
        [temArray addObject:photoModel];
    }
    photoSet.photos = temArray;
    
    return photoSet;
}

@end
