//
//  YTAddViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTAddViewController.h"
#import "UIImage+Extension.h"
#import "YTMemo.h"
#import "YTMemoFrame.h"
@interface YTAddViewController ()<UITextFieldDelegate,UITextViewDelegate>
//@property(nonatomic, strong) UITextField *titleFeild;
//@property(nonatomic, strong) UITextView* subTitleView;
//@property(nonatomic, strong) UILabel *timeLabel;
//@property(nonatomic, strong) UIButton* btn;
@end

@implementation YTAddViewController
- (void)loadView
{
    [super loadView];
    self.navigationItem.title = @"添加Memo";
    self.navigationItem.leftBarButtonItem.title = @"返回";
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSDate *date = [[NSDate alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"MM-dd hh:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    self.timeLabel.text = dateString;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/**
 *  点击完成按钮
 */
- (void)btnClicked
{
    if([self.delegate respondsToSelector:@selector(addViewController:didSaveInfo:)])
    {
        YTMemoFrame *memoFrame = [[YTMemoFrame alloc]init];
        YTMemo* memo = [[YTMemo alloc]init];
        memo.title = self.titleFeild.text;
        memo.substitle = self.subTitleView.text;
        memo.time = self.timeLabel.text;
        
        memoFrame.memo = memo;
        [self.delegate addViewController:self didSaveInfo:memoFrame];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    
}



@end
