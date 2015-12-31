//
//  STNavigationController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STNavigationController.h"

@implementation STNavigationController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
}
/**
 系统在第一次使用这个类的时候调用(1个类只会调用一次)
 */
+(void)initialize
{
    //1.设置导航栏的主题
    UINavigationBar *navBar=[UINavigationBar appearance];
    
    //navBar.tintColor=[UIColor whiteColor];
    
    //设置背景
    NSString *bgName=nil;
    if([[UIDevice currentDevice].systemVersion doubleValue]>=7.0){//至少是IOS7.0
        bgName=@"NavBar64";
        navBar.tintColor=[UIColor whiteColor];
    }else{//非IOS 7
        bgName=@"NavBar";
    }
    [navBar setBackgroundImage:[UIImage imageNamed:bgName] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题文字颜色
    NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
//    attrs[NSFontAttributeName]=[UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attrs];
    
    //3.设置BarButtonItem的主题
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //设置文字颜色
    NSMutableDictionary *itemsAttrs=[NSMutableDictionary dictionary];
    itemsAttrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
    itemsAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:itemsAttrs forState:UIControlStateNormal];
    if ([[UIDevice currentDevice].systemVersion doubleValue]<7.0) {
        //设置按钮背景
        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal  barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted  barMetrics:UIBarMetricsDefault];
        
        //设置返回按钮背景
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal  barMetrics:UIBarMetricsDefault];
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted  barMetrics:UIBarMetricsDefault];
    }
    
}
/**
 重写这个方法，能拦截所有的push操作
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.hidesBottomBarWhenPushed=YES;
    [super pushViewController:viewController animated:animated];
    
}

//-(UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    return [super popViewControllerAnimated:NO];
//}
@end
