//
//  STLoginViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STLoginViewController.h"
#import "UIImage+Extension.h"
#import "STSettingViewController.h"

@interface STLoginViewController()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)setting:(id)sender;

@end
@implementation STLoginViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *normal=[UIImage resizableImage:@"RedButton"];
    UIImage *high=[UIImage resizableImage:@"RedButtonPressed"];
    
    [self.loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:high forState:UIControlStateHighlighted];
}
- (IBAction)setting:(id)sender
{
    STSettingViewController *sttingVc=[[STSettingViewController alloc]init];
    [self.navigationController pushViewController:sttingVc animated:YES];
}

@end
