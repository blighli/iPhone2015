//
//  JYUINavigationController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/19.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYUINavigationController.h"

@interface JYUINavigationController ()

@end

@implementation JYUINavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

//一个类只会调用一次
+(void)initialize
{
   //1.设置导航栏的主题
    [self setupNavBarTheme];
    
    //2.设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}
//重写pushViewCotroller方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.viewControllers.count>0)
    {
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:YES];
}


//设置导航栏的主题
+(void)setupNavBarTheme
{
    //取出appearance对象
    UINavigationBar *navBar=[UINavigationBar appearance];
    
    //    //设置背景
    //    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题属性
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor]=[UIColor blueColor];
    textAttrs[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont]=[UIFont boldSystemFontOfSize:18];
    [navBar setTitleTextAttributes:textAttrs];
}

//设置导航栏按钮主题
+(void)setupBarButtonItemTheme
{
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //设置背景
//    [item setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    
//    [item setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    //设置文字的属性
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor]=[UIColor orangeColor];
    textAttrs[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
    textAttrs[UITextAttributeFont]=[UIFont boldSystemFontOfSize:14];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}

@end
