//
//  YTBaseContactViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/31.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTBaseContactViewController.h"
#import "UIImage+Extension.h"

@interface YTBaseContactViewController ()<UITextFieldDelegate>

@end

@implementation YTBaseContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.phoneField];
    
    [self addName];
    [self addPhone];
    [self addBtnF];
}

- (void)addName
{
    UIView* view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.frame = CGRectMake(50, 160, 275, 30);
    //view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view.
    UILabel* nameLabel = [[UILabel alloc]init];
    nameLabel.frame = CGRectMake(0, 0, 51, 30);
    nameLabel.text = @"姓名:";
    [view addSubview:nameLabel];
    
    self.nameField = [[UITextField alloc]init];
    
    self.nameField.frame = CGRectMake(51, 0, 224, 30);
    [view addSubview:self.nameField];
    
    // 设置输入框左边距
    CGRect frame = self.nameField.frame;
    frame.size.width = 8;
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.nameField.leftView = leftview;
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    
    self.nameField.layer.borderColor = [[UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    self.nameField.layer.borderWidth = 1;
    self.nameField.layer.cornerRadius = 10;
    self.nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nameField.returnKeyType = UIReturnKeyDone;
    self.nameField.delegate = self;
}

- (void)addPhone
{
    UIView* view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.frame = CGRectMake(50, 260, 275, 30);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view.
    UILabel* nameLabel = [[UILabel alloc]init];
    nameLabel.frame = CGRectMake(0, 0, 51, 30);
    nameLabel.text = @"号码:";
    [view addSubview:nameLabel];
    
    self.phoneField = [[UITextField alloc]init];
    
    self.phoneField.frame = CGRectMake(51, 0, 224, 30);
    [view addSubview:self.phoneField];
    
    // 设置输入框左边距
    CGRect frame = self.phoneField.frame;
    frame.size.width = 8;
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.phoneField.leftView = leftview;
    self.phoneField.leftViewMode = UITextFieldViewModeAlways;
    
    self.phoneField.layer.borderColor = [[UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    self.phoneField.layer.borderWidth = 1;
    self.phoneField.layer.cornerRadius = 10;
    self.phoneField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneField.returnKeyType = UIReturnKeyDone;
    self.phoneField.delegate = self;
    self.phoneField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)addBtnF
{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(50, 325, 275, 40);
    self.btn.layer.cornerRadius = 10;
    self.btn.enabled = NO;
    [self.btn setBackgroundImage:[UIImage resizableImage:@"navBg"] forState:UIControlStateNormal];
    [self.btn setBackgroundImage:[UIImage resizableImage:@"bg"] forState:UIControlStateHighlighted];
    [self.btn setTitle:@"完成" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
}
- (void)btnClicked
{
    
}

- (void)textChanged
{
    self.btn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameField resignFirstResponder];
    [self.phoneField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![self.nameField isExclusiveTouch] && ![self.phoneField isExclusiveTouch]) {
        [self.nameField resignFirstResponder];
        [self.phoneField resignFirstResponder];
        [self.view endEditing:YES];
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
