//
//  ViewController.m
//  ButtonFun
//
//  Created by paomer on 15/10/14.
//  Copyright (c) 2015年 zjumsexk. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed^_^.", title];
    _statusLabel.text = plainText;
}
@end
