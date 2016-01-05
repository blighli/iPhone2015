//
//  YTStatusFrame.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class YTMemo;

@interface YTMemoFrame : NSObject<NSCoding>

/**
 *  标题的frame
 */
@property (nonatomic, assign, readonly) CGRect titleF;

/**
 *  正文的frame
 */
@property (nonatomic, assign, readonly) CGRect subtitleF;
/**
 *  时间的frame
 */
@property (nonatomic, assign, readonly) CGRect timeF;

/**
 *  cell的高度
 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;

@property (nonatomic, strong) YTMemo *memo;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *substitle;
@property (nonatomic, copy) NSString *time;

@end
