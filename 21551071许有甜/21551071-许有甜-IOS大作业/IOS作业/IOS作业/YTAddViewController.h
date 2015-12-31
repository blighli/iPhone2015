//
//  YTAddViewController.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <UIKit/UIKit.h>
#import "YTBaseMemoViewController.h"
@class YTMemoFrame,YTAddViewController;

@protocol YTAddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(YTAddViewController *)addMemoVc didSaveInfo:(YTMemoFrame *)memoFrame;

@end

@interface YTAddViewController : YTBaseMemoViewController

@property (nonatomic, strong) id<YTAddViewControllerDelegate> delegate;
@end
