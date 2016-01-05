//
//  SXNavController.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//


#import "SXNavController.h"

@interface SXNavController ()

@end

@implementation SXNavController


+ (void)initialize
{
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:[UIColor redColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeBlack) name:@"ChangeBlack" object:nil];
    
}

//- (void)changeBlack
//{
//    [navBar setBarTintColor:[UIColor blackColor]];
//}


@end
