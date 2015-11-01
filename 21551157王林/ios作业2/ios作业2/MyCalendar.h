//
//  MyCalendar.h
//  ios作业2
//
//  Created by 王林 on 15/10/20.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCalendar : NSObject

//属性
@property (nonatomic,strong) NSCalendar *currentCalendar;

//打印某一年某一月的月历
- (void) printCalendar:(NSInteger) year andMonth:(NSInteger) month;

//打印某一年的月历
- (void) printYearCalender:(NSInteger) year;

@end
