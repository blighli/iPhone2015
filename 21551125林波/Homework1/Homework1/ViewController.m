//
//  ViewController.m
//  Homework1
//
//  Created by linbo on 15/10/17.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController



- (IBAction)leftButtonPressed:(UIButton *)sender {
    NSString *title=[sender titleForState:UIControlStateNormal];
    NSString *tvText=[NSString stringWithFormat:@"%@ button pressed",title];
    _statusTextView.text=tvText;
}
@end
