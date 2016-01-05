//
//  QuestionSheetsView.h
//  DriveTestHelper
//
//  Created by wp on 15/12/23.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QuestionSheetsViewDelegate

-(void)QuestionSheetsViewClick:(int)index;

@end

@interface QuestionSheetsView : UIView

@property(nonatomic,strong) UIView *bgView;
@property(nonatomic,weak) id<QuestionSheetsViewDelegate> delegate;
-(instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView andQuesCount:(int)count;
@end
