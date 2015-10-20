//
//  ViewController.m
//  Demo1
//
//  Created by YC－MacBookPro on 15/10/5.
//  Copyright (c) 2015年 YC－MacBookPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ButtonA;
@property (weak, nonatomic) IBOutlet UIButton *ButtonB;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;


- (IBAction)ButtonClick:(id)sender;

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

- (IBAction)ButtonClick:(id)sender {
    if (sender==self.ButtonA) {
        self.textFiled.text = @"ButtonA被点击了";
    }else if (sender==self.ButtonB){
        self.textFiled.text = @"ButtonB被点击了";
    }
}
@end
