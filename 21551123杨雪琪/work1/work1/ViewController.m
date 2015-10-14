//
//  ViewController.m
//  work1
//
//  Created by yxq on 15/10/14.
//  Copyright © 2015年 yxq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1:(UIButton *)sender {
    self.oneLabel.text = @"Come On!";
    NSLog(@"加油！");
}
@end
