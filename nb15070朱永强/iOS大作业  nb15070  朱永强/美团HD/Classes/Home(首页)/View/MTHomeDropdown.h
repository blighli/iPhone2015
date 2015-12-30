//
//  MTHomeDropdown.h
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTHomeDropdown;

@protocol MTHomeDropdownDataSource <NSObject>
/**
 *  左边表格一共有多少行
 */
- (NSInteger)numberOfRowsInMainTable:(MTHomeDropdown *)homeDropdown;
/**
 *  左边表格每一行的标题
 *  @param row          行号
 */
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown titleForRowInMainTable:(int)row;
/**
 *  左边表格每一行的子数据
 *  @param row          行号
 */
- (NSArray *)homeDropdown:(MTHomeDropdown *)homeDropdown subdataForRowInMainTable:(int)row;

@optional
/**
 *  左边表格每一行的图标
 *  @param row          行号
 */
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown iconForRowInMainTable:(int)row;
/**
 *  左边表格每一行的选中图标
 *  @param row          行号
 */
- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown selectedIconForRowInMainTable:(int)row;
@end

@protocol MTHomeDropdownDelegate <NSObject>

@optional
- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInMainTable:(int)row;
- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInSubTable:(int)subrow inMainTable:(int)mainRow;
@end

@interface MTHomeDropdown : UIView
+ (instancetype)dropdown;
@property (nonatomic, weak) id<MTHomeDropdownDataSource> dataSource;
@property (nonatomic, weak) id<MTHomeDropdownDelegate> delegate;
@end
