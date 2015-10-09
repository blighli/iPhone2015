//
//  ViewController.m
//  test0
//
//  Created by 123 on 15/10/9.
//  Copyright (c) 2015年 HST. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)Click:(id)sender;

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

- (IBAction)Click:(id)sender {
    [self.text setText:@"人生已经如此无奈"];
    [self.text setTextColor:[UIColor redColor]];
    [self.btn setTitle:@"取消" forState:UIControlStateNormal];
    [self.btn setBackgroundColor:[UIColor grayColor]];
    
}
@end
