//
//  QuestionSheetsView.m
//  DriveTestHelper
//
//  Created by wp on 15/12/23.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "QuestionSheetsView.h"
#import "AnswerViewController.h"

@interface QuestionSheetsView()
{
    UIView *_superView;
    BOOL _beginMoving;
    float _height;
    float _width;
    float _originY;
    UIScrollView *_scrollQuestionView;
    int _count;
}

@end

@implementation QuestionSheetsView
-(instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView andQuesCount:(int)count{
    self=[super initWithFrame:frame];
    if (self) {
        _beginMoving=NO;
        self.backgroundColor=[UIColor whiteColor];
        _height=frame.size.height;
        _width=frame.size.width;
        _superView=superView;
        _originY=frame.origin.y;
        _count=count;
        [self createView];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateBtnListWithNotification:) name:@"NewQuesNum" object:nil];
    }
    return self;
}
-(void)createView{
    _bgView=[[UIView alloc]initWithFrame:_superView.frame];
    _bgView.backgroundColor=[UIColor blackColor];
    _bgView.alpha=0;
    [_superView addSubview:_bgView];
    
    UILabel *lab0=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 25)];
    lab0.text=@"▼";
    lab0.textAlignment=NSTextAlignmentCenter;
    lab0.tintColor=[UIColor whiteColor];
    lab0.backgroundColor=[UIColor colorWithRed:61.0f/255.0 green:160.0f/255.0 blue:236.0f/255.0 alpha:0.5];
    [self addSubview:lab0];
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 25, 100, 30)];
    lab1.text=@"题目列表";
    [self addSubview:lab1];
    
    _scrollQuestionView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, self.frame.size.width, self.frame.size.height-160)];
    [_scrollQuestionView setBackgroundColor:[UIColor colorWithRed:61.0f/255.0 green:160.0f/255.0 blue:236.0f/255.0 alpha:0.5]];
    [self addSubview:_scrollQuestionView];
    for (int i=0; i<_count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake((_width-44*6)/2+44*(i%6), 10+44*(i/6), 40, 40)];
        [btn setTintColor:[UIColor whiteColor]];
        [btn setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        if (i==0) {
            [btn setBackgroundColor:[UIColor orangeColor]];
        }
        [btn setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:8];
        [btn setTag:i+101];
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [_scrollQuestionView addSubview:btn];
    }
    int tip=(_count%6)?1:0;
    [_scrollQuestionView setContentSize:CGSizeMake(0, 20+44*(_count/6+1+tip))];


}
//滑动手势
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:[touch view]];//当前view中的触摸点
    if (point.y<25) {
        _beginMoving=YES;//触摸顶部区域才能滑动
    }
    float movingY=[self convertPoint:point toView:_superView].y;
    if (_beginMoving && self.frame.origin.y>=(_originY-_height)) {
        if (movingY>=80) {
            self.frame=CGRectMake(0, movingY, _width, _height);
        } else {
            self.frame=CGRectMake(0, 80, _width, _height);
        }
        float offset=(_superView.frame.size.height-self.frame.origin.y)/_superView.frame.size.height*0.8;
        _bgView.alpha=offset;
        
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _beginMoving=NO;
    if (self.frame.origin.y>(_originY-_height/2)) {//收起
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(0, _originY, _width, _height);
            _bgView.alpha=0;
        }];
    } else {//恢复到打开状态
        [UIView animateWithDuration:0.3 animations:^{
            self.frame=CGRectMake(0, 80, _width, _height);
            _bgView.alpha=0.8;
        }];
    }
}

-(void)tapBtn:(UIButton *)btn{
    int index=(int)btn.tag-100;//从1开始
    for (int i=0; i<_count-1; i++) {
        UIButton *button=(UIButton *)[self viewWithTag:i+101];
        if (i!=index-1) {//未选中
            [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        } else {//选中的
            [button setBackgroundColor:[UIColor orangeColor]];
        }
    }
    [_delegate QuestionSheetsViewClick:index];
}
-(void)updateBtnListWithNotification:(NSNotification *)notification{
    int num=[notification.object intValue];
    NSLog(@"%@",notification.object);
    for (int i=0; i<_count-1; i++) {
        UIButton *button=(UIButton *)[self viewWithTag:i+101];
        if (i!=num) {
            [button setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
        } else {
            [button setBackgroundColor:[UIColor orangeColor]];
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
