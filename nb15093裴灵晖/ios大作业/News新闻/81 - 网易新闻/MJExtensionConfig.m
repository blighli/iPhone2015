//
//  MJExtensionConfig.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "SXWeatherModel.h"
#import "SXPhotoSet.h"

@implementation MJExtensionConfig
+ (void)load
{

    [SXWeatherModel setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"detailArray" : @"SXWeatherDetailM"
                 };
    }];
    // 相当于在StatusResult.m中实现了+objectClassInArray方法
    
    // Student中的ID属性对应着字典中的id
    // ....
    [SXWeatherModel setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"detailArray" : @"北京|北京"
                 };
    }];
    // 相当于在Student.m中实现了+replacedKeyFromPropertyName方法
    
    [SXPhotoSet setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"photos":@"SXPhotosDetail"
                 };
    }];
}
@end
