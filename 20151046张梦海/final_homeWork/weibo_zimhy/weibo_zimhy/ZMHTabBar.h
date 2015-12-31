//
//  ZMHTabBar.h
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMHTabBar;

@protocol ZMHTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZMHTabBar *)tabBar didClickButton:(NSInteger)index;

@end


@interface ZMHTabBar : UIView

//@property (nonatomic, assign) NSUInteger tabBarButtonCount;

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<ZMHTabBarDelegate> delegate;

@end
