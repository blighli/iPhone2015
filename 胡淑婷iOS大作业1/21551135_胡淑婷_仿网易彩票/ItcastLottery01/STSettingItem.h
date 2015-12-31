//
//  STSettingItem.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//每一个cell对应一个STSettingItem

#import <Foundation/Foundation.h>

//typedef enum{
//    STSettingItemTypeArrow,
//    STSettingItemTypeSwitch
//}STSettingItemType;

typedef void (^STSettingItemOption)();

@interface STSettingItem : NSObject
/**
 图标
 */
@property(nonatomic,copy)NSString *icon;
/**
 标题
 */
@property(nonatomic,copy)NSString *title;
/**
 子标题
 */
@property(nonatomic,copy)NSString *subtitle;

/**
 点击那个cell需要做什么事情
 */
@property(nonatomic,copy)STSettingItemOption option;

//@property(nonatomic,assign)STSettingItemType type;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+(instancetype)itemWithTitle:(NSString *)title;
@end
