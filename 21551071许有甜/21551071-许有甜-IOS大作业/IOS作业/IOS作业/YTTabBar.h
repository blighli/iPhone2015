//
//  YTTabBar.h
//  iOS大作业
//
//  Created by Lynn on 15/12/23.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YTTabBar;

@protocol YTTabBarDelegate <NSObject>

@optional
- (void)tabBar:(YTTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to;

@end


@interface YTTabBar : UIView

@property (nonatomic, weak) id<YTTabBarDelegate> delegate;
/**
 *  向自定义的TatBar中添加按钮
 */
- (void)addTabBarButtonWithName:(NSString*)name selName:(NSString*)selName;
@end
