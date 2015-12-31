//
//  SXWeatherBgM.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXWeatherBgM : NSObject

@property(nonatomic,copy)NSString *nbg1;

/** 这个是真正的背景图*/
@property(nonatomic,copy)NSString *nbg2;

@property(nonatomic,copy)NSString *aqi;

@property(nonatomic,copy)NSString *pm2_5;

@end
