//
//  YTBaseSelfInfoViewController.h
//  IOS作业
//
//  Created by Lynn on 15/12/27.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTBaseMemoViewController.h"
#import "YTSettingItem.h"
@class YTSettingItem, YTBaseSelfInfoViewController;
@protocol YTBaseSelfInfoViewControllerDelegate <NSObject>
@optional
- (void)selfInfoViewController:(YTBaseSelfInfoViewController *)selfInfoVc didSaveInfo:(YTSettingItem *)selfInfo;

@end
@interface YTBaseSelfInfoViewController : YTBaseMemoViewController


@property (nonatomic, strong) YTSettingItem *item;
@property (nonatomic, nonatomic) id<YTBaseSelfInfoViewControllerDelegate> delegate;

@end
