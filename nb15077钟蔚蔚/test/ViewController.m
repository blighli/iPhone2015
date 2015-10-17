//
//  ViewController.m
//  test
//
//  Created by doubi on 15/10/14.
//  Copyright (c) 2015年 cstlab. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (IBAction)buttonPress:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *PlainText = [NSString stringWithFormat:@"%@ button press.", title];
    _statusLabel.text = PlainText;
}
@end
