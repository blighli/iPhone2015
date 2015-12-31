//
//  STSettingArrowItem.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STSettingArrowItem.h"

@implementation STSettingArrowItem
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    STSettingArrowItem *item=[self itemWithIcon:icon title:title];
    item.destVcClass=destVcClass;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end
