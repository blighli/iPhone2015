//
//  ViewController.m
//  P006SuperPuzzle-01
//
//  Created by TooWalker on 12/15/15.
//  Copyright © 2015 TooWalker. All rights reserved.
//

#import "ViewController.h"
#import "TWQuestions.h"
@interface ViewController () <UIAlertViewDelegate>
@property (assign, nonatomic) CGRect btnIconOriginalPosition;
@property (weak, nonatomic) UIButton *background;
@property (strong, nonatomic) NSArray *arrayQuestion;
@property (assign, nonatomic) int index;

@property (weak, nonatomic) IBOutlet UIButton *btnScore;
@property (weak, nonatomic) IBOutlet UILabel *lblPageInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnIcon;
@property (weak, nonatomic) IBOutlet UIButton *btnNextQuestion;
@property (weak, nonatomic) IBOutlet UIView *answerView;
@property (weak, nonatomic) IBOutlet UIView *optionsView;

- (IBAction)btnTipClick;
- (IBAction)btnBigImageClick;
- (IBAction)btnHelpClick;
- (IBAction)btnNextQuestionClick;
- (IBAction)btnIconClick;

@end

@implementation ViewController
-(NSArray *)arrayQuestion{
    if (_arrayQuestion == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            TWQuestions *model = [TWQuestions questionsWithDict:dict];
            [arrayModel addObject:model];
        }
        _arrayQuestion = arrayModel;
    }
    return _arrayQuestion;
}



-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = -1;
    [self btnNextQuestionClick];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)btnTipClick {
    [self addScore:-500];                                                       //提示一次减500
    TWQuestions *model = self.arrayQuestion[self.index];
    NSString *str = [model.answer substringToIndex:1];
    for (UIButton *btn in self.answerView.subviews) {
            [self btnAnswerClick:btn];
    }
    for (UIButton *btn in self.optionsView.subviews) {
        if ([str isEqualToString:btn.currentTitle]) {
            [self btnOptionsClick:btn];
        }
    }
    
}

- (IBAction)btnBigImageClick {
    self.btnIconOriginalPosition = self.btnIcon.frame;
    UIButton *btnBigImageBackgound = [[UIButton alloc]init];
    btnBigImageBackgound.backgroundColor = [UIColor blackColor];
    btnBigImageBackgound.alpha = 0;
    btnBigImageBackgound.frame = self.view.bounds;
    [self.view addSubview:btnBigImageBackgound];
    self.background = btnBigImageBackgound;
    [btnBigImageBackgound addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view bringSubviewToFront:self.btnIcon];
    CGFloat btnIconW = self.view.bounds.size.width - 100;
    CGFloat btnIconH = btnIconW * 567 / 390;
    CGFloat btnIconX = 50;
    CGFloat btnIconY = (self.view.bounds.size.height - btnIconH) / 2;
    [UIView animateWithDuration:0.4 animations:^{
        btnBigImageBackgound.alpha = 0.7;
        self.btnIcon.frame = CGRectMake(btnIconX, btnIconY, btnIconW, btnIconH);
    }];
}

- (IBAction)btnHelpClick {
    UIAlertView *alertViewHelp = [[UIAlertView alloc] initWithTitle:@"愿信息1103友谊地久天长🌴" message:@"For more Info @twitter.com/TooWalker" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertViewHelp show];
}



- (void)smallImage{
    [UIView animateWithDuration:0.4 animations:^{
        self.btnIcon.frame = self.btnIconOriginalPosition;
        self.background.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.background removeFromSuperview];
        }
    }];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        self.index = -1;
        [self btnNextQuestionClick];
    }
}

- (IBAction)btnNextQuestionClick {

    self.index++;
    self.optionsView.userInteractionEnabled = YES;
    if (self.index == self.arrayQuestion.count) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"💐YOU MADE IT" message:@"U'R REALLY BIG FAN OF IMIS1103.\nIT WILL JUMP TO THE FIRST Q!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    [self.optionsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    TWQuestions *model = self.arrayQuestion[self.index];
    self.lblPageInfo.text = [NSString stringWithFormat:@"%d/%ld", self.index + 1, self.arrayQuestion.count];
    self.lblTitle.text = model.title;
    [self.btnIcon setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    self.btnNextQuestion.enabled = (self.index != self.arrayQuestion.count - 1);
    
    [self makeAnswerAndOptions:model];
    
    
}



-(void)makeAnswerAndOptions:(TWQuestions *)model{
    [self.answerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat btnAnswerH = self.answerView.frame.size.height;
    CGFloat btnAnswerW = btnAnswerH;
    CGFloat btnAnswerY = 0;
    CGFloat answerMargin = 10;
    CGFloat answerViewMarginLeft = (self.answerView.frame.size.width - model.answer.length * btnAnswerW - (model.answer.length - 1) * answerMargin) / 2;
    for (int i = 0; i < model.answer.length; i++) {
        CGFloat btnAnswerX = answerViewMarginLeft + i * (btnAnswerW + answerMargin);
        UIButton *btnAnswer = [[UIButton alloc]init];
        [btnAnswer addTarget:self action:@selector(btnAnswerClick:) forControlEvents:UIControlEventTouchUpInside];
        btnAnswer.frame = CGRectMake(btnAnswerX, btnAnswerY, btnAnswerW, btnAnswerH);
        [btnAnswer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btnAnswer setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [self.answerView addSubview: btnAnswer];
    }
    
    
    
    int columns = 7;
    int rows = (int)ceil((float)model.options.count / 7);
    CGFloat btnOptionsH = btnAnswerH;
    CGFloat btnOptionsW = btnAnswerW;
    CGFloat optionsMargin = 10;
    CGFloat optionsViewMarginLeft = (self.optionsView.frame.size.width - columns * btnAnswerW - (columns - 1) * optionsMargin) / 2;
    CGFloat optionsViewMarginTop = (self.optionsView.frame.size.height - rows * btnAnswerH - (rows - 1) * optionsMargin) / 2;
    for (int i = 0; i < model.options.count; i++) {
        CGFloat btnOptionsX = optionsViewMarginLeft + (i % columns) * (optionsMargin + btnOptionsW);
        CGFloat btnOptionsY = optionsViewMarginTop + (i / columns) * (optionsMargin + 5 + btnOptionsH) - 20;
        UIButton *btnOptions = [[UIButton alloc]init];
        btnOptions.tag = i;
        [btnOptions addTarget:self action:@selector(btnOptionsClick:) forControlEvents:UIControlEventTouchUpInside];
        btnOptions.frame = CGRectMake(btnOptionsX, btnOptionsY, btnOptionsW, btnOptionsH);
        [btnOptions setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
        [btnOptions setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
        [btnOptions setTitle:model.options[i] forState:UIControlStateNormal];
        [btnOptions setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.optionsView addSubview:btnOptions];
    }
}

-(void)btnAnswerClick:(UIButton *)sender{
    self.optionsView.userInteractionEnabled = YES;
    for (UIButton *btn in self.answerView.subviews) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    [sender setTitle:nil forState:UIControlStateNormal];
    for (UIButton *btn in self.optionsView.subviews) {
        if (sender.tag == btn.tag) {
            btn.hidden = NO;
            break;
        }
    }
}

-(void)btnOptionsClick:(UIButton *)sender{
    BOOL isFull = YES;
    
    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle == nil) {
            sender.hidden = YES;
            [btn setTitle:sender.currentTitle forState:UIControlStateNormal];
            btn.tag = sender.tag;
            break;
        }
    }

    for (UIButton *btn in self.answerView.subviews) {
        if (btn.currentTitle == nil) {
            isFull = NO;
            break;
        }
    }
    
    if (isFull) {
        [self judge];
        self.optionsView.userInteractionEnabled = NO;
    }

}

- (void)judge{
    NSMutableString *probableAnswer = [[NSMutableString alloc]init];
    for (UIButton *btn in self.answerView.subviews) {
        [probableAnswer appendString:btn.currentTitle];
    }
    TWQuestions *model = self.arrayQuestion[self.index];

    if ([model.answer isEqualToString:probableAnswer]) {
        for (UIButton *btn in self.answerView.subviews) {
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
        [self performSelector:@selector(btnNextQuestionClick) withObject:nil afterDelay:1];
        [self addScore:200];                                                                        //答对了加两百
    }else{
        for (UIButton *btn in self.answerView.subviews) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}


- (IBAction)btnIconClick {
    if (self.background == nil) {
        [self btnBigImageClick];
    } else {
        [self smallImage];
    }
}

- (void)addScore: (int)score{
    NSString *strScore = self.btnScore.currentTitle;
    int result = score + strScore.intValue;
    if (result < 0) {
        UIAlertView *alertViewWarning = [[UIAlertView alloc]initWithTitle:@"警告" message:@"对不起，您没有足够的金币了!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertViewWarning show];
        return;
    }
    [self.btnScore setTitle:[NSString stringWithFormat:@"%d", result] forState:UIControlStateNormal];
}
@end






















