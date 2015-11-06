//
//  ViewController.m
//  MyTaskList
//
//  Created by ywh on 15/11/2.
//  Copyright © 2015年 ywh. All rights reserved.
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

- (void)loadView
{
    CGRect frame = [[UIScreen mainScreen]bounds];
    //UIView *view = [[UIView alloc]initWithFrame:frame];
    UIWindow* window = [[UIWindow alloc]initWithFrame:frame];
    [self setView:window];
}

@end
