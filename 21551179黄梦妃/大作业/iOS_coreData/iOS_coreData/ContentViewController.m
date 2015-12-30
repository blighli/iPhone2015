//
//  ContentViewController.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "ContentViewController.h"
#import "Incident.h"
#import "NSDate+Util.h"
#import "UIColor+Util.h"

@interface ContentViewController ()
@property(strong,nonatomic)UITextView *tvContent;
@property(strong,nonatomic)UILabel *labTime;
@property(strong,nonatomic)Incident *incident;
@end

@implementation ContentViewController


- (instancetype)initWithIncident:(Incident *)incident
{
    self = [super init];
    if (self) {
        self.incident=incident;
    }
    return self;
}


-(void)initView
{
    self.labTime=[[UILabel alloc]initWithFrame:CGRectMake(0, 54, self.view.frame.size.width, 30)];
    self.labTime.textAlignment=NSTextAlignmentCenter;
    self.labTime.text=[[NSDate date] getDateString];
    [self.view addSubview:self.labTime];
    
    self.tvContent=[[UITextView alloc]initWithFrame:CGRectMake(5, 90, self.view.frame.size.width-10, self.view.frame.size.height-110)];

    self.tvContent.backgroundColor=[UIColor themeColor];

    [self.view addSubview:self.tvContent];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
    [self.tvContent becomeFirstResponder];
    
    if(self.incident)
    {
        self.labTime.text=[self.incident.time getDateString];
        self.tvContent.text=self.incident.content;
    }
    
    self.view.backgroundColor=[UIColor themeColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)save
{
    if(self.incident)
    {
        self.incident.content=self.tvContent.text;
        [self.delegate updateInCident:self.incident];
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self.delegate addInCidentWithContent:self.tvContent.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
