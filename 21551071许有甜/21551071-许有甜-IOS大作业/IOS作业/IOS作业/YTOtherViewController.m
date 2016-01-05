//
//  YTOtherViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/31.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTOtherViewController.h"
#import "UIImage+Extension.h"
@interface YTOtherViewController ()

@end

@implementation YTOtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizableImage:@"bg"]];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.view.frame.size.width/2.5, self.view.frame.size.height /3, 100, 50);
    label.text = @"敬请期待";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
