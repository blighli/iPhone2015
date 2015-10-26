//
//  ViewController.m
//  homework01
//
//  Created by greeting on 10/13/15.
//  Copyright © 2015 greeting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _showLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonFirst:(id)sender {
    _showLabel.text = @"First";
}

- (IBAction)buttonSecond:(id)sender {
    _showLabel.text = @"Second";
}
@end
