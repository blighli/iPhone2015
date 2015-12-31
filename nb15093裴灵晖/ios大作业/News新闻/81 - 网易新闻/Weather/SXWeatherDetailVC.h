//
//  SXWeatherDetailVC.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SXWeatherModel;

@interface SXWeatherDetailVC : UIViewController

@property(nonatomic,strong)SXWeatherModel *weatherModel;
@property (weak, nonatomic) IBOutlet UIImageView *bgImg;
@end
