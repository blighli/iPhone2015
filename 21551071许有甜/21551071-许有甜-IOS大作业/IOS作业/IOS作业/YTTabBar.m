//
//  YTTabBar.m
//  iOS大作业
//
//  Created by Lynn on 15/12/23.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTTabBar.h"
#import "YTTabBarButton.h"
@interface YTTabBar()
@property(nonatomic, weak)YTTabBarButton* selectButton;
@end

@implementation YTTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
    }
    return self;
}
- (void)addTabBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    // 创建按钮
    YTTabBarButton *button = [YTTabBarButton buttonWithType:UIButtonTypeCustom];
    
    // 设置图片
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    // 添加
    [self addSubview:button];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count ==1) {
        [self buttonClick:button];
    }
    
}

- (void)buttonClick:(YTTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectButtonFrom:(int)self.selectButton.tag to:(int)button.tag];
    }
    
    // 设置当前选中的按钮取消选中
    self.selectButton.selected = NO;
    
    // 让新点击的按钮选中
    button.selected = YES;
    
    self.selectButton = button;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //NSLog(@"%f---%f",self.frame.size.width,self.frame.size.height);
    int count = (int)self.subviews.count;
    for (int i = 0; i<count; i++) {
        YTTabBarButton* button = self.subviews[i];
        button.tag = i;
        
        // 设置frame
        CGFloat margin = 35;
        CGFloat buttonY = 15;
        CGFloat buttonW = self.frame.size.height/2;
        CGFloat buttonH = self.frame.size.height/2;//self.frame.size.height-10;
        CGFloat buttonX = margin + i * (margin*2 + buttonW);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

@end
