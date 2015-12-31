//
//  YCPostFrame.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
@class YCPost;

@interface YCPostFrame : NSObject

@property (nonatomic,strong) YCPost *Post;
@property (nonatomic,assign,readonly) CGRect IconFrame;
@property (nonatomic,assign,readonly) CGRect NickNameFrame;
@property (nonatomic,assign,readonly) CGRect BodyFrame;
@property (nonatomic,assign,readonly) CGRect TimeFrame;
@property (nonatomic,assign,readonly) CGRect CommentsFrame;
@property (nonatomic,assign,readonly) CGFloat rowHeight;
@end
