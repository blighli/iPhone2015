//
//  ViewController.m
//  顾金跃测试autolayout
//
//  Created by 123 on 15/10/6.
//  Copyright (c) 2015年 GJY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)click;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn setTitle:@"修改" forState:UIControlStateNormal];
    //[self.btn setTitle:@"已修改" forState:UIControlStateHighlighted];
   
    CGFloat btnY=self.btn.frame.origin.y;
    CGFloat labelY=self.label.frame.origin.y;
    CGFloat labelH=self.label.frame.size.height;
    NSLog(@"Button所在高度是%f,Label所在高度是:%f,二者之间的距离%f",btnY,labelY,btnY-labelY-labelH);
}
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click
{
    [self.label setText:@"顾金跃学习iOS!"];
    [self.btn setTitle:@"已修改" forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor redColor]];
    
}
@end
