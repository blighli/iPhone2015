//
//  Calendar.h
//  iOS第二次作业
//
//  Created by zhuzhu on 15/10/20.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject
{
    @private
        NSArray *_month_arr;
        NSCalendar *_cal;
        NSDateComponents *_comp;
        NSUInteger _unitFlags;
}

- (id)init;

- (NSArray *) monthCalendarwithDate:(NSDate *)date;
- (NSDate *) customDateWithMonth:(NSUInteger)month andYear:(NSUInteger)year;
- (void) printYearCalendarOfYear:(NSUInteger)year;
- (void) printMonthWithDate:(NSDate *)date;
- (void) printBaseContent:(NSString *)string;
- (void) printTitleWithYear:(NSString *)yr andMonth:(NSString *)mth;
- (void) printWeekdaysTitle;
- (void) newLine;
@end
