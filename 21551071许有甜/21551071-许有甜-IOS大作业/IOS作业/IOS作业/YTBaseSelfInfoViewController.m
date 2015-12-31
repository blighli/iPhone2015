//
//  YTBaseSelfInfoViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/27.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTBaseSelfInfoViewController.h"
#import "YTSettingItem.h"
#import "YTSettingGroup.h"
#import "UIImage+Extension.h"

@interface YTBaseSelfInfoViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField *textField;

@end

@implementation YTBaseSelfInfoViewController
- (void)loadView
{
    [super loadView];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)rightButtonClick
{

    
    if (!self.titleFeild.enabled)
    {
        self.navigationItem.rightBarButtonItem.title = @"取消";
        self.titleFeild.enabled = YES;
        self.subTitleView.editable = YES;
        [self.titleFeild becomeFirstResponder];
    }
    else
    {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        self.titleFeild.enabled = NO;
        self.subTitleView.editable = NO;
        [self.view endEditing:YES];
    }
}


- (void)viewDidLoad {
    //[super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加主题的View
    [self addTitleView];
    self.titleLabel.text = @"昵称";
    self.titleFeild.text = self.item.title;
    self.titleFeild.enabled = NO;
    
    // 添加事件的View
    [self addEventView];
    self.subTitle.text = @"我的座右铭";

    // 添加完成按钮
    [self addFinishBtn];
    self.subTitleView.text = self.item.subtitle;
    self.subTitleView.editable = NO;
}

- (void)btnClicked
{
    if([self.delegate respondsToSelector:@selector(selfInfoViewController:didSaveInfo:)])
    {
        self.item.title = self.titleFeild.text;
        self.item.subtitle = self.subTitleView.text;
        
        // 存数数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.item.title forKey:YTTITLE];
        [defaults setObject:self.item.subtitle forKey:YTSUBTITLE];
        [defaults synchronize];
        
        [self.delegate selfInfoViewController:self didSaveInfo:self.item];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
