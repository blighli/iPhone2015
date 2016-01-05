//
//  STSettingItem.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STSettingItem.h"

@implementation STSettingItem

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    STSettingItem *item=[[self alloc]init];
    item.icon=icon;
    item.title=title;
    
    return item;
}

+(instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
@end
