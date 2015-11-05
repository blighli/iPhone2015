//
//  DateUtil.h
//  Project1
//
//  Created by Mz on 14-10-7.
//  Copyright (c) 2014年 Zorro M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject
+ (int) daysOfMonth:(int) month inYear:(int) year;
+ (NSCalendar *) gregorianCalendar;
+ (NSDateComponents *) componentsFromDate:(NSDate *) date;
+ (NSDateComponents *) componentsFromYear:(int) year andMonth:(int) month;
+ (NSDateComponents *) componentsFromMonth:(int) month;
+ (NSDateComponents *) componentsOfThisMonth;

+ (void) generateMonthWithComponents:(NSDateComponents *) comp
                                into:(NSArray *) ss
                             hasYear:(BOOL) hasYear;
@end
