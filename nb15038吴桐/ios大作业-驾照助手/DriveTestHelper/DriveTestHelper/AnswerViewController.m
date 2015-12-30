//
//  AnswerViewController.m
//  DriveTestHelper
//
//  Created by wp on 15/12/17.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "AnswerViewController.h"
#import "AnswerScrollView.h"
#import "DataManager.h"
#import "AnswerModel.h"
#import "SelectPatternView.h"
#import "QuestionSheetsView.h"
#import "QuestionCollectionManager.h"

@interface AnswerViewController ()<QuestionSheetsViewDelegate>
{
    AnswerScrollView *_asView;
    SelectPatternView *_patternView;
    QuestionSheetsView *_qsView;
    NSTimer *_timer;
    UILabel *_timeLabel;
    int _quesAllNum;
    int _time;
}
@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=_viewTitle;
    
    //[self createPatternView];
    
    [self gainData];
    _time=3600;
    
    [self.view addSubview:_asView];
    [self createQuestionSheetView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateQuesNumWithNotification:) name:@"NewQuesNum" object:nil];
    
}
-(void)gainData{
    if (_type==1) {//章节
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];//所有题目
        for (int i=0; i<[arr count]; i++) {
            AnswerModel *model=arr[i];
            if ([model.pid intValue]==_chapterNumber) {
                [bufferArr addObject:model];//取得制定章节的题目
            }
        }
        _quesAllNum=(int)[bufferArr count];
        _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:bufferArr];
    } else if (_type==2) {//顺序
        NSArray *arr=[DataManager getData:answer];
        _quesAllNum=(int)[arr count];
        _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:arr];
    } else if (_type==3){//随机
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];//所有题目
        NSMutableArray *dataArr=[[NSMutableArray alloc]init];
        [bufferArr addObjectsFromArray:arr];
        for (int i=0; i<[bufferArr count];) {
            int index=arc4random()%[bufferArr count];
            [dataArr addObject:[bufferArr objectAtIndex:index]];
            [bufferArr removeObjectAtIndex:index];
        }
        _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:dataArr];
        _quesAllNum=(int)[arr count];
    } else if (_type==4) {//专项
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];
        for (int i=0; i<[arr count]; i++) {
            AnswerModel *model=arr[i];
            if ([model.sid isEqualToString:_subStrNumber]) {
                [bufferArr addObject:model];
            }
        }
        _quesAllNum=(int)[bufferArr count];
        _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:bufferArr];
        
    } else if (_type==5) {//全真模拟
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];//所有题目
        NSMutableArray *dataArr=[[NSMutableArray alloc]init];
        [bufferArr addObjectsFromArray:arr];
        for (int i=0; i<100;i++) {
            int index=arc4random()%[bufferArr count];
            [dataArr addObject:[bufferArr objectAtIndex:index]];
            [bufferArr removeObjectAtIndex:index];
        }
        _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:bufferArr];
        _quesAllNum=100;
        
        [self createNavBtn];
    } else if (_type==6) {//我的错题
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];//所有题目
        NSArray *wrongArr=[QuestionCollectionManager getWrongQuestionId];//错题记录
        for (AnswerModel *model in arr) {
            for (NSString *wrongId in wrongArr) {
                if ([model.mid isEqualToString:wrongId]) {
                    [bufferArr addObject:model];
                }
            }
        }
        if ([bufferArr count]!=0) {
            _quesAllNum=(int)[bufferArr count];
            _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:bufferArr];
        } else {
            NSLog(@"空");
        }
        
    } else if (_type==7) {//我的收藏
        NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
        NSArray *arr=[DataManager getData:answer];//所有题目
        NSArray *collectionArr=[QuestionCollectionManager getCollectionQuestionId];//收藏记录
        for (AnswerModel *model in arr) {
            for (NSString *collectionId in collectionArr) {
                if ([model.mid isEqualToString:collectionId]) {
                    [bufferArr addObject:model];
                }
            }
        }
        if ([bufferArr count]!=0) {
            _quesAllNum=(int)[bufferArr count];
            _asView=[[AnswerScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-124) withDataArray:bufferArr];
        } else {
            NSLog(@"空");
        }
    }
    if (_type==5) {
        [self createTestToolBar];
        //创建定时器
        _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTime) userInfo:nil repeats:YES];
        _timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
        _timeLabel.text=@"60:00";
        _timeLabel.textAlignment=NSTextAlignmentCenter;
        _timeLabel.tintColor=[UIColor whiteColor];
        self.navigationItem.titleView=_timeLabel;
    } else if (_type==7) {
        [self createCollectionToolBar];
    } else {
        [self createToolBar];
    }
    
    
    
}
-(void)runTime{
    _time--;
    _timeLabel.text=[NSString stringWithFormat:@"%d:%d",_time/60,_time%60];
    if (_time<=0) {
        int score=0;
        NSArray *myAnswerArr=_asView.answeredArr;
        NSArray *rightAnswerArr=_asView.dataArr;
        NSString *myAnswerStr;
        for (int i=0; i<[myAnswerArr count]; i++) {
            AnswerModel *model=rightAnswerArr[i];
            NSString *rightAnswerStr=model.mAnswer;
            if ([myAnswerArr[i] intValue]>=1 && [myAnswerArr[i] intValue]<=4) {
                myAnswerStr=[NSString stringWithFormat:@"%c",'A'-1+[myAnswerArr[i] intValue]];
            } else {
                myAnswerStr=myAnswerArr[i];
            }
            if ([rightAnswerStr isEqualToString:myAnswerStr]) {
                //答对加分
                score++;
            }
            
        }
        [QuestionCollectionManager setMyScore:score];
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                       message:@"时间到，请立即交卷"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"是的"
                                                                style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                                                    [self.navigationController popViewControllerAnimated:YES];
                                                                }];
        [alert addAction:confirmAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}
-(void)createNavBtn{
    UIBarButtonItem *itemL=[[UIBarButtonItem alloc]init];
    [itemL setTitle:@"返回"];
    [itemL setTarget:self];
    [itemL setAction:@selector(tapNavBtnReturn)];
    self.navigationItem.leftBarButtonItem=itemL;
    
    UIBarButtonItem *itemR=[[UIBarButtonItem alloc]init];
    [itemR setTitle:@"交卷"];
    [itemR setTarget:self];
    [itemR setAction:@selector(tapNavBtnFinish)];
    self.navigationItem.rightBarButtonItem=itemR;
    
}
-(void)tapNavBtnFinish{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                   message:@"确认立即交卷？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不，谢谢"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"是的，我要交卷"
                                                            style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                                                //交卷逻辑
                                                                int score=0;
                                                                NSArray *myAnswerArr=_asView.answeredArr;
                                                                NSArray *rightAnswerArr=_asView.dataArr;
                                                                NSString *myAnswerStr;
                                                                for (int i=0; i<[myAnswerArr count]; i++) {
                                                                    AnswerModel *model=rightAnswerArr[i];
                                                                    NSString *rightAnswerStr=model.mAnswer;
                                                                    if ([myAnswerArr[i] intValue]>=1 && [myAnswerArr[i] intValue]<=4) {
                                                                        myAnswerStr=[NSString stringWithFormat:@"%c",'A'-1+[myAnswerArr[i] intValue]];
                                                                    } else {
                                                                        myAnswerStr=myAnswerArr[i];
                                                                    }
                                                                    if ([rightAnswerStr isEqualToString:myAnswerStr]) {
                                                                        //答对加分
                                                                        score++;
                                                                    }
                                                                    
                                                                }
                                                                [QuestionCollectionManager setMyScore:score];
                                                                [self.navigationController popViewControllerAnimated:YES];
                                                            }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)tapNavBtnReturn{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"温馨提示"
                                                                   message:@"确认直接结束考试？"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"不，我还没交卷"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"是的，我要离开"
                                                            style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                                                                [self.navigationController popViewControllerAnimated:YES];
                                                            }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)createToolBar{
    UIView *barView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-129, self.view.frame.size.width, 65)];
    barView.backgroundColor=[UIColor whiteColor];
    NSString *quesNumStr=[NSString stringWithFormat:@"%d",_quesAllNum];
    NSArray *arr=@[quesNumStr,@"查看答案",@"收藏本题"];
    for (int i=0;i<3;i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(self.view.frame.size.width/3*i+self.view.frame.size.width/6-22,5 , 36, 36);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+16]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",i+16]] forState:UIControlStateHighlighted];//高亮
        [btn setTag:301+i];
        [btn addTarget:self action:@selector(tapToolBarBtn:) forControlEvents:UIControlEventTouchUpInside];//绑定操作
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-30, 45, 60, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:14];
        [barView addSubview:btn];
        [barView addSubview:label];
        
    }
    [self.view addSubview:barView];
}
-(void)createTestToolBar{
    UIView *barView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-129, self.view.frame.size.width, 65)];
    barView.backgroundColor=[UIColor whiteColor];
    NSString *quesNumStr=[NSString stringWithFormat:@"%d",_quesAllNum];
    NSArray *arr=@[quesNumStr,@"收藏本题"];
    for (int i=0;i<2;i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(self.view.frame.size.width/2*i+self.view.frame.size.width/4-22,5 , 36, 36);
        if (i==1) {
            [btn setBackgroundImage:[UIImage imageNamed:@"18.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"18-2.png"] forState:UIControlStateHighlighted];//高亮
            [btn setTag:303];
        } else {
            [btn setBackgroundImage:[UIImage imageNamed:@"16.png"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"16-2.png"] forState:UIControlStateHighlighted];//高亮
            [btn setTag:301];
        }
        [btn addTarget:self action:@selector(tapToolBarBtn:) forControlEvents:UIControlEventTouchUpInside];//绑定操作
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-30, 45, 60, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:14];
        [barView addSubview:btn];
        [barView addSubview:label];
        
    }
    [self.view addSubview:barView];
}
-(void)createCollectionToolBar{
    UIView *barView=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-129, self.view.frame.size.width, 65)];
    barView.backgroundColor=[UIColor whiteColor];
    NSString *quesNumStr=[NSString stringWithFormat:@"%d",_quesAllNum];
    NSArray *arr=@[quesNumStr,@"查看答案"];
    for (int i=0;i<2;i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(self.view.frame.size.width/2*i+self.view.frame.size.width/4-22,5 , 36, 36);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+16]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d-2.png",i+16]] forState:UIControlStateHighlighted];//高亮
        [btn setTag:301+i];
        [btn addTarget:self action:@selector(tapToolBarBtn:) forControlEvents:UIControlEventTouchUpInside];//绑定操作
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-30, 45, 60, 18)];
        label.textAlignment=NSTextAlignmentCenter;
        label.text=arr[i];
        label.font=[UIFont systemFontOfSize:14];
        if (i==0) {
            label.tag=9;
        }
        [barView addSubview:btn];
        [barView addSubview:label];
        
    }
    [self.view addSubview:barView];
}
-(void)createPatternView{
    _patternView =[[SelectPatternView alloc]initWithFrame:self.view.frame addTouch:^(SelectPattern pattern) {
        NSLog(@"dangqiangmoshishi:%d",pattern);
    }];
    [self.view addSubview:_patternView];
    _patternView.alpha=0;
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithTitle:@"答题模式"
                                                          style:UIBarButtonItemStylePlain
                                                         target:self
                                                         action:@selector(patternChange:)];
    self.navigationItem.rightBarButtonItem=item;
}
-(void)patternChange:(UIBarButtonItem *)item{
    [UIView animateWithDuration:0.3 animations:^{
        _patternView.alpha=1;
    }];
}
-(void)tapToolBarBtn:(UIButton *)btn{
    switch (btn.tag) {
        case 301://题目列表
        {
            [UIView animateWithDuration:0.3 animations:^{
                _qsView.frame=CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height-80);
                _qsView.bgView.alpha=0.8;
            }];
        }
            break;
        case 302://查看答案
        {
            if ([_asView.answeredArr[_asView.currentPage] intValue]!=0) {
                return;
            } else {
                AnswerModel *model=_asView.dataArr[_asView.currentPage];
                NSString *answer=model.mAnswer;
                char an = [answer characterAtIndex:0];
                [_asView.answeredArr replaceObjectAtIndex:_asView.currentPage withObject:[NSString stringWithFormat:@"%d",an-'A'+1]];
                [_asView reloadData];
            }
        }
            break;
        case 303://收藏
        {
            AnswerModel *model=_asView.dataArr[_asView.currentPage];
            [QuestionCollectionManager addCollectionQuestionId:model.mid];//取当前题目的mid
            NSLog(@"%@",[QuestionCollectionManager getCollectionQuestionId]);
        }
            break;
        default:
            break;
    }
}
-(void)createQuestionSheetView{
    _qsView=[[QuestionSheetsView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height) withSuperView:self.view andQuesCount:_quesAllNum];
    _qsView.delegate=self;
    [self.view addSubview:_qsView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)QuestionSheetsViewClick:(int)index{
    UIScrollView *scroll=_asView.scrollView;
    [scroll setContentOffset:CGPointMake((index-1)*scroll.frame.size.width, 0)];
    [scroll.delegate scrollViewDidEndDecelerating:scroll];
}
-(void)updateQuesNumWithNotification:(NSNotification *)notification{
    UILabel *lab=(UILabel *)[self.view viewWithTag:9];//tag没用
    NSString *txt=[NSString stringWithFormat:@"%@/%d",notification.object,_quesAllNum];
    lab.text=txt;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
