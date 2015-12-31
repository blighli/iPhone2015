//
//  STSettingGroup.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STSettingGroup : NSObject
/**
 头部标题
 */
@property(nonatomic,copy)NSString *header;
/**
 尾部标题
 */
@property(nonatomic,copy)NSString *footer;
/**
 存放着这组所有行的模型数据（这个数组中都是STSettingItem对象）
 */
@property(nonatomic,copy)NSArray *items;

@end
