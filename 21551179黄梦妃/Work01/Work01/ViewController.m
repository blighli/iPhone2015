//
//  ViewController.m
//  Work01
//
//  Created by 黄梦妃 on 15/10/8.
//  Copyright © 2015年 黄梦妃. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;

@property (weak, nonatomic) IBOutlet UILabel *blueLab;
@property (weak, nonatomic) IBOutlet UILabel *greenLab;

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
- (IBAction)changeBlueLab:(UIButton *)sender {
    [self.blueLab setText:@"更改lab"];
}
- (IBAction)changeGreenLab:(UIButton *)sender {
    self.greenLab.text=@"更改lab";
}

@end
