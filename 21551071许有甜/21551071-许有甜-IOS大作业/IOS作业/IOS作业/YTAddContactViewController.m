//
//  YTAddViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights

#import "YTAddContactViewController.h"
#import "YTContact.h"

@interface YTAddContactViewController ()


@end

@implementation YTAddContactViewController

- (void)loadView
{
    [super loadView];
    self.navigationItem.title = @"添加联系人";
    self.navigationItem.leftBarButtonItem.title = @"返回";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.nameField becomeFirstResponder];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)textChanged
{
    self.btn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

- (void)btnClicked
{
    // 关闭当前控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 通知代理
    if([self.contactDelegate respondsToSelector:@selector(addViewController:didiAddContact:)])
    {
        YTContact *contact = [[YTContact alloc]init];
        
        contact.name = self.nameField.text;
        contact.phone = self.phoneField.text;
        NSLog(@"%@----%@",contact.name,contact.phone);
        [self.contactDelegate addViewController:self didiAddContact:contact];
        
    }
}
@end
