//
//  ViewController.m
//  朱永强iOS第一次作业
//
//  Created by zhuzhu on 15/10/12.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;
- (IBAction)Btn1;
- (IBAction)Btn2:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (assign,nonatomic) int  a;
@property (assign,nonatomic) BOOL b;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)Btn1 {
    if (self.a == 0)
    {
        self.TitleLabel.text = @"点击了btn1";
        self.a = 1;
    }
    else
    {
        self.TitleLabel.text = @"显示文字";
        self.a = 0;
    }
}

- (IBAction)Btn2:(id)sender
{
    if (!self.b) {
        [self.button2 setTitle:@"改变文字" forState:UIControlStateNormal];
        self.b = !(self.b);
    }
    else
    {
        [self.button2 setTitle:@"点击改变本按钮的显示文字" forState:UIControlStateNormal];
        self.b = !(self.b);
    }
  
}




@end
