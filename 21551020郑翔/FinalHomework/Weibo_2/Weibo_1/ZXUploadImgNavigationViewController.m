//
//  ZXUploadImgNavigationViewController.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXUploadImgNavigationViewController.h"
#import "ZXTestViewController.h"

@interface ZXUploadImgNavigationViewController ()

@end

@implementation ZXUploadImgNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZXTestViewController *vc = [[ZXTestViewController alloc] init];
//    [vc setTitle:@"TEST"];
    self.viewControllers = @[vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].r
    // Pass the selected object to the new view controller.
}
*/

@end
