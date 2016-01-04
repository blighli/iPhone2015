//
//  ALCircleScrollView.h
//  ALCircleScrollView
//
//  Created by alezai on 15/10/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ALCircleScrollViewDelegate <NSObject>

- (NSUInteger)numberOfViewsInScrollView:(UIScrollView *)scrollView;
- (UIView *)scrollView:(UIScrollView *)scrollView viewAtIndex:(NSUInteger)index;

@optional
- (void)scrollView:(UIScrollView *)scrollView didSelectedAtIndex:(NSUInteger)index;

@end

@interface ALCircleScrollView : UIView

@property (weak, nonatomic) id<ALCircleScrollViewDelegate>delegate;
@property (assign, nonatomic) CGFloat timeInterVal; //default is 5.f
@property (assign, nonatomic) BOOL underStatusbar;  //default is NO

- (void)relayoutSubViewsWithOffset:(CGPoint)offset;
- (void)addTimer;
- (void)removeTimer;
- (void)reloadData;

@end
