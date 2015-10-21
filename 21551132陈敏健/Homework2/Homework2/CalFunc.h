//
//  CalFunc.h
//  Homework2
//
//  Created by 敏少eclipse on 15/10/20.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalFunc : NSObject

-(void)printCalByYear:(NSInteger)year Month:(NSInteger)month;
-(void)printCalByYear:(NSInteger)year;

-(NSInteger)getDayCountWithYear:(NSInteger)year Month:(NSInteger)month;

-(instancetype)init;
+(instancetype)calFunc;
@end
