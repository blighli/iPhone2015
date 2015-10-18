//
//  ViewController.m
//  Myfirsthomework
//
//  Created by zhengxiang on 15/10/10.
//  Copyright © 2015年 Big Nerd Banch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)b:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *text;

@property (weak, nonatomic) IBOutlet UIButton *button1;
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

- (IBAction)b:(id)sender {

   [self.text setText:@"button2"];
    
}
@end
