//
//  YTDrawPic.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTDrawPicView : UIView

@property (nonatomic, assign)CGFloat lineWidth;
@property (nonatomic, strong)UIColor *lineColor;
- (void)clear;
- (void)back;
@end
