//
//  WelcomeViewController.m
//  DaFeiJi
//
//  Created by mac on 15-8-7.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "WelcomeViewController.h"
#import "WarViewController.h"
@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self performSelector:@selector(Welcome) withObject:nil afterDelay:0.2];
    
}


-(void)Welcome
{

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    label1.frame=CGRectMake(83, 105, 160, 80);
    [UIView commitAnimations];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender {
    
//    UIWindow *window=[[UIApplication sharedApplication].delegate window];
    WarViewController *controller=[[WarViewController alloc] init];
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    
    window.rootViewController=controller;
    
}
@end
