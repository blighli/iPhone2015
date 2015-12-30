//
//  SelectPatternView.m
//  DriveTestHelper
//
//  Created by wp on 15/12/22.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "SelectPatternView.h"

@implementation SelectPatternView
{
    SelectTouch block;
}
-(SelectPatternView *)initWithFrame:(CGRect)frame addTouch:(SelectTouch)touch{
    self=[super initWithFrame:frame];
    if (self) {
        [self createView];
        block=touch;
        _pattern=testPattern;
    }
    return self;
}
-(void)createView{
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    NSArray *arr=@[@"答题模式",@"背题模式"];
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
        [btn setFrame:CGRectMake(self.frame.size.width/2-50, self.frame.size.height/2-200+i*130, 100, 100)];
        [btn setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
        [btn.layer setMasksToBounds:YES];
        [btn.layer setCornerRadius:8];
        btn.tag=401+i;
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
        [img setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d11q.png",i+1]]];
        [btn addSubview:img];
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 75, 80, 20)];
        [label setFont:[UIFont systemFontOfSize:15]];
        [label setTextColor:[UIColor whiteColor]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:arr[i]];
        [btn addSubview:label];
        
        [self addSubview:btn];
    }
}
-(void)tapBtn:(UIButton *)btn{
    if (btn.tag==401) {
        _pattern=testPattern;
    } else {
        _pattern=lookingPattern;
    }
    block(_pattern);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha=0;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
