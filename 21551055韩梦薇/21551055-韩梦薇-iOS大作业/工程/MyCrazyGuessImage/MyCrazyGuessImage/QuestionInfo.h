//
//  QuestionInfo.h
//  MyCrazyGuessImage
//
//  Created by zhuzhu on 15/11/25.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QuestionInfo : NSObject

@property (nonatomic,copy) NSString *answer;

@property (nonatomic,copy) NSString *icon;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSArray *options;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)questionWithDict:(NSDictionary *)dict;

@property (nonatomic,strong,readonly)UIImage *image;

+(NSArray *)questions;
@end
