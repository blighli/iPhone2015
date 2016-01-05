//
//  ZXNavigationViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXNavigationViewController.h"
#import "ZXMyInfoViewController.h"

@interface ZXNavigationViewController ()

@end

@implementation ZXNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZXMyInfoViewController *v1 = [[ZXMyInfoViewController alloc] init];
    
//    [v1 setTitle:@"个人信息"];
    
    
    self.viewControllers = @[v1];
    
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
