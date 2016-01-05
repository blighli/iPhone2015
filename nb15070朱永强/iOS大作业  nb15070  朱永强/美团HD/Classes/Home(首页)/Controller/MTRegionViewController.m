//
//  MTRegionViewController.m
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "MTRegionViewController.h"
#import "MTHomeDropdown.h"
#import "UIView+Extension.h"
#import "MTCityViewController.h"
#import "MTNavigationController.h"
#import "MTRegion.h"
#import "MTConst.h"

@interface MTRegionViewController () <MTHomeDropdownDataSource, MTHomeDropdownDelegate>
- (IBAction)changeCity;
@end

@implementation MTRegionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建下拉菜单
    UIView *title = [self.view.subviews firstObject];
    MTHomeDropdown *dropdown = [MTHomeDropdown dropdown];
    dropdown.y = title.height;
    dropdown.dataSource = self;
    dropdown.delegate = self;
    [self.view addSubview:dropdown];
    
    // 设置控制器在popover中的尺寸
    self.preferredContentSize = CGSizeMake(dropdown.width, CGRectGetMaxY(dropdown.frame));
}

/**
 *  切换城市
 */
- (IBAction)changeCity {
    [self.popover dismissPopoverAnimated:YES];
    
    MTCityViewController *city = [[MTCityViewController alloc] init];
    MTNavigationController *nav = [[MTNavigationController alloc] initWithRootViewController:city];
    nav.modalPresentationStyle = UIModalPresentationFormSheet;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
    
    // self.presentedViewController会引用着被modal出来的控制器
    // modal出来的是MTNavigationController
    // dismiss掉的应该也是MTNavigationController
}

#pragma mark - MTHomeDropdownDataSource
- (NSInteger)numberOfRowsInMainTable:(MTHomeDropdown *)homeDropdown
{
    return self.regions.count;
}

- (NSString *)homeDropdown:(MTHomeDropdown *)homeDropdown titleForRowInMainTable:(int)row
{
    MTRegion *region = self.regions[row];
    return region.name;
}

- (NSArray *)homeDropdown:(MTHomeDropdown *)homeDropdown subdataForRowInMainTable:(int)row
{
    MTRegion *region = self.regions[row];
    return region.subregions;
}

#pragma mark - MTHomeDropdownDelegate
- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInMainTable:(int)row
{
    MTRegion *region = self.regions[row];
    if (region.subregions.count == 0) {
        // 发出通知
        [MTNotificationCenter postNotificationName:MTRegionDidChangeNotification object:nil userInfo:@{MTSelectRegion : region}];
    }
}

- (void)homeDropdown:(MTHomeDropdown *)homeDropdown didSelectRowInSubTable:(int)subrow inMainTable:(int)mainRow
{
    MTRegion *region = self.regions[mainRow];
    // 发出通知
    [MTNotificationCenter postNotificationName:MTRegionDidChangeNotification object:nil userInfo:@{MTSelectRegion : region, MTSelectSubregionName : region.subregions[subrow]}];
}
@end
