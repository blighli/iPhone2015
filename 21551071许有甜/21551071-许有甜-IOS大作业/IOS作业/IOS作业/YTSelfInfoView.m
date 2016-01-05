//
//  YTSelfInfoView.m
//  IOS作业
//
//  Created by zhu on 15/12/26.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTSelfInfoView.h"

@implementation YTSelfInfoView

+ (instancetype)selfInfoView
{
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray* objs = [bundle loadNibNamed:@"YTSelfInfoView" owner:nil options:nil];
    return [objs lastObject];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
