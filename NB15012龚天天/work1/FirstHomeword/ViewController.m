//
//  ViewController.m
//  FirstHomeword
//
//  Created by 天天 龚 on 15/10/14.
//  Copyright © 2015年 天天 龚. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ button pressed.",title];
    _statusLabel.text = plainText;
}
@end
