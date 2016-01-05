//
//  YTEditViewController.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <UIKit/UIKit.h>
#import "YTBaseContactViewController.h"
@class YTContact,YTEditContactViewController;

@protocol YTEditContactViewControllerDelegate <NSObject>

- (void)editViewController:(YTEditContactViewController *)editViewController didSaveContact:(YTContact *)contact;

@end

@interface YTEditContactViewController : YTBaseContactViewController
@property (nonatomic, strong) YTContact *contact;
@property (nonatomic, strong) id<YTEditContactViewControllerDelegate> contactDelegate;
@end
