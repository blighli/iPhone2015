//
//  YTEditViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTEditViewController.h"
#import "UIImage+Extension.h"
#import "YTMemo.h"
#import "YTMemoFrame.h"
@interface YTEditViewController ()

@end

@implementation YTEditViewController

- (void)loadView
{
    [super loadView];
    self.navigationItem.title = @"编辑Memo";
    self.navigationItem.leftBarButtonItem.title = @"返回";
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
    [super viewDidLoad];

    self.titleFeild.enabled = NO;
    self.titleFeild.text = self.memoFrame.memo.title;

    self.subTitleView.editable = NO;
    self.subTitleView.text = self.memoFrame.memo.substitle;
    
    self.timeLabel.text = self.memoFrame.memo.time;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)btnClicked
{
    if([self.delegate respondsToSelector:@selector(editViewController:didSaveInfo:)])
    {
        //YTMemoFrame
        self.memoFrame.memo.title = self.titleFeild.text;
        self.memoFrame.memo.substitle = self.subTitleView.text;
        self.memoFrame.memo.time = self.timeLabel.text;
        [self.delegate editViewController:self didSaveInfo:self.memoFrame];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
