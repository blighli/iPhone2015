//
//  ViewController.m
//  TestOne
//
//  Created by gongzhentao on 15/10/20.
//  Copyright © 2015年 gongzhentao. All rights reserved.
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

- (IBAction)button01:(UIButton *)sender {
    NSString* title = [sender titleForState:UIControlStateNormal];
    NSString* string = [NSString stringWithFormat:@"按了下去～"];
    _label01.text = string;
}

@end
