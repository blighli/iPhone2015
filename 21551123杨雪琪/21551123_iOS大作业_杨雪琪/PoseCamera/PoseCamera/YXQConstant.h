//
//  YXQConstant.h
//  PoseCamera
//
//  Created by YXQ on 15/12/20.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#ifndef YXQConstant_h
#define YXQConstant_h

#import "AppDelegate.h"


#pragma mark - ***变量方法***

#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


#pragma mark - ***全局变量***

#define NSUD [NSUserDefaults standardUserDefaults]
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define bgColor UIColorWithRGBA(78.0f, 89.0f, 71.0f, 1.0f)

#define TABITEMSNUM 5

#pragma mark - ***常量***

#define ZERO_COORDINATE 0.0f
#define STATUS_BAR_HEIGHT 20.0f
#define NAV_TAB_BAR_HEIGHT 44.0f
#define SELECTED_CHANNEL_NAMES @"SELECTED_CHANNEL_NAMES"

enum tabTitles{zipai, wenyi, chuangyi, jiepai, yingshi};

static NSString const *zipaiXianArr[8] = {@"zp1_v.png",@"zp2_h.png",@"zp3_h.png",@"zp4_v.png",@"zp5_v.png",@"zp6_h.png",@"zp7_v.png",@"zp8_v.png"};
static NSString const *wenyiXianArr[21] = {@"wy1_v.png", @"wy2_h.png", @"wy3_h.png", @"wy4_v.png",@"wy5_v.png", @"wy6_h.png", @"wy7_h.png", @"wy8_v.png", @"wy9_v.png",@"wy10_h.png", @"wy11_h.png", @"wy12_v.png", @"wy13_v.png", @"wy14_h.png",@"wy15_h.png", @"wy16_h.png", @"wy17_h.png", @"wy18_h.png",@"wy19_h.png", @"wy20_h.png", @"wy21_h.png"};
static NSString const *chuangyiXianArr[9] = {@"cy1_h.png", @"cy2_v.png", @"cy3_v.png", @"cy4_h.png",@"cy5_h.png", @"cy6_v.png", @"cy7_v.png", @"cy8_h.png", @"cy9_v.png"};
static NSString const *jiepaiXianArr[10] = {@"jp1_h.png", @"jp2_v.png", @"jp3_v.png", @"jp4_h.png",@"jp5_v.png", @"jp6_v.png", @"jp7_v.png", @"jp8_v.png", @"jp9_v.png", @"jp10_v.png"};
static NSString const *yingshiXianArr[19] = {@"ys1_h.png", @"ys2_v.png", @"ys3_v.png", @"ys4_h.png",@"ys5_v.png", @"ys6_v.png", @"ys7_v.png", @"ys8_v.png", @"ys9_v.png",@"ys10_v.png", @"ys11_v.png", @"ys12_v.png", @"ys13_v.png", @"ys14_v.png",@"ys15_v.png", @"ys16_v.png", @"ys17_v.png", @"ys18_v.png",@"ys19_v.png"};

static NSString const *zipaiYuanArr[8] = {@"zp1_v.jpg",@"zp2_h.jpg",@"zp3_h.jpg",@"zp4_v.jpg",@"zp5_v.jpg",@"zp6_h.jpg",@"zp7_v.jpg",@"zp8_v.jpg"};
static NSString const *wenyiYuanArr[21] = {@"wy1_v.jpg", @"wy2_h.jpg", @"wy3_h.jpg", @"wy4_v.jpg",@"wy5_v.jpg", @"wy6_h.jpg", @"wy7_h.jpg", @"wy8_v.jpg", @"wy9_v.jpg",@"wy10_h.jpg", @"wy11_h.jpg", @"wy12_v.jpg", @"wy13_v.jpg", @"wy14_h.jpg",@"wy15_h.jpg", @"wy16_h.jpg", @"wy17_h.jpg", @"wy18_h.jpg",@"wy19_h.jpg", @"wy20_h.jpg", @"wy21_h.jpg"};
static NSString const *chuangyiYuanArr[9] = {@"cy1_h.jpg", @"cy2_v.jpg", @"cy3_v.jpg", @"cy4_h.jpg",@"cy5_h.jpg", @"cy6_v.jpg", @"cy7_v.jpg", @"cy8_h.jpg", @"cy9_v.jpg"};
static NSString const *jiepaiYuanArr[10] = {@"jp1_h.jpg", @"jp2_v.jpg", @"jp3_v.jpg", @"jp4_h.jpg",@"jp5_v.jpg", @"jp6_v.jpg", @"jp7_v.jpg", @"jp8_v.jpg", @"jp9_v.jpg", @"jp10_v.jpg"};
static NSString const *yingshiYuanArr[19] = {@"ys1_h.jpg", @"ys2_v.jpg", @"ys3_v.jpg", @"ys4_h.jpg",@"ys5_v.jpg", @"ys6_v.jpg", @"ys7_v.jpg", @"ys8_v.jpg", @"ys9_v.jpg",@"ys10_v.jpg", @"ys11_v.jpg", @"ys12_v.jpg", @"ys13_v.jpg", @"ys14_v.jpg",@"ys15_v.jpg", @"ys16_v.jpg", @"ys17_v.jpg", @"ys18_v.jpg",@"ys19_v.jpg"};

static NSString const *zipaiSmallArr[8] = {@"zp1_v_small.jpg", @"zp2_h_small.jpg", @"zp3_h_small.jpg", @"zp4_v_small.jpg",@"zp5_v_small.jpg", @"zp6_h_small.jpg", @"zp7_v_small.jpg", @"zp8_v_small.jpg"};
static NSString const *wenyiSmallArr[21] = {@"wy1_v_small.jpg", @"wy2_h_small.jpg", @"wy3_h_small.jpg", @"wy4_v_small.jpg",@"wy5_v_small.jpg", @"wy6_h_small.jpg", @"wy7_h_small.jpg", @"wy8_v_small.jpg", @"wy9_v_small.jpg",@"wy10_h_small.jpg", @"wy11_h_small.jpg", @"wy12_v_small.jpg", @"wy13_v_small.jpg", @"wy14_h_small.jpg",@"wy15_h_small.jpg", @"wy16_h_small.jpg", @"wy17_h_small.jpg", @"wy18_h_small.jpg",@"wy19_h_small.jpg", @"wy20_h_small.jpg", @"wy21_h_small.jpg"};
static NSString const *chuangyiSmallArr[9] = {@"cy1_h_small.jpg", @"cy2_v_small.jpg", @"cy3_v_small.jpg", @"cy4_h_small.jpg",@"cy5_h_small.jpg", @"cy6_v_small.jpg", @"cy7_v_small.jpg", @"cy8_h_small.jpg", @"cy9_v_small.jpg"};
static NSString const *jiepaiSmallArr[10] = {@"jp1_h_small.jpg", @"jp2_v_small.jpg", @"jp3_v_small.jpg", @"jp4_h_small.jpg",@"jp5_v_small.jpg", @"jp6_v_small.jpg", @"jp7_v_small.jpg", @"jp8_v_small.jpg", @"jp9_v_small.jpg", @"jp10_v_small.jpg"};
static NSString const *yingshiSmallArr[19] = {@"ys1_h_small.jpg", @"ys2_v_small.jpg", @"ys3_v_small.jpg", @"ys4_h_small.jpg",@"ys5_v_small.jpg", @"ys6_v_small.jpg", @"ys7_v_small.jpg", @"ys8_v_small.jpg", @"ys9_v_small.jpg",@"ys10_v_small.jpg", @"ys11_v_small.jpg", @"ys12_v_small.jpg", @"ys13_v_small.jpg", @"ys14_v_small.jpg",@"ys15_v_small.jpg", @"ys16_v_small.jpg", @"ys17_v_small.jpg", @"ys18_v_small.jpg",@"ys19_v_small.jpg"};

#endif /* YXQConstant_h */
