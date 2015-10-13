//
//  ViewController.m
//  iOS作业1
//
//  Created by sjaiwl on 15/10/11.
//  Copyright © 2015年 yaoran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *password;
@property (strong, nonatomic) IBOutlet UIButton *login;

@end

@implementation ViewController
- (IBAction)loginAction:(UIButton *)sender {
    NSLog(@"登录");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
