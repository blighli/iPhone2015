//
//  ViewController.m
//  A01-传智猜图
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZQuestion.h"
@interface ViewController ()

//strong  oc对象
//weak  UI控件 ，代理对象
//assign  基本类型  数值类型 BOOL 结构体  枚举
//copy 字符串


@property (weak, nonatomic) IBOutlet UILabel *countView;
@property (weak, nonatomic) IBOutlet UIButton *coinView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIButton *iconView;

@property (weak, nonatomic) IBOutlet UIView *answersView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;


//记录图片按钮的原始位置
@property (nonatomic, assign) CGRect oldFrame;

//遮盖的按钮
@property (nonatomic, weak) UIButton *coverView;

//加载plist数据 模型
@property (nonatomic, strong) NSArray *questions;
//记录当前题目的索引
@property (nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UIButton *nextView;

- (IBAction)tipClick;
- (IBAction)helpClick;
- (IBAction)bigImageClick;
- (IBAction)nextClick;

- (IBAction)iconClick;
@end

@implementation ViewController

//2 懒加载
- (NSArray *)questions
{
    if (_questions == nil) {
        _questions = [CZQuestion questionsList];
    }
    return _questions;
}

//隐藏状态栏
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index--;
    [self nextClick];
}


- (IBAction)tipClick {
}

- (IBAction)helpClick {
}

//1 点击放大图片
- (IBAction)bigImageClick {

    //记录原始的frame
    self.oldFrame = self.iconView.frame;
    
    //1.1  放大图片
    CGFloat iconW = self.view.frame.size.width;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = (self.view.frame.size.height - iconH) / 2;
    
    //1.3 生成遮盖的view （按钮）
    UIButton *coverView = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:coverView];
    
    self.coverView = coverView;
    
    coverView.frame = self.view.bounds;
    
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0;
    
    //1.4 把一个子控件置于顶层
    [self.view bringSubviewToFront:self.iconView];
    
    //1.2 动画
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
        coverView.alpha = 0.5;
    }];
    
    //1.5 点击遮盖层 缩小图片
    [coverView addTarget:self action:@selector(smallImageClick) forControlEvents:UIControlEventTouchUpInside];
}

//1.5 点击遮盖层 缩小图片
- (void)smallImageClick
{
    [UIView animateWithDuration:1.0 animations:^{
        self.iconView.frame = self.oldFrame;
        self.coverView.alpha = 0;
        
    } completion:^(BOOL finished) {
        //当动画完成之后，移除遮盖按钮
        [self.coverView removeFromSuperview];

    }];
}
//1.6 点击图片按钮。放大或缩小
- (IBAction)iconClick {
    if (self.coverView == nil) {
        [self bigImageClick];
    }else{
        [self smallImageClick];
    }
}

//5 下一题
- (IBAction)nextClick {
    self.index++;
    
    //取模型数据
    CZQuestion *question = self.questions[self.index];
    //5.1 给子控件赋值
    self.countView.text = [NSString stringWithFormat:@"%d/%lu",self.index+1,(unsigned long)self.questions.count];
    
    self.titleView.text = question.title;
    
    [self.iconView setImage:[UIImage imageNamed:question.icon] forState:UIControlStateNormal];

//    if ((self.index + 1) == self.questions.count) {
//        self.nextView.enabled = NO;
//    }
    //如果是最后一题设置按钮不可用
    self.nextView.enabled = (self.index + 1) != self.questions.count;
    
    
    //5.2 生成答案按钮
    [self addAnswerButtons:question];
    
    //5.3 生成选项按钮
}
//5.2 生成答案按钮
- (void)addAnswerButtons:(CZQuestion *)question
{
    //删除上一题的按钮
    //    for (UIButton *btn in self.answersView.subviews) {
    //        [btn removeFromSuperview];
    //    }
    
    [self.answersView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger count = question.answer.length;
    for (int i = 0; i < count; i++) {
        UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.answersView addSubview:answerBtn];
        
        
        //设置frame
        CGFloat margin = 10;
        CGFloat answerW = 35;
        CGFloat answerH = 35;
        CGFloat marginLeft = (self.answersView.frame.size.width - count*answerW - (count-1)* margin) / 2;
        
        CGFloat answerY = 0;
        CGFloat answerX = marginLeft + i * (answerW + margin);
        
        answerBtn.frame = CGRectMake(answerX, answerY, answerW, answerH);
        
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
    }
}
@end
