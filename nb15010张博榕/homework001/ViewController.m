//
//  ViewController.m
//  Homework001
//
//  Created by Bor on 15/10/8.
//  Copyright © 2015年 Apres. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *HelloLabel;

@end

@implementation ViewController

- (IBAction)OnclickEvent:(UIButton *)sender {
    NSString *buttonTitle = sender.titleLabel.text;
    _HelloLabel.text = buttonTitle;
}


@end
