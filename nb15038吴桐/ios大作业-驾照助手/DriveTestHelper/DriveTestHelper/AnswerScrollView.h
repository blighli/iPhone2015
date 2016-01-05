//
//  AnswerScrollView.h
//  DriveTestHelper
//
//  Created by wp on 15/12/17.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView

-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)arr;
-(void)reloadData;
@property(nonatomic,assign,readonly) int currentPage;
@property(nonatomic,strong) NSMutableArray *answeredArr;//用户写答案的数组
@property(nonatomic,strong) NSArray *dataArr;//题目数组
@property(nonatomic,strong) UIScrollView *scrollView;
@end
