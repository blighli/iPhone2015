//
//  ZXTabBarViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXTabBarViewController.h"
#import "ZXTableViewController.h"
#import "ZXNavigationViewController.h"
#import "ZXLoginNavigationViewController.h"
#import "AppDelegate.h"
#import "ZXSendWeiboViewController.h"


@interface ZXTabBarViewController ()

@end

@implementation ZXTabBarViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    if (![AppDelegate APP].user) {
        ZXLoginNavigationViewController *login = [[ZXLoginNavigationViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    ZXTableViewController *v1 = [[ZXTableViewController alloc] init];
    UIEdgeInsets edgeInsets;
    edgeInsets.bottom = self.tabBar.frame.size.height;
    v1.tableView.contentInset = edgeInsets;
//    v1.tableView.contentSize = CGSizeMake(320, 480);
//    v1.tableView.frame = CGRectMake(0, 60, 375, 100);
    ZXSendWeiboViewController *v2 = [[ZXSendWeiboViewController alloc] init];
    ZXNavigationViewController *v3 = [[ZXNavigationViewController alloc] init];
    
    [v1 setTitle:@"首页"];
    [v2 setTitle:@"发微博"];
    [v3 setTitle:@"个人信息"];
    
    self.viewControllers = @[v1, v2, v3];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
