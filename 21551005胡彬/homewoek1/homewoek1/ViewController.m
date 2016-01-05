//
//  ViewController.m
//  homewoek1
//
//  Created by cstlab on 15/12/29.
//  Copyright © 2015年 hubin. All rights reserved.
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

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    NSString *plaintext=[NSString stringWithFormat:@"%@ button pressed",title];
    _statusLabel.text=plaintext;
}


@end
