//
//  ViewController.m
//  MyCrazyGuessImage
//
//  Created by zhuzhu on 15/11/25.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import "ViewController.h"
#import "QuestionInfo.h"

CGFloat const imgW = 150;
CGFloat const kBtnW = 35;
CGFloat const kBtnH = 35;
CGFloat const kMarginBetweenBtns = 10;
NSInteger const kOptionViewTotalCol = 7;

NSInteger const kTrueAddScore = 200;
//NSInteger const kFalseDecreaseScore = -200;
NSInteger const kTipDecreaseScore = -50;
@interface ViewController ()



//顶部表示图片的张数以及当前图片是第几张
@property (weak, nonatomic) IBOutlet UILabel *topIndexLabel;

//描述图片信息
@property (weak, nonatomic) IBOutlet UILabel *descLabel;

//显示当前分数
@property (weak, nonatomic) IBOutlet UIButton *coinButton;

//显示中间图片
@property (weak, nonatomic) IBOutlet UIButton *imgInsideButton;

//显示答案的视图
@property (weak, nonatomic) IBOutlet UIView *answerView;

//答题信息选择视图
@property (weak, nonatomic) IBOutlet UIView *optionView;

//一个模型数组用于存放问题
@property (nonatomic,strong) NSArray *questions;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

//记录图片索引
@property (nonatomic,assign) int index;

//遮盖按钮
@property (nonatomic,strong) UIButton *cover;
@property (weak, nonatomic) IBOutlet UIButton *tipButton;

@end

@implementation ViewController
- (NSArray *)questions
{
    if (nil == _questions) {
        _questions = [QuestionInfo questions];
    }
    return _questions;
}
- (IBAction)backToChoose {
    [self performSegueWithIdentifier:@"backToChoose" sender:nil];
    
}

-(UIButton *)cover
{
    if (nil == _cover) {
        _cover = [[UIButton alloc] init];
        _cover.frame = self.view.bounds;
        _cover.alpha = 0.0;
        _cover.backgroundColor = [UIColor blackColor];
        [_cover addTarget:self action:@selector(imgBtnChangeOnclick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_cover];
    }
    return _cover;
}

//提示按钮的点击事件
- (IBAction)TipButtonOnclick {
    
    //确保在猜一道题的时候不能重复提示；
    self.tipButton.enabled = false;
    //获得当前的分数
    NSInteger currentCoin = [self.coinButton.currentTitle integerValue];
    if(currentCoin >= 50){
        //清空答案按钮中的文字
        for (UIButton *answerButton in self.answerView.subviews) {
            [self answerBtnOnClick:answerButton];
        }
        
        //取出答案中的第一个字
        NSString *answer = [self.questions[self.index] answer];
        NSString *firstWord = [answer substringToIndex:1];
        for (UIButton *optionButton in self.optionView.subviews) {
            if ([optionButton.currentTitle isEqualToString:firstWord]) {
                [self optionBtnOnClick:optionButton];
                
                [self coinChange:kTipDecreaseScore];
                break;
            }
        }
        
    }else{
        //弹出提示框，提示当前分数不足，没有资格进行提示
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"对不起，你当前没有提示机会！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];

    }
}

//重玩本关按钮的点击事件
- (IBAction)backToFirst {
    //self.index = -1;
    //重置新成绩为0
    NSString *coinStr = [NSString stringWithFormat:@"%d",0];
    [self.coinButton setTitle:coinStr forState:UIControlStateDisabled];
    
    self.index = self.flag * 10 - 1;
    [self NextButtonOclick];
}

//图片的点击事件，大图遮盖
- (IBAction)imgBtnChangeOnclick {
    [self.view bringSubviewToFront:self.imgInsideButton];
    if (0 == self.cover.alpha) {
        CGFloat scaleX = [UIScreen mainScreen].bounds.size.width/imgW;
        CGFloat scaleY = scaleX;
        CGFloat translateY = self.imgInsideButton.frame.origin.y/scaleX;
        [UIView animateWithDuration:1.0 animations:^{
            self.imgInsideButton.transform = CGAffineTransformMakeScale(scaleX,scaleY);
            self.imgInsideButton.transform = CGAffineTransformTranslate(self.imgInsideButton.transform, 0, translateY);
            self.cover.alpha = 0.5;
        }];
        
    }else
    {
        [UIView animateWithDuration:1.0 animations:^{
            self.imgInsideButton.transform = CGAffineTransformIdentity;
            self.cover.alpha=0.0;
        }];
    }
}

//下一题按钮点击事件
- (IBAction)NextButtonOclick {
    
    //获得当前的分数
    NSInteger currentCoin = [self.coinButton.currentTitle integerValue];
    
    //确保在当前情况下提示按钮可用
    self.tipButton.enabled = true;
    
    //1.索引自增，并判断是否越界
    self.index++;
    
    //if (self.index >= self.questions.count && currentCoin >= 1800) {
    if (self.index >= ((self.flag+1) * 10) && currentCoin >= 1800) {
        //弹出提示框，提示本关完成
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"恭喜您！您已完成本关！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
        //[alter release];
        self.index--;
        self.nextButton.enabled = false;
        self.tipButton.enabled = false;
        return;
    //}else if (self.index >= self.questions.count && currentCoin < 1800){
        }else if (self.index == ((self.flag+1) * 10) && currentCoin < 1800){
        //弹出提示框，提示本关未通过
        UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"Title" message:@"对不起，您未达到通关要求，请重玩本关！" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alter show];
        self.nextButton.enabled = false;
        self.tipButton.enabled = false;
        return;
    }
    
    //2.取出数据模型
    QuestionInfo *question = self.questions[self.index];
    
    //3.设计基本信息
    [self setupBaseInfo:question];
    
    //4.创建答案按钮
    [self createAnswerBtns:question];
    
    //5.创建备选答案按钮
    [self createOptionBtns:question];
}

/*
 设置基本信息
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.index = -1;
    //NSLog(@"%d",self.flag);
    self.index = self.flag * 10 - 1;
    [self NextButtonOclick];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupBaseInfo:(QuestionInfo *) question
{
    
    // 恢复optionView的用户交互
    self.optionView.userInteractionEnabled = YES;
    
    //改变顶部当前图片的顺序数字
    self.topIndexLabel.text = [NSString stringWithFormat:@"%d/%d",self.index % 10 + 1,10];
    
    //图片描述
    self.descLabel.text = question.title;
    
    //图片设置
    [self.imgInsideButton setImage:question.image forState:UIControlStateNormal];
    
    // 下一题按钮状态判断改变
    //self.nextButton.enabled = (self.index != self.questions.count - 1);
    self.nextButton.enabled = (self.index != self.flag *10 - 1);
}
-(void)createAnswerBtns:(QuestionInfo *)question
{
    // 4.1 清空answerView
    for (UIButton *btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    
    // 4.2 获取答案按钮的数量
    NSInteger answerBtnCount = question.answer.length;
    
    CGFloat answerW = self.answerView.bounds.size.width;
    CGFloat answerEdgeInset = (answerW - answerBtnCount * kBtnW - (answerBtnCount - 1) * kMarginBetweenBtns) * 0.5;
    for (int i = 0; i < answerBtnCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        CGFloat btnX = answerEdgeInset + i * (kBtnW + kMarginBetweenBtns);
        btn.frame = CGRectMake(btnX, 0, kBtnW, kBtnH);
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(answerBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.answerView addSubview:btn];
        
    }
   
}
-(void)createOptionBtns:(QuestionInfo *)question
{
    if (self.optionView.subviews.count != question.options.count) {
        CGFloat optionW = self.optionView.bounds.size.width;
        CGFloat optionEdgeInset = (optionW - kOptionViewTotalCol * kBtnW - (kOptionViewTotalCol - 1) * kMarginBetweenBtns) * 0.5;
        for (int i = 0; i < question.options.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            int col = i % kOptionViewTotalCol;
            int row = i / kOptionViewTotalCol;
            
            CGFloat btnX = optionEdgeInset + (kBtnW + kMarginBetweenBtns) * col;
            CGFloat btnY = kMarginBetweenBtns + (kBtnH + kMarginBetweenBtns) * row;
            btn.frame = CGRectMake(btnX, btnY, kBtnW, kBtnH);
            
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [btn addTarget:self action:@selector(optionBtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.optionView addSubview:btn];
        }

    }
    for (int i = 0; i<question.options.count; i++) {
        UIButton *optionButton = self.optionView.subviews[i];
        [optionButton setTitle:question.options[i] forState:(UIControlStateNormal)];
        optionButton.hidden = NO;
    }
}
//答案按钮点击方法
- (void)answerBtnOnClick:(UIButton *)answerBtn
{
    NSString *answerStr = answerBtn.currentTitle;
    
    // 若按钮为空,直接返回
    if (nil == answerStr) {
        return;
    }
    
    // 若不为空
    // 1.去掉按钮内的字
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    
    // 2.恢复optionView中隐藏的按钮
    for (UIButton *optionBtn in self.optionView.subviews) {
        if ([answerStr isEqualToString:optionBtn.currentTitle] && optionBtn.isHidden) {
            optionBtn.hidden = NO;
            break;
        }
    }
    
    // 3.若字体颜色不对,则统统恢复黑色
    if (answerBtn.currentTitleColor != [UIColor blackColor]) {
        for (UIButton *answerBtn in self.answerView.subviews) {
            [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        
        // 恢复optionView的用户交互
        self.optionView.userInteractionEnabled = YES;
    }
    
}

//备选答案按钮点击方法
- (void)optionBtnOnClick:(UIButton *)optionBtn
{
    
    //获取备选答案按按钮中的内容
    NSString *optionStr = optionBtn.currentTitle;
    
    // 1.填选中的字进answerView
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (nil == answerBtn.currentTitle) {
            [answerBtn setTitle:optionStr forState:UIControlStateNormal];
            break;
        }
    }
    
    // 2.隐藏按钮
    optionBtn.hidden = YES;
    
    // 3.当answerView中字满的时候
    BOOL isFull = YES;
    
    NSMutableString *strM = [NSMutableString string];
    for (UIButton *answerBtn in self.answerView.subviews) {
        if (nil == answerBtn.currentTitle) {
            isFull = NO;
            break;
        }
        else
        {
            
            //将答案区按钮中字拼成一个字符串，
            [strM appendString:answerBtn.currentTitle];
        }
    }
    
    if (YES == isFull) {
        self.optionView.userInteractionEnabled = NO;
        
        NSString *answer = [self.questions[self.index] answer];
        if ([strM isEqualToString:answer]) {
            for (UIButton *answerBtn in self.answerView.subviews) {
                
                //相同 全部字体变蓝，加分，1秒后自动进入下一题
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            
            [self coinChange:kTrueAddScore];
            
            //延迟一秒跳到下一题
            [self performSelector:@selector(NextButtonOclick) withObject:nil afterDelay:1.0];
        }else
        {
            
            //与答案比较，不同 全部字体变红
            for (UIButton *answerBtn in self.answerView.subviews) {
                [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                
            }
        }
    }
}

//分数变化
-(void)coinChange:(NSInteger)delCoin
{
    
    //获得当前的分数
    NSInteger currentCoin = [self.coinButton.currentTitle integerValue];
    
    //计算新的分
    currentCoin +=delCoin;
    
    //重置新成绩
    NSString *coinStr = [NSString stringWithFormat:@"%d",currentCoin];
    [self.coinButton setTitle:coinStr forState:UIControlStateDisabled];
    
    
}

@end
