//
//  ViewController.m
//  homework-01
//
//  Created by apanoo on 15/10/7.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textShow;

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
- (IBAction)testBtn:(id)sender {
    NSLog(@"btn click!");
    [_textShow setText:@"show test after click"];
}

@end
