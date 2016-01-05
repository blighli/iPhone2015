//
//  YTBaseMemoViewController.h
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTBaseMemoViewController : UIViewController

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *subTitle;
@property(nonatomic, strong) UITextField *titleFeild;
@property(nonatomic, strong) UITextView* subTitleView;
@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UIButton* btn;

/**
 *  添加主题的View
 */
- (void)addTitleView;

/**
 *  添加事件的View
 */
- (void)addEventView;

/**
 *  添加完成按钮
 */
- (void)addFinishBtn;

@end
