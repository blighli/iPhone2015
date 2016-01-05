//
//  JYTabBar.h
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JYTabBar;
@protocol JYTabBarDelegate <NSObject>

-(void)tabBar:(JYTabBar *)tabBar didSelectItemFrom:(long)from to:(long)to;

@end
@interface JYTabBar : UIView

-(void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property(nonatomic,weak) id<JYTabBarDelegate> delegate;
@end
