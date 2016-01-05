//
//  YTSettingItem.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <Foundation/Foundation.h>

typedef void(^YTSettingItemOption)();

@interface YTSettingItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  内容
 */
@property (nonatomic, copy) NSString *subtitle;
/**
 *  开关
 */
@property (nonatomic, assign) BOOL swch;
/**
 *  点击cell需要做的事情
 */
@property (nonatomic, copy) YTSettingItemOption option;
/**
 *  跳转到目标控制器
 */
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass;
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;

@end
