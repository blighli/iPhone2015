//
//  ViewController.m
//  MyFirstHomework
//
//  Created by 王国军 on 15/10/17.
//  Copyright (c) 2015年 王国军. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize labelText,btn1,btn2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [btn1 setTitle:@"按钮一" forState:UIControlStateNormal];
    [btn2 setTitle:@"按钮二" forState:UIControlStateNormal];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressBtn:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    labelText.text = [title stringByAppendingString:@" 被点击"];
}

@end
