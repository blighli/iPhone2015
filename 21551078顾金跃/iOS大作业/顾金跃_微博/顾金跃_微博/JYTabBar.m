//
//  JYTabBar.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYTabBar.h"
#import "JYTabBarButton.h"

@interface JYTabBar()
@property(nonatomic,weak)JYTabBarButton *selectButton;
@property(nonatomic,weak)UIButton *plusButton;

@property(nonatomic,strong)NSMutableArray *tabBarButtons;

@end

@implementation JYTabBar

-(NSMutableArray *)tabBarButtons
{
    if(_tabBarButtons==nil)
    {
        _tabBarButtons=[NSMutableArray array];
    }
    return _tabBarButtons;
}

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        //我现在是iOS7以上,所以就不加这句话了
        //self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
        
        //添加＋按钮
        UIButton *plusButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_os7"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted_os7"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_os7"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7"] forState:UIControlStateHighlighted];
        plusButton.bounds=CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        [self addSubview:plusButton];
        self.plusButton=plusButton;
    }
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    JYTabBarButton *button=[[JYTabBarButton alloc]init];
    [self addSubview:button];
    
    //2.设置数据
    button.item=item;
    
    //3.监听按钮的点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4.默认选中第0个按钮
    if(self.subviews.count==2)
    {
        [self buttonClick:button];
        button.selected=YES;
        self.selectButton=button;
    }
    
    //5.添加按钮到数组中
    [self.tabBarButtons addObject:button];

    
    
}

-(void)buttonClick:(JYTabBarButton *)button
{
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectItemFrom:to:)])
    {
        [self.delegate tabBar:self didSelectItemFrom:self.selectButton.tag to:button.tag];
    }
    
    self.selectButton.selected=NO;
    button.selected=YES;
    self.selectButton=button;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //调整加号按钮的frame
    CGFloat h=self.frame.size.height;
    CGFloat w=self.frame.size.width;
    self.plusButton.center=CGPointMake(w*0.5, h*0.5);
    
    CGFloat buttonH=h;
    CGFloat buttonW=w/self.subviews.count;
    CGFloat buttonY=0;
    

    //for (int index=0; index<self.subviews.count; index++)
    for (int index=0; index<self.tabBarButtons.count; index++)
    {
        //1.取出按钮
        JYTabBarButton *button=self.tabBarButtons[index];
        
        //2.设置按钮的frame
        CGFloat buttonX=index*buttonW;
        if(index>1)
        {
            buttonX+=buttonW;
        }
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //3.绑定tag
        button.tag=index;
    }
}
@end
