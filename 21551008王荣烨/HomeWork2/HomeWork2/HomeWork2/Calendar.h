//
//  Calendar.h
//  homework02
//
//  Created by Hardor-PRO on 15-10-24.
//  Copyright (c) 2015年 Hardor-PRO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject
{
    NSArray *monthArray;
    int currentYear;
    int currentMonth;
}
- (int) calWeekday: (int)year andMonth:(int) month;
- (void) printWeekday;
- (int) calDay:(int) month andYear:(int) year;
- (void) printCarlendar:(int) year andMonth:(int) month;
- (void) printNextline;
- (int) spliteString:(NSString *) str;
- (void) initMonthArray;
- (int) currentYear;
- (int) currentMonth;
@end
