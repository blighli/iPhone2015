//
//  ViewController.m
//  Homework_1
//
//  Created by YunhanXu on 15/10/20.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)ChangeText:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *label;

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

- (IBAction)ChangeText:(UIButton *)sender {
    _label.text = @"After";
}
@end
