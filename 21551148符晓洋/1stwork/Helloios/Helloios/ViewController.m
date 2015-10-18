//
//  ViewController.m
//  Helloios
//
//  Created by HacAdmin on 15/10/10.
//  Copyright (c) 2015年 HacAdmin. All rights reserved.
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
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText  =[NSString stringWithFormat:@"%@ pressed.",title];
    _statusLabel.text = plainText;
}
@end
