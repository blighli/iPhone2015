//
//  YTEditViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights

#import "YTEditContactViewController.h"
#import "YTContact.h"
@interface YTEditContactViewController ()
//@property (strong, nonatomic) UITextField *nameField;
//
//@property (strong, nonatomic) UITextField *phoneField;
//@property (strong, nonatomic) UIButton *saveBtn;

- (void)editBtn:(UIBarButtonItem *)sender;



@end

@implementation YTEditContactViewController
- (void)loadView
{
    [super loadView];
    self.navigationItem.title = @"编辑联系人";
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)rightButtonClick
{
    if (!self.nameField.enabled)
    {
        self.navigationItem.rightBarButtonItem.title = @"取消";
        self.nameField.enabled = YES;
        self.phoneField.enabled= YES;
        
        [self.nameField becomeFirstResponder];
    }
    else
    {
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        [self.view endEditing:YES];
    }
}
//if (!self.nameField.enabled)
//{
//    sender.title = @"取消";
//    self.nameField.enabled = YES;
//    self.phoneField.enabled = YES;
//    
//    [self.phoneField becomeFirstResponder];
//    self.btn.enabled = (self.nameField.text.length && self.phoneField.text.length);
//    self.btn.hidden = NO;
//}
//else
//{
//    sender.title = @"编辑";
//    
//    self.nameField.enabled = NO;
//    self.phoneField.enabled = NO;
//    [self.view endEditing:YES];
//    self.btn.enabled = NO;
//    self.btn.hidden = YES;
//    self.nameField.text = self.contact.name;
//    self.phoneField.text = self.contact.phone;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameField.text = self.contact.name;
    self.phoneField.text = self.contact.phone;
}


- (void)textChanged
{
    
    self.btn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

- (void)btnClicked
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if ([self.contactDelegate respondsToSelector:@selector(editViewController:didSaveContact:)]) {
        
        self.contact.name = self.nameField.text;
        self.contact.phone = self.phoneField.text;
        [self.contactDelegate editViewController:self didSaveContact:self.contact];
    }

}

- (void)editBtn:(UIBarButtonItem *)sender {

    

}
@end
