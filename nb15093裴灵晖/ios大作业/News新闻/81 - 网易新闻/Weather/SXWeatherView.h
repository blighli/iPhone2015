//
//  SXWeatherView.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//


#import <UIKit/UIKit.h>
@class SXWeatherModel;
@interface SXWeatherView : UIView
@property(nonatomic,strong)SXWeatherModel *weatherModel;

+ (instancetype)view;
- (void)addAnimate;

@end
