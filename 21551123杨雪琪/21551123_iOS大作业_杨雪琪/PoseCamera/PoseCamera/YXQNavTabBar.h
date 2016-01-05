//
//  YXQNavTabBar.h
//  PoseCamera
//
//  Created by YXQ on 15/12/20.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YXQNavTabBarDelegate <NSObject>

@optional

- (void)itemDidSelectedWithIndex:(NSInteger)index;

@end

@interface YXQNavTabBar : UIView

@property (nonatomic, weak) id <YXQNavTabBarDelegate>delegate;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSArray *selectedItemTitles;

- (instancetype)initWithFrame:(CGRect)frame;

@end
