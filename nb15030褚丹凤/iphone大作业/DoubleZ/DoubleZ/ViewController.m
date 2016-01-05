//
//  ViewController.m
//  DoubleZ
//
//  Created by cdf on 15/12/29.
//  Copyright © 2015年 cdf. All rights reserved.
//

#import "ViewController.h"
#import "ZZQuestionInfo.h"

#define imgW self.imgInsideBtn.bounds.size.width
#define kScreenW  [UIScreen mainScreen].bounds.size.width
#define kAnswerBtnTitleColor [UIColor blackColor]
//常量
CGFloat const kBtnW = 35;
CGFloat const kBtnH = 35;
CGFloat const kMarginBetweenBtns = 10;
NSInteger const kOptionViewTotalCol = 7;

NSInteger const kTrueAddScore = 200;
NSInteger const kFalseDecreaseScore = -200;
NSInteger const kTipDecreaseScore = -200;

@interface ViewController ()

//顶部索引
@property (weak, nonatomic) IBOutlet UILabel *topIndexLabel;

//图片类型描述
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//得分
@property (weak, nonatomic) IBOutlet UIButton *coinBtn;

//显示中间图片的按钮
@property (weak, nonatomic) IBOutlet UIButton *imgInsideBtn;

@property (weak, nonatomic) IBOutlet UIButton *lastBtn;

//下一题按钮
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

//显示答案按钮的视图
@property (weak, nonatomic) IBOutlet UIView *answerView;

//显示备选答案按钮的视图
@property (weak, nonatomic) IBOutlet UIView *optionsView;

//模型数组
@property (nonatomic, strong) NSArray *questions;

//记录索引
@property (nonatomic, assign) int index;

//遮盖按钮
@property (nonatomic, strong) UIButton *cover;

//通关计数
@property (nonatomic,assign) int count;

@end

@implementation ViewController

//懒加载  @return模型数组

- (NSArray *)questions
{
   
    if (nil == _questions) {
        _questions = [ZZQuestionInfo questions];
    }
    return _questions;
}

//懒加载  @return遮盖
- (UIButton *)cover
{
    if (nil == _cover) {
        _cover = [[UIButton alloc] init];
        _cover.frame = self.view.bounds;
        _cover.alpha = 0.0;
        _cover.backgroundColor = [UIColor blackColor];
        [_cover addTarget:self action:@selector(imgBtnChangeOnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_cover];
    }
    return _cover;
}


//提示按钮点击事件
- (IBAction)TipBtnOnClick {
    //1.清空答案按钮内的文字
    for (UIButton *answerBtn in self.answerView.subviews) {
        [self answerBtnOnClick:answerBtn];
    }
    
    //2.取出答案中的第一个字
    NSString *answer = [self.questions[self.index] answer];
    NSString *firstWord = [answer substringToIndex:1];
    
    //3.模拟点击optionView中第一个正确的按钮  扣分
    for (UIButton *optionBtn in self.optionsView.subviews) {
        if ([optionBtn.currentTitle isEqualToString:firstWord]) {
            [self optionBtnOnClick:optionBtn];
            [self coinChange:kTipDecreaseScore];
            break;
        }
    }
    
}

//上一题按钮的点击事件
- (IBAction)lastBtnOnClick {
    //1.索引自增，并判断是否越界
    self.index --;
    
    NSLog(@"index == %d",self.index);
    
    //2.取出模型
    ZZQuestionInfo *question = self.questions[self.index];
    
    //3.设计基本信息（参考图片浏览器）
    [self setupBaseInfo:question];
    
    //4.创建答案按钮
    [self createAnswerBtns:question];
    
    //5.创建备选答案按钮
    [self createOptionBtns:question];
    

}

//大图／遮盖／中间  3个按钮的点击事件
- (IBAction)imgBtnChangeOnClick {
    //将图片放置在最顶层
    [self.view bringSubviewToFront:self.imgInsideBtn];
    if (0 == self.cover.alpha) {
        //图片放大事件
        CGFloat scaleX = kScreenW / imgW;
        CGFloat scaleY = scaleX;
        
        CGFloat translateY = self.imgInsideBtn.frame.origin.y / scaleX;
        
        [UIView animateWithDuration:1.0 animations:^{
            self.imgInsideBtn.transform = CGAffineTransformMakeScale(scaleX, scaleY);
            self.imgInsideBtn.transform = CGAffineTransformTranslate(self.imgInsideBtn.transform, 0, translateY);
            //遮盖显现
            self.cover.alpha = 0.5;
        }];
        
    }else
    {
        //图片还原事件
        [UIView animateWithDuration:1.0 animations:^{
            self.imgInsideBtn.transform = CGAffineTransformIdentity;
            self.cover.alpha = 0.0;
        }];
    }
}

//下一题点击事件
- (IBAction)nextBtnOnClick {
    //1.索引自增，并判断是否越界
    self.index ++;
    
    NSLog(@"index == %d",self.index);
    
    //2.取出模型
    ZZQuestionInfo *question = self.questions[self.index];
    
    //3.设计基本信息（参考图片浏览器）
    [self setupBaseInfo:question];
    
    //4.创建答案按钮
    [self createAnswerBtns:question];
    
    //5.创建备选答案按钮
    [self createOptionBtns:question];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index = -1;
    [self nextBtnOnClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 私有方法
//设置基本信息

- (void)setupBaseInfo:(ZZQuestionInfo *)question
{
    //顶部图片索引改变
    self.topIndexLabel.text = [NSString stringWithFormat:@"%d/%d",self.index + 1, self.questions.count];
    //图拼啊种类描述改变
    self.descLabel.text =question.title;
    //图片改变
    [self.imgInsideBtn setImage:question.image forState:UIControlStateNormal];
    //下一题按钮状态判断改变
    self.nextBtn.enabled = (self.index != self.questions.count - 1);
    self.lastBtn.enabled = !(self.index == 0);
}

//4.创建答题按钮
- (void)createAnswerBtns:(ZZQuestionInfo *)question
{
    //4.1清空answerView
    for (UIButton *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    //4.2获取答案按钮的数量
    NSInteger answerBtnCount = question.answer.length;

    CGFloat answerW = self.answerView.bounds.size.width;
    CGFloat answerEdgeInset = (answerW - answerBtnCount * kBtnW - (answerBtnCount - 1) * kMarginBetweenBtns) * 0.5;
    for (int i = 0; i < answerBtnCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        
        CGFloat btnX = answerEdgeInset + i * (kBtnW + kMarginBetweenBtns);
        
        btn.frame = CGRectMake(btnX, 0, kBtnW, kBtnH);
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(answerBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.answerView addSubview:btn];
    }
}

//5.创建备选答案按钮
- (void)createOptionBtns:(ZZQuestionInfo *)question
{
    int optionsCount = question.options.count;
    
    if (self.optionsView.subviews.count != optionsCount) {
        //若没有按钮，就创建按钮
        
        CGFloat optionW = self.optionsView.bounds.size.width;
        CGFloat optionEdgeInset = (optionW - kOptionViewTotalCol * kBtnW - (kOptionViewTotalCol - 1) * kMarginBetweenBtns) * 0.5;
        
        for (int i = 0; i < optionsCount; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            int col = i % kOptionViewTotalCol;
            int row = i / kOptionViewTotalCol;
            
            CGFloat btnX = optionEdgeInset + (kBtnW + kMarginBetweenBtns) * col;
            CGFloat btnY = kMarginBetweenBtns + (kBtnH + kMarginBetweenBtns) * row;
            btn.frame = CGRectMake(btnX, btnY, kBtnW, kBtnH);
            
            [btn setBackgroundColor:[UIColor clearColor]];
            [btn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(optionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.optionsView addSubview:btn];
     
        }
        
    }
    
    for (int i = 0; i < optionsCount; i++) {
        UIButton *optionBtn = self.optionsView.subviews[i];
        
        [optionBtn setTitle:question.options[i] forState:UIControlStateNormal];
        
        optionBtn.hidden = NO;
    }
}

#pragma mark - 下面按钮的点击方法

//答案按钮点击方法  @param answerBtn
- (void)answerBtnOnClick:(UIButton *)answerBtn
{
    NSString *answetStr = answerBtn.currentTitle;
    
    //若按钮为空，直接返回
    if (nil == answetStr) {
        return;
    }
    
    //若不为空
    //1.去掉按钮内的字
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    //2.恢复optionView中隐藏的按钮
    for (UIButton *optionBtn in self.optionsView.subviews) {
        if ([answetStr isEqualToString:optionBtn.currentTitle] && optionBtn.isHidden) {
            optionBtn.hidden = NO;
            break;
        }
    }
    //3.若字体颜色不对，则统统恢复黑色
    if (answerBtn.currentTitleColor != kAnswerBtnTitleColor) {
        for (UIButton *answerBtn in self.answerView.subviews) {
            [answerBtn setTitleColor:kAnswerBtnTitleColor forState:UIControlStateNormal];
        }
        
        //恢复optionView的用户交互
        self.optionsView.userInteractionEnabled = YES;
    }
}

//答案按钮点击方法  @param optionBtn
- (void)optionBtnOnClick:(UIButton *)optionBtn
{
    NSString *optionStr = optionBtn.currentTitle;
    //1.填字进answerView
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (nil == answerBtn.currentTitle) {
            [answerBtn setTitle:optionStr forState:UIControlStateNormal];
            break;
        }
    }
    
    //2.隐藏按钮
    optionBtn.hidden = YES;
    
    //3.当字满的时候
    BOOL isFull = YES;
    
    NSMutableString *strM = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews ) {
        if (nil == answerBtn.currentTitle) {
            isFull = NO;
            break;
        }
        else
        {
            //3.1将答案区按钮中字拼成一个字符串
            [strM appendString:answerBtn.currentTitle];
        }
    }
  
    if (YES == isFull) {
        self.optionsView.userInteractionEnabled = NO;
        
        NSString *answer = [self.questions[self.index] answer];
        if ([strM isEqualToString:answer]) {
            
            //如果计数和问题数相同 视为通关
            self.count = self.count + 1;
            if (self.count == self.questions.count)
            {
                UIImageView *imageView = [[UIImageView alloc] init];
                
                imageView.image = [UIImage imageNamed:@"gongxitongguan"];
                
                [self.view addSubview:imageView];
                [UIImageView animateWithDuration:2.0 animations:^{
                    imageView.frame = self.view.frame;
                }];
                return ;
            }
            for (UIButton *answerBtn in self.answerView.subviews) {
                //3.3相同  全部字体变蓝 加分 1秒后自动进入下一题
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            
            [self coinChange:kTrueAddScore];
            
            //恢复optionView的用户交互
            self.optionsView.userInteractionEnabled = YES;
            
            [self performSelector:@selector(nextBtnOnClick) withObject:nil afterDelay:1.0];
        }else{
              //3.2与答案比较，不同  全部字体变红，扣分
            for (UIButton *answerBtn in self.answerView.subviews) {
                //3.3相同  全部字体变蓝 加分 1秒后自动进入下一题
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
                [self coinChange:kFalseDecreaseScore];
                
            }
        }
    }
}

#pragma mark - 分数变化
- (void )coinChange:(NSInteger)delCoin
{
    //获取当前金钱数量
    NSInteger currentCoin = [self.coinBtn.currentTitle integerValue];
    //改变金钱数量
    currentCoin += delCoin;
    //重置金钱数量
    NSString *coinStr = [NSString stringWithFormat:@"%d", currentCoin];
    [self.coinBtn setTitle:coinStr forState:UIControlStateDisabled];

}

@end
