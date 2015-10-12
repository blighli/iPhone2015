//
//  ViewController.m
//  ios作业1
//
//  Created by lysongzi on 15/10/6.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//button点击事件
- (IBAction)clickButton:(UIButton *)sender {
    NSLog(@"这是点击button触发!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
