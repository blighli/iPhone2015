//
//  ViewController.m
//  work1
//
//  Created by Bor on 15/10/13.
//  Copyright © 2015年 Apres. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label1; 

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
-(IBAction)buttonPressed:(UIButton *)sender{
    NSString *text = [sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@",text];
    _label1.text = plainText;
}
@end
