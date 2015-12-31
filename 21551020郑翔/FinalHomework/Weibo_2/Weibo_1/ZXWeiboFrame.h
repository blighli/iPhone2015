//
//  ZXWeiboFrame.h
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#define nameFont [UIFont systemFontOfSize:12]
#define dateFont [UIFont systemFontOfSize:10]
#define textFont [UIFont systemFontOfSize:14]

@class ZXWeibo;
@interface ZXWeiboFrame : NSObject

@property (nonatomic, strong) ZXWeibo *weibo;

@property (nonatomic, readonly) CGRect iconFrame;
@property (nonatomic, readonly) CGRect nameFrame;
@property (nonatomic, readonly) CGRect dateFrame;
@property (nonatomic, readonly) CGRect vipFrame;
@property (nonatomic, readonly) CGRect textFrame;
@property (nonatomic, readonly) CGRect picFrame;

@property (nonatomic, readonly) float rowHeight;

@end
