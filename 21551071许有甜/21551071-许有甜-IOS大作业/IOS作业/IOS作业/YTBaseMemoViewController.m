//
//  YTBaseMemoViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTBaseMemoViewController.h"
#import "UIImage+Extension.h"
#import "YTMemo.h"
#import "YTMemoFrame.h"
@interface YTBaseMemoViewController ()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation YTBaseMemoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    // 添加主题的View
    [self addTitleView];

    // 添加时间的View
    [self addTimeLabel];
    
    // 添加事件的View
    [self addEventView];
    
    // 添加完成按钮
    [self addFinishBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  添加主题的View
 */
- (void)addTitleView
{
    UIView* view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.frame = CGRectMake(20, 92, 250, 30);
    [self.view addSubview:view];
    
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.frame = CGRectMake(0, 0, 51, 30);
    self.titleLabel.text = @"主题:";
    [view addSubview:self.titleLabel];
    
    self.titleFeild = [[UITextField alloc]init];
    
    self.titleFeild.frame = CGRectMake(50, 0, 153, 30);
    
    // 设置输入框左边距
    CGRect frame = self.titleFeild.frame;
    frame.size.width = 8;
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    self.titleFeild.leftView = leftview;
    self.titleFeild.leftViewMode = UITextFieldViewModeAlways;
 
    self.titleFeild.layer.borderColor = [[UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    self.titleFeild.layer.borderWidth = 1;
    self.titleFeild.layer.cornerRadius = 10;
    self.titleFeild.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.titleFeild.returnKeyType = UIReturnKeyDone;
    self.titleFeild.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextFieldTextDidChangeNotification object:self.titleFeild];
    [view addSubview:self.titleFeild];
}

/**
 *  添加时间的View
 */
- (void)addTimeLabel
{
    UIView* view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.frame = CGRectMake(20, 132, 250, 20);
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 51, 20);
    label.text = @"时间:";
    [view addSubview:label];
    
    self.timeLabel = [[UILabel alloc]init];
    self.timeLabel.frame = CGRectMake(50, 0, 193, 20);

    [view addSubview:self.timeLabel];
}


/**
 *  添加事件的View
 */
- (void)addEventView
{
    UIView* view = [[UIView alloc]init];
    view.layer.cornerRadius = 10;
    view.frame = CGRectMake(20, 165, 335, 335);
    [self.view addSubview:view];
    
    self.subTitle = [[UILabel alloc]init];
    self.subTitle.frame = CGRectMake(0, 0, 335, 25);
    self.subTitle.text = @"事件:";
    [view addSubview:self.subTitle];
    
    self.subTitleView = [[UITextView alloc]init];
    self.subTitleView.frame = CGRectMake(0, 35, 335, 300);
    self.subTitleView.font = [UIFont systemFontOfSize:18];
    self.subTitleView.layer.borderWidth = 1;
    self.subTitleView.layer.borderColor = [[UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    self.subTitleView.layer.cornerRadius = 10;
    self.subTitleView.returnKeyType = UIReturnKeyDone;
    self.subTitleView.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged) name:UITextViewTextDidChangeNotification object:self.subTitleView];
    
    [view addSubview:self.subTitleView];
}
/**
 *  添加完成按钮
 */
- (void)addFinishBtn
{
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(20, 510, 335, 50);
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
    self.btn.enabled = (self.titleFeild.text.length && self.subTitleView.text.length);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.titleFeild resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (![self.titleFeild isExclusiveTouch]) {
        [self.titleFeild resignFirstResponder];
        [self.view endEditing:YES];
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
