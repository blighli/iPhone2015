//
//  CZQuestion.h
//  A01-传智猜图
//
//  Created by Apple on 14/12/14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZQuestion : NSObject
@property (nonatomic,copy) NSString *answer;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic, strong) NSArray *options;


- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)questionWithDic:(NSDictionary *)dic;

+ (NSArray *)questionsList;
@end
