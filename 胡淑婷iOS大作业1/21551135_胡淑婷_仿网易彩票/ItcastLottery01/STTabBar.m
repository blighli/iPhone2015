//
//  STTabBar.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STTabBar.h"
#import "STTabBarButton.h"

@interface STTabBar()
/**
 用来记录当前点击的按钮
 */
@property(nonatomic,weak)STTabBarButton *selectedButton;

@end
@implementation STTabBar

/**
 init方法内部会调用initWithFrame:方法
 建议重写这个initWithFrame:方法来做一些初始化的操作
 */

-(void)addTabButtonWithName:(NSString *)name selName:(NSString *)selName
{
    //创建按钮
    STTabBarButton *button=[STTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //设置图片
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    
    //添加
    [self addSubview:button];
    
#warning UIControlEventTouchDown:手指一按下去就会触发这个事件
    //监听
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中第0个按钮
    if (self.subviews.count==1) {
        [self buttonClick:button];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int count=self.subviews.count;
    for (int i=0; i<count; i++) {
        STTabBarButton *button=self.subviews[i];
        button.tag=i;
        
        //设置frame
        CGFloat buttonY=0;
        CGFloat buttonW=self.frame.size.width/count;
        CGFloat buttonH=self.frame.size.height;
        CGFloat buttonX=i*buttonW;
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}
/**
 监听按钮点击
 */
-(void)buttonClick:(STTabBarButton *)button
{
    //4.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    
    //1.让当前选中的按钮取消选中
    self.selectedButton.selected=NO;
    
    //2.让新点击的按钮选中
    button.selected=YES;
    
    //3.新点击的按钮就称为了“当前选中的按钮”
    self.selectedButton=button;
    
    
}
@end
