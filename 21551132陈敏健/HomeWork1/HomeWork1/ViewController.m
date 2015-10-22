//
//  ViewController.m
//  HomeWork1
//
//  Created by 敏少eclipse on 15/10/14.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
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

- (IBAction)TouchFirst {
    _showLabel.text=@"Touch First";
}

- (IBAction)TouchSecond {
    _showLabel.text=@"Touch Second";
}
@end
