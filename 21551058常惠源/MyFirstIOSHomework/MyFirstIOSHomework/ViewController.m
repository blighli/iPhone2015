//
//  ViewController.m
//  MyFirstIOSHomework
//
//  Created by 常惠源 on 15/10/6.
//  Copyright © 2015年 常惠源. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)showAppleButton:(UIButton *)sender;

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

- (IBAction)showAppleButton:(UIButton *)sender {
    switch([sender tag]){
        case 0:
            _messageLabel.text = @"Apple";
            break;
        case 1:
            _messageLabel.text = @"Google";

            break;
    }
//    _messageLabel.text = sender.titleLabel.text;
}
@end
