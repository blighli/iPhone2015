//
//  ALHeaderView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/2.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALHeaderView.h"

@interface ALHeaderView ()

@property (assign, nonatomic) CGFloat orignHeight;

@end

@implementation ALHeaderView

NSString * const kKeyPath = @"contentOffset";

- (instancetype)initWithHeigh:(CGFloat)height{
    self = [self initWithFrame:CGRectMake(0, 0, 0, height)];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.orignHeight = frame.size.height;
        self.autoSetInset = YES;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    [self.superview removeObserver:self forKeyPath:kKeyPath];
    
    if (newSuperview != nil) {
        assert([newSuperview isKindOfClass:[UIScrollView class]]);
        
        UIScrollView *scrollView = (UIScrollView *)newSuperview;
        
        if (self.autoSetInset) {
            scrollView.contentInset = UIEdgeInsetsMake(scrollView.contentInset.top + self.orignHeight, scrollView.contentInset.left, scrollView.contentInset.bottom, scrollView.contentInset.right);
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset;
        
        [scrollView addObserver:self forKeyPath:kKeyPath options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, scrollView.frame.size.width, self.frame.size.height);
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:kKeyPath]) {
        UIScrollView *scrollView = (UIScrollView *)self.superview;
        
        CGFloat delta = 0.0;
        if (scrollView.contentOffset.y < 0.0) {
            delta = fabs(MIN(0.0, scrollView.contentOffset.y));
        }
        CGRect newFrame = self.frame;
        newFrame.origin.y = -delta;
        if (self.autoSetInset) {
            newFrame.size.height = delta;
        }else{
            newFrame.size.height = self.orignHeight + delta;
        }
        self.frame = newFrame;
        
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
