//
//  ViewController.m
//  MyFirstApp
//
//  Created by wp on 15/10/4.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

@synthesize labelText,btn1,btn2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [btn1 setTitle:@"第一个按钮" forState:UIControlStateNormal];
    [btn2 setTitle:@"第二个按钮" forState:UIControlStateNormal];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressBtn:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    labelText.text = [title stringByAppendingString:@" 被点击了！"];
}
@end
