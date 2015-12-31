//
//  YTNavigationController.m
//  iOS大作业
//
//  Created by Lynn on 15/12/23.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTNavigationController.h"
#import "UIImage+Extension.h"
@interface YTNavigationController ()

@end

@implementation YTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor whiteColor];
    [navBar setBackgroundImage:[UIImage resizableImage:@"navBg"] forBarMetrics:UIBarMetricsDefault];

    // 设置标题文字颜色
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attrs];
    
    // 设置BarButtonItem的主题
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 设置文字颜色
    NSMutableDictionary *itemAttrs = [NSMutableDictionary dictionary];
    itemAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    itemAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    [item setTitleTextAttributes:itemAttrs forState:UIControlStateNormal];

}

/**
 *  拦截push操作，隐藏tabBar
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController setHidesBottomBarWhenPushed:YES];
    [super pushViewController:viewController animated:YES];
}


@end
