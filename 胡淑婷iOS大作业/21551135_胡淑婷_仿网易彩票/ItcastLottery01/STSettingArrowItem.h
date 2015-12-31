//
//  STSettingArrowItem.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STSettingItem.h"

@interface STSettingArrowItem : STSettingItem
/**
 点击这行cell需要跳转的控制器
 */
@property(nonatomic,assign)Class destVcClass;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+(instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
