//
//  YXQNavTabBar.m
//  PoseCamera
//
//  Created by YXQ on 15/12/20.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQNavTabBar.h"
#import "YXQConstant.h"

#define TABBAR_TITLE_FONT [UIFont systemFontOfSize:18.f]

@interface YXQNavTabBar(){
    UIScrollView *_navigationTabBar;   //所有控制器标题都在此scrollView上
    UIView *_line;                     //选中控制器标题的下划线
    NSMutableArray *_items;            //YXQNavTabBar上的条目
    NSArray *_itemsWidth;              //控制器器标题的宽度数组
    NSMutableArray *_itemsShowedTitle;
    CGFloat _navigationTabBarWidth;
    CGFloat _selectedTitlesWidth;
}

@end

@implementation YXQNavTabBar

- (instancetype) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = bgColor;
        [self viewConfig];
    }
    return self;
}

- (void)viewConfig
{
    _items = [@[] mutableCopy];
    _itemsShowedTitle = [@[] mutableCopy];
    _navigationTabBarWidth = SCREEN_WIDTH;
    _navigationTabBar = [[UIScrollView alloc] initWithFrame:CGRectMake(ZERO_COORDINATE, ZERO_COORDINATE, _navigationTabBarWidth, NAV_TAB_BAR_HEIGHT)];
    _navigationTabBar.showsHorizontalScrollIndicator = NO;
    _navigationTabBar.showsVerticalScrollIndicator = NO;
    [self addSubview:_navigationTabBar];
}

- (void)showLineWidthButtonWidth:(CGFloat)width
{
    _line = [[UIView alloc] initWithFrame:CGRectMake(2.0f, NAV_TAB_BAR_HEIGHT - 3.0f, width - 4.0f, 3.0f)];
    _line.backgroundColor = UIColorWithRGBA(203.0f, 202.0f, 93.0f, 1.0f);
    [_navigationTabBar addSubview:_line];
}

- (NSArray *)getButtonsWidthWithTitles:(NSArray *)titles
{
    NSMutableArray *widths = [@[] mutableCopy];
    _selectedTitlesWidth = 0;
    for (NSString *title in titles) {
        CGSize size = [title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : TABBAR_TITLE_FONT} context:nil].size;
        CGFloat eachButtonWidth = size.width + 20.0f;
        _selectedTitlesWidth += eachButtonWidth;
        NSNumber *width = [NSNumber numberWithFloat:eachButtonWidth];
        [widths addObject:width];
    }
    if (_selectedTitlesWidth < _navigationTabBarWidth) {
        [widths removeAllObjects];
        NSNumber *width = [NSNumber numberWithFloat:_navigationTabBarWidth / titles.count];
        for (int index = 0; index < titles.count; index++) {
            [widths addObject:width];
        }
    }
    return widths;
}

- (CGFloat)contentWidthAndAddNavTabBarItemsWithButtonsWidth:(NSArray *)widths
{
    CGFloat buttonX = ZERO_COORDINATE;
    for (NSInteger index = 0; index < widths.count; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(buttonX, ZERO_COORDINATE, [widths[index] floatValue], NAV_TAB_BAR_HEIGHT);
        button.titleLabel.font = TABBAR_TITLE_FONT;
        [button setTitle:_selectedItemTitles[index] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_navigationTabBar addSubview:button];
        [_items addObject:button];
        buttonX += [widths[index] floatValue];
    }
    if (widths.count) {
        [self showLineWidthButtonWidth:[widths[0] floatValue]];
    }
    return buttonX;
}

- (void)itemPressed:(UIButton *)button
{
    NSInteger index = [_items indexOfObject:button];
    if ([self.delegate respondsToSelector:@selector(itemDidSelectedWithIndex:)]) {
        [self.delegate itemDidSelectedWithIndex:index];
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    UIButton *button = _items[currentIndex];
    [UIView animateWithDuration:0.2f animations:^{
        _line .frame = CGRectMake(button.frame.origin.x + 2.0f, _line.frame.origin.y, [_itemsWidth[currentIndex] floatValue] - 4.0f, _line.frame.size.height);
    }];
    
}

- (void)setSelectedItemTitles:(NSArray *)selectedItemTitles
{
    _selectedItemTitles = selectedItemTitles;
    _itemsWidth = [self getButtonsWidthWithTitles:_selectedItemTitles];
    CGFloat contentWidth = [self contentWidthAndAddNavTabBarItemsWithButtonsWidth:_itemsWidth];
    _navigationTabBar.contentSize = CGSizeMake(contentWidth, ZERO_COORDINATE);
}

@end
