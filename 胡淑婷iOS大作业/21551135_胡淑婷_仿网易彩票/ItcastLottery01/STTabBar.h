//
//  STTabBar.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STTabBar;

@protocol STTabBarDelegate <NSObject>

@optional
-(void)tabBar:(STTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end
@interface STTabBar : UIView

@property(nonatomic,weak)id<STTabBarDelegate> delegate;
/**
 用来添加内部的按钮
 
 */
-(void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName;
@end
