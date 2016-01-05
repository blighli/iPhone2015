//
//  MyNavController.m
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "MyNavController.h"

@implementation MyNavController
+(void)initialize{
    UINavigationBar *bar=[UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"]forBarMetrics:UIBarMetricsDefault];
}

@end
