//
//  SXWeatherItemView.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface SXWeatherItemView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *tLbl;
@property (weak, nonatomic) IBOutlet UILabel *weatherLbl;
@property (weak, nonatomic) IBOutlet UILabel *windLbl;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImg;
@property(nonatomic,copy)NSString *weather;
+ (instancetype)view;
@end
