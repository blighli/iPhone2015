//
//  ViewController.m
//  Homework01
//
//  Created by 黄炳杰 on 15/10/13.
//  Copyright © 2015年 黄炳杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label01;



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
- (IBAction)btnClick:(UIButton *)sender {
    _label01.text=@"Hello";
}
- (IBAction)btnClick02:(UIButton *)sender {
    _label01.text=@"Thank You";
}

@end
