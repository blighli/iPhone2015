//
//  ViewController.m
//  plh_homework1
//
//  Created by apanoo on 15/10/8.
//  Copyright (c) 2015年 Wequeen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)buttonPress:(id)sender {
    NSString *title = [ sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.", title];
    _statusLable.text = plainText;
}


@end
