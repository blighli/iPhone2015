//
//  YTAboutViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/25.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTAboutViewController.h"

@interface YTAboutViewController ()

@end

@implementation YTAboutViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(self.view.frame.size.width*0.4, self.view.frame.size.height*0.4, self.view.frame.size.width, 100);
    label.text = @"版本1.0";
    [self.view addSubview:label];
}

@end
