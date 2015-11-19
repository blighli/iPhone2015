//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by lichaolin on 15/10/7.
//  Copyright © 2015年 lichaolin. All rights reserved.
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
  
  _textLabel.text = @"李超林第一次作业。。。";
  
}


@end
