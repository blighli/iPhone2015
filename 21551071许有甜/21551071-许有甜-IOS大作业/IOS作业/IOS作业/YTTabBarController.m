//
//  YTTabBarController.m
//  iOS大作业
//
//  Created by Lynn on 15/12/23.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTTabBarController.h"
#import "YTTabBar.h"


@interface YTTabBarController ()<YTTabBarDelegate>

@end

@implementation YTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.tabBar removeFromSuperview];
    
    // 添加自定义TabBar
    YTTabBar *myTabBar = [[YTTabBar alloc] init];
// 注意
    myTabBar.frame = self.tabBar.bounds;
    myTabBar.backgroundColor = [UIColor whiteColor];
    
    myTabBar.delegate = self;
    
    [self.tabBar addSubview:myTabBar];
    
    // 添加对应个数的按钮
    for (int  i = 0; i<self.viewControllers.count; i++) {
        NSString* name = [NSString stringWithFormat:@"TabBar0%d",i+1];
        NSString* selName = [NSString stringWithFormat:@"TabBarSel0%d",i+1];
        [myTabBar addTabBarButtonWithName:name selName:selName];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(YTTabBar *)tabBar didSelectButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
