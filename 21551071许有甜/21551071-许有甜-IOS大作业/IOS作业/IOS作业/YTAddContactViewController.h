//
//  YTAddViewController.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights

#import <UIKit/UIKit.h>
#import "YTBaseContactViewController.h"
@class YTAddContactViewController;
@class YTContact;

@protocol YTAddContactViewControllerDelegate <NSObject>

@optional

- (void)addViewController:(YTAddContactViewController *)addVc didiAddContact:(YTContact *)contact;
@end

@interface YTAddContactViewController : YTBaseContactViewController

@property (nonatomic, weak) id<YTAddContactViewControllerDelegate> contactDelegate;
@end
