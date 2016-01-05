//
//  ALCircleScrollView.m
//  ALCircleScrollView
//
//  Created by alezai on 15/10/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "ALCircleScrollView.h"

@interface ALCircleScrollView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *scrollTimer;
@property (strong, nonatomic) NSMutableArray *viewsArray;
@property (strong, nonatomic) NSLayoutConstraint *heightConstraint;

@end

@implementation ALCircleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        [self addSubview:_scrollView];
        
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        NSDictionary *scrollViewDic = @{@"scrollView":_scrollView};
        NSArray *scrollHorzConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"|[scrollView]|" options:0 metrics:nil views:scrollViewDic];
        [self addConstraints:scrollHorzConstraints];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        self.heightConstraint = [NSLayoutConstraint constraintWithItem:_scrollView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
        [self addConstraint:self.heightConstraint];
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.userInteractionEnabled = NO;
        [self addSubview:_pageControl];
        _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageControl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageControl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        
        _timeInterVal = 5.f;
        _underStatusbar = NO;
    }
    return self;
}

- (void)relayoutSubViewsWithOffset:(CGPoint)offset{
    
    CGFloat height = CGRectGetHeight(self.frame);
    height = MAX(0, height - offset.y);
    if (offset.y > 0) {
        CGSize newSize = self.scrollView.contentSize;
        newSize.height = height;
        self.scrollView.contentSize = newSize;
    }
    self.heightConstraint.constant = MAX(-CGRectGetHeight(self.frame), -offset.y);
}

- (void)addTimer{
    if (!self.scrollTimer) {
        self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterVal target:self selector:@selector(autoScroll:) userInfo:nil repeats:YES];
    }
}

- (void)removeTimer{
    [self.scrollTimer invalidate];
    self.scrollTimer = nil;
}

- (void)setTimeInterVal:(CGFloat)timeInterVal{
    _timeInterVal = timeInterVal;
    [self removeTimer];
    [self addTimer];
}

- (void)setUnderStatusbar:(BOOL)underStatusbar{
    _underStatusbar = underStatusbar;
    self.heightConstraint.constant = _underStatusbar ? 20 : 0;
}

#pragma mark - private

- (void)reloadData{
    if ([self.delegate respondsToSelector:@selector(numberOfViewsInScrollView:)]) {
        self.pageControl.numberOfPages = [self.delegate numberOfViewsInScrollView:self.scrollView];
    }
    
    if (self.pageControl.numberOfPages > 0) {
        NSInteger numberOfViews = self.pageControl.numberOfPages + 2;
        
        self.viewsArray = [NSMutableArray arrayWithCapacity:numberOfViews];
        for (NSInteger i = 0; i < numberOfViews; i ++) {
            [self.viewsArray addObject:[NSNull null]];
        }
        self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * numberOfViews, CGRectGetHeight(self.frame));
        
        self.pageControl.currentPage = 0;
        
        for (NSInteger i = -1; i <= numberOfViews;i ++) {
            [self loadViewsAtIndex:i];
        }
        [self.scrollView setContentOffset:CGPointMake(CGRectGetWidth(self.frame), 0)];
        [self addTimer];
    }
}

- (void)loadViewsAtIndex:(NSInteger)index{
    
    if (index < -1 || index > self.pageControl.numberOfPages) {
        return;
    }
    
    NSInteger loadIndex = 0;
    NSInteger locationIndex = 0;
    if (index == -1) {
        loadIndex = self.pageControl.numberOfPages - 1;
    }else if (index == self.pageControl.numberOfPages){
        loadIndex = 0;
    }else{
        loadIndex = index;
    }
    locationIndex = index + 1;
    
    UIView *view = self.viewsArray[locationIndex];
    if ((NSNull *)view == [NSNull null]) {
        if ([self.delegate respondsToSelector:@selector(scrollView:viewAtIndex:)]) {
            view = [self.delegate scrollView:self.scrollView viewAtIndex:loadIndex];
        }
    }
    
    if (view) {
        [self.scrollView addSubview:view];
        view.translatesAutoresizingMaskIntoConstraints = NO;
        [self.viewsArray replaceObjectAtIndex:locationIndex withObject:view];
        CGFloat scrollViewWeight = CGRectGetWidth(self.frame);
        
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:locationIndex * scrollViewWeight]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDidTap:)];
        [view addGestureRecognizer:tapGesture];
    }
    
}

- (void)scrollViewDidTap:(UITapGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(scrollView:didSelectedAtIndex:)]) {
            [self.delegate scrollView:self.scrollView didSelectedAtIndex:self.pageControl.currentPage];
        }
    }
}

- (void)autoScroll:(NSTimer *)timer{
    if (self.pageControl.numberOfPages > 0) {
        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
        NSUInteger page = self.scrollView.contentOffset.x / pageWidth + 1;
        [self.scrollView scrollRectToVisible:CGRectMake(page * pageWidth, 0, pageWidth, CGRectGetHeight(self.scrollView.frame)) animated:YES];
    }
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = self.scrollView.contentOffset.x / pageWidth;
    [self updatePageControlWithPage:page];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
    NSUInteger page = self.scrollView.contentOffset.x / pageWidth;
    [self updatePageControlWithPage:page];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

- (void)updatePageControlWithPage:(NSUInteger)page{
    CGFloat pageWidth = CGRectGetWidth(self.frame);
    self.pageControl.currentPage = (page - 1) % self.pageControl.numberOfPages;
    
    if(page == 0){
        [self.scrollView setContentOffset:CGPointMake(pageWidth * (self.viewsArray.count - 2), 0)];
        self.pageControl.currentPage = self.pageControl.numberOfPages - 1;
    }else if (page == (self.viewsArray.count - 1)){
        [self.scrollView setContentOffset:CGPointMake(pageWidth, 0)];
        self.pageControl.currentPage = 0;
    }
}

@end
