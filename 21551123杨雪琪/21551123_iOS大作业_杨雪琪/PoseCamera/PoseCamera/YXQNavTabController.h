//
//  YXQNavTabController.h
//  PoseCamera
//
//  Created by YXQ on 15/12/21.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXQNavTabController : UIViewController

@property (nonatomic, assign) BOOL scrollAnimation;
@property (nonatomic, assign) BOOL mainViewBounces;
@property (nonatomic, strong) NSArray *subViewControllers;   //子控制器
@property (nonatomic, strong) UIColor *navTabBarColor;          //不能设置为[UIColor clearColor]
@property (nonatomic, assign) NSInteger selectedToIndex;

//添加父控制器
- (void)addParentController:(UIViewController *)viewController;

@end
