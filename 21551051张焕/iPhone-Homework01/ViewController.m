//
//  ViewController.m
//  iPhone-Homework01
//
//  Created by alezai on 15/10/12.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *left_topLabel;

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

- (IBAction)buttonTaped:(UIButton *)sender {
    self.left_topLabel.text = @"点击";
}

@end
