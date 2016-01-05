//
//  JKQuestionInfo.h
//  DoubleZ
//
//  Created by cdf on 15/12/29.
//  Copyright © 2015年 cdf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZZQuestionInfo : NSObject

@property (nonatomic, copy) NSString *answer;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary *)dict;

@property (nonatomic, strong, readonly) UIImage *image;

+ (NSArray *)questions;

@end
