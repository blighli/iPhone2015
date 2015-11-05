//
//  DateUtil.m
//  Project1
//
//  Created by Mz on 14-10-7.
//  Copyright (c) 2014年 Zorro M. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil
+ (int)daysOfMonth:(int)month inYear:(int)year {
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
                return 29;
            } else {
                return 28;
            }
    }
    return 0;
}

+ (NSCalendar *)gregorianCalendar {
    return [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

+ (NSDateComponents *)componentsFromDate:(NSDate *)date {
    NSCalendar *gregorian = [[self class] gregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
                          NSDayCalendarUnit | NSWeekdayCalendarUnit;
    return [gregorian components:unitFlags fromDate:date];
}

+ (NSDateComponents *)componentsFromYear:(int)year andMonth:(int)month {
    NSDateComponents *newComp = [[NSDateComponents alloc] init];
    newComp.year = year;
    newComp.month = month;
    NSDate *date = [[[self class] gregorianCalendar] dateFromComponents:newComp];
    return [[self class] componentsFromDate:date];
}

+ (NSDateComponents *)componentsFromMonth:(int)month {
    NSDateComponents *today = [[self class] componentsFromDate:[NSDate date]];
    return [[self class] componentsFromYear:(int)today.year andMonth:month];
}

+ (NSDateComponents *)componentsOfThisMonth {
    NSDateComponents *today = [[self class] componentsFromDate:[NSDate date]];
    return [[self class] componentsFromYear:(int)today.year andMonth:(int)today.month];
}

static const int WIDTH = 20;
+ (void)generateMonthWithComponents:(NSDateComponents *)comp
                               into:(NSArray *)ss
                            hasYear:(BOOL)hasYear {
    NSRange range;
    range.length = 1;
    range.location = comp.month;
    NSString *month;
    if (range.location <= 10) {
        month = [@"0一二三四五六七八九十" substringWithRange:range];
    } else if (range.location == 11) {
        month = @"十一";
    } else {
        month = @"十二";
    }
    month = [NSString stringWithFormat:@"%@月", month];
    
    
    NSString *title = month;
    if (hasYear) {
        NSString *year = [[NSNumber numberWithInteger:comp.year] stringValue];
        title = [NSString stringWithFormat:@"%@ %@", month, year];
    }
    // first line
    int width =(int)month.length + (int)title.length;
    int before = (WIDTH -  width) / 2;
    int after = WIDTH - before - width;
    while (before--) [ss[0] appendString:@" "];
    [ss[0] appendString:title];
    while (after--) [ss[0] appendString:@" "];
    
    // second line
    [ss[1] appendString:@"日 一 二 三 四 五 六"];
    
    int days = [DateUtil daysOfMonth:(int)comp.month inYear:(int)comp.year];
    int d = 1;
    int weekday = (int) comp.weekday;
    for (int line = 2; line < 8; line++) {
        for (int i = 0; i < 7; i++) {
            if (--weekday > 0 || d > days) [ss[line] appendString:@"  "];
            else [ss[line] appendFormat:@"%2d", d++];
            if (i < 6) [ss[line] appendString:@" "];
        }
    }
}
@end
