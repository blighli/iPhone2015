//
//  SettingViewController.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "SettingViewController.h"
#import "AppData.h"


@interface SettingViewController ()<UIAlertViewDelegate>
@property(strong,nonatomic)UIButton *btnPassword;
@end

@implementation SettingViewController


-(void)initView
{
    self.btnPassword=[[UIButton alloc]initWithFrame:CGRectMake(0, 74, self.view.frame.size.width/6, self.view.frame.size.width/6)];
    
    self.btnPassword.layer.cornerRadius=self.view.frame.size.width/12;
    self.btnPassword.backgroundColor=[UIColor orangeColor];
    self.btnPassword.titleLabel.text=@"指纹验证";
    self.btnPassword.titleLabel.textColor=[UIColor whiteColor];
    
    [self.btnPassword addTarget:self action:@selector(addSecret) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.btnPassword];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.title=@"设置";
}

-(void)addSecret
{
    
    
    if([AppData getAuthentication])
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"关闭指纹验证" message:nil delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        
        [alert show];
    }else
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"开启指纹验证" message:nil delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        
        [alert show];
    }
    
   
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        if([alertView.title isEqualToString:@"开启指纹验证"])
        {
            //开启指纹验证
            [AppData setAuthentication:YES];
        }else
        {
            //开启指纹验证
            [AppData setAuthentication:NO];
        }
    }
   
}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}



@end
