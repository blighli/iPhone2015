//
//  ViewController.m
//  TestOne
//
//  Created by gongzhentao on 15/10/13.
//  Copyright © 2015年 gongzhentao. All rights reserved.
//

#import "ViewController.h"



@implementation ViewController : UIViewController



- (IBAction)buttonpress:(UIButton *)sender {
    NSString* plainText = [NSString stringWithFormat:@"按了下去～"];
    _labeltext.text = plainText;
}
@end
