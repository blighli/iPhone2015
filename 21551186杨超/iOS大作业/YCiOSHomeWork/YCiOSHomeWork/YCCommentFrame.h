//
//  YCCommentFrame.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class YCComment;

@interface YCCommentFrame : NSObject
@property (nonatomic,strong) YCComment *comment;
@property (nonatomic,assign) CGRect userNameFrame;
@property (nonatomic,assign) CGRect commentFrame;
@property (nonatomic,assign) CGRect timeFrame;
@property (nonatomic,assign) CGFloat rowHeight;
@end
