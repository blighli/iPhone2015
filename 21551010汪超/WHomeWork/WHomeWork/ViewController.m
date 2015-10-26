//
//  ViewController.m
//  WHomeWork
//
//  Created by linbo on 15/10/17.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController


- (IBAction)press:(UIButton *)sender {
    NSString *text=[NSString stringWithFormat:@"my first homework"];
    _textview.text=text;
}
@end
