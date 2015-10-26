//
//  Calendar.h
//  CalOnMac
//
//  Created by HacAdmin on 10/18/15.
//  Copyright (c) 2015 HacAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject
{
     enum Weekday{Sun,Mon,Tues,Wed,Thur,Fri,Sat};
     char table[13][6][7];
     int known_weekday;
     int known_year;
     int known_month;
     int known_day;
     int now_year;
     int now_month;
}

-  (void) SetNow;
-  (int)GetNowYear;
-  (int)GetNowMonth;
-  (void) InitCalendar;
-  (int) date_distance_count:(int) month:(int) year;
-  (int) makesure_firstday_weekday:(int) month: (int) year;
-  (void) print_in_turn:(int) month:(int) firstday:(int) year;
-  (void) date_print:(int) month:(int) year;
-  (void) PrintMonth:(int) year:(int) month;
-  (void) main_calendar:(int) year;+ (int) day_count:(int) month;
+ (char *)month_name:(int) month;
+ (void) first_line_print:(int) month:(int) year;
+ (void) week_print;
+ (int) GetNumber:(char*) str;

@end
