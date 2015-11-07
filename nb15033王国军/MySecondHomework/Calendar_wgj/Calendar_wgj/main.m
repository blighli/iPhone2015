//
//  main.m
//  Calendar_wgj
//
//  Created by 王国军 on 15/10/23.
//  Copyright © 2015年 王国军. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calendar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int days[13] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
        //当月处理
        if (argc == 1) {
            NSDate *date = [NSDate date];
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents *monthComponents =
            [gregorian components:NSCalendarUnitMonth fromDate:date];
            NSDateComponents *yearComponents =
            [gregorian components:NSCalendarUnitYear fromDate:date];
            Calendar *cal = [[Calendar alloc] init];
            cal.month = monthComponents.month;
            cal.year = yearComponents.year;
            NSUInteger year = yearComponents.year;
            if((year % 4 == 0 && year % 100 != 0)||(year % 400 == 0))
            {
                days[2] = 29;
            }else{
                days[2] = 28;
            }
            cal.day = days[monthComponents.month];
            [cal printCalendarForMonth];
        }else if (argc == 2)
        {           //整年处理
            Calendar *cal = [[Calendar alloc] init];
            NSString *second = [NSString stringWithFormat:@"%s",argv[1]];
            int year = [second intValue];
            cal.year = year;
            if (0 < year && year < 10000) {
                [cal printCalendarForYear];
            }else
            {
                printf( "cal: year %i not in range 1..9999\n",year);
            }
        }else if (argc == 3)
        {
            NSString *second = [NSString stringWithFormat:@"%s",argv[1]];
            NSString *third = [NSString stringWithFormat:@"%s",argv[2]];
            if([second isEqualToString:@"-m"])
            {
                int m = [third intValue];
                if (m > 0 && m < 13) {
                    Calendar *cal = [[Calendar alloc] init];
                    cal.month = m;
                    NSDate *date = [NSDate date];
                    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDateComponents *yearComponents = [gregorian components:NSCalendarUnitYear fromDate:date];
                    cal.year = yearComponents.year;
                    NSUInteger year = yearComponents.year;
                    if((year % 4 == 0 && year % 100 != 0)||(year % 400 == 0))
                    {
                        days[2] = 29;
                    }else{
                        days[2] = 28;
                    }
                    cal.day = days[m];
                    [cal printCalendarForMonth];
                    
                }else{
                    printf("cal: %s is neither a month number (1..12) nor a name\n",argv[1]);
                }
            }else{
                //具体年月处理
                int m = [second intValue];
                NSString *stringMonth = [second stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
                int y = [third intValue];
                if (stringMonth.length > 0 || y > 12 || y < 0) {
                    printf("cal: %s is neither a month number (1..12) nor a name\n",argv[1]);
                }else{
                    int y = [third intValue];
                    if (y >= 1 && y <= 9999) {
                        Calendar *cal = [[Calendar alloc] init];
                        cal.month = m;
                        cal.year = y;
                        NSUInteger year = y;
                        if((year % 4 == 0 && year % 100 != 0)||(year % 400 == 0))
                        {
                            days[2] = 29;
                        }else{
                            days[2] = 28;
                        }
                        cal.day = days[m];
                        [cal printCalendarForMonth];
                    }else{
                        printf( "cal: year %i not in range 1..9999\n",y);
                    }
                }
            }
            //            NSLog(@"-bash: %@: command not found", first);
            
        }
        
        return 0;
    }
}