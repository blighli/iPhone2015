//
//  YTSettingItem.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTSettingItem.h"

@implementation YTSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass
{
    YTSettingItem *item = [self itemWithIcon:icon title:title];
    item.subtitle = subtitle;
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
{
    return [self itemWithIcon:icon title:title subtitle:nil destVcClass:destVcClass];
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title subtitle:nil destVcClass:destVcClass];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    YTSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title  subtitle:subtitle destVcClass:destVcClass];
}

@end
