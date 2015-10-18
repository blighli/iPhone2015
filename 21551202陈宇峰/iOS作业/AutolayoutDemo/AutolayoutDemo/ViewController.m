//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by chenyufeng on 15/10/7.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;


@end

@implementation ViewController


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)buttonPressed:(id)sender {
  
  _textLabel.text = @"测试按钮点击与Autolayout";
  
}


@end
