//
//  MTCategoryViewController.m
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

// iPad中控制器的view的尺寸默认都是1024x768, MTHomeDropdown的尺寸默认是300x340
// MTCategoryViewController显示在popover中,尺寸变为480x320, MTHomeDropdown的尺寸也跟着减小:0x0

#import "MTCategoryViewController.h"
#import "MTHomeDropdown.h"
#import "UIView+Extension.h"
#import "MTCategory.h"
#import "MJExtension.h"
#import "MTMetaTool.h"
#import "MTConst.h"

@interface MTCategoryViewController () <MTHomeDropdownDataSource, MTHomeDropdownDelegate>
@end

@implementation MTCategoryViewController

- (void)loadView
{
    MTHomeDropdown *dropdown = [MTHomeDropdown dropdown];
    dropdown.dataSource = self;
    dropdown.delegate = self;
    self.view = dropdown;
    
    // 设置控制器view在popover中的尺寸
    self.preferredContentSize = dropdown.size;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - MTHomeDropdownDataSource
- (NSInteger)numberOfRowsInMainTable:(MTHomeDropdown *)homeDropdown
{
    return [MTMetaTool categories].count;
}

- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown titleForRowInMainTable:(int)row
{
    MTCategory *category = [MTMetaTool categories][row];
    return category.name;
}

- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown iconForRowInMainTable:(int)row
{
    MTCategory *category = [MTMetaTool categories][row];
    return category.small_icon;
}

- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown selectedIconForRowInMainTable:(int)row
{
    MTCategory *category = [MTMetaTool categories][row];
    return category.small_highlighted_icon;
}

- (NSArray *)homeDropdown:(MTHomeDropdown *)homeDropdown subdataForRowInMainTable:(int)row
{
    MTCategory *category = [MTMetaTool categories][row];
    return category.subcategories;
}

#pragma mark - MTHomeDropdownDelegate
- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInMainTable:(int)row
{
    MTCategory *category = [MTMetaTool categories][row];
    if (category.subcategories.count == 0) {
        // 发出通知
        [MTNotificationCenter postNotificationName:MTCategoryDidChangeNotification object:nil userInfo:@{MTSelectCategory : category}];
    }
}

- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInSubTable:(int)subrow inMainTable:(int)mainRow
{
    MTCategory *category = [MTMetaTool categories][mainRow];
    // 发出通知
    [MTNotificationCenter postNotificationName:MTCategoryDidChangeNotification object:nil userInfo:@{MTSelectCategory : category, MTSelectSubcategoryName : category.subcategories[subrow]}];
}
@end
