//
//  ViewController.m
//  HelloIOS
//
//  Created by 5hen on 15/10/13.
//  Copyright (c) 2015年 5hen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    printf("hello ios");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *str =[sender titleForState:UIControlStateNormal];
    NSString *str1=[NSString stringWithFormat:@"%@ button pressed.",str];
    _statusLabel.text=str1;
}
@end
