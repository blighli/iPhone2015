//
//  main.m
//  cal-test
//
//  Created by apanoo on 15/10/17.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyCal *mycal = [[MyCal alloc] init];
        
        // 计算当前年份和月份
        NSDate *date = [NSDate date];
        NSCalendar *cal = [NSCalendar currentCalendar];
        unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
        NSDateComponents *d = [cal components:unitFlags fromDate:date];
        
        if (argc == 1) {  // 无参数
            
            // printf("Call Func: printWithYear:currentYear month:currentMonth \n");
            
            // 输出年份为year，月份为month的日历
            [mycal printWithYear:(int)[d year] month:(int)[d month]];
            
        } else if(argc == 2) {  // 一个参数：年份
            
            int year = [[[NSString alloc] initWithUTF8String:argv[1]] intValue];
            if (year < 1 || year > 9999) {
                printf("MyCal: year %i not in range 1..9999 \n",year);
                return 0;
            }
            // printf("Call Func: printWithYear:%i \n",year);
            
            // 输出年份为year的日历
            [mycal printWithYear:year];
            
        } else if(argc == 3) {  // 两个参数：年份和月份 或 -m month
            NSString *test = [[NSString alloc] initWithUTF8String:argv[1]];
            if ([test isEqualTo:@"-m"]) {
                int month = [[[NSString alloc] initWithUTF8String:argv[2]] intValue];
                if (month < 1 || month > 12) {
                    printf("MyCal: %i is neither a month number (1..12) nor a name \n",month);
                    return 0;
                }
                [mycal printWithYear:(int) [d year] month:month];  // 当年month月的月历
                return 0;
            }
            
            int year = [[[NSString alloc] initWithUTF8String:argv[2]] intValue];
            int month = [[[NSString alloc] initWithUTF8String:argv[1]] intValue];
            if (month < 1 || month > 12) {
                printf("MyCal: %i is neither a month number (1..12) nor a name \n",month);
                return 0;
            } else if(year < 1 || year > 9999) {
                printf("MyCal: year %i not in range 1..9999 \n",year);
                return 0;
            }
            // printf("Call Func: printWithYear:%i month:%i \n",year, month);
            
            // 输出年份为year，月份为month的日历
            [mycal printWithYear:year month:month];
            
        } else {
            
            // 参数个数错误
            printf("argc error! usage:\n");
            printf("        MyCal [-jy] [[month] year] \n");
            printf("        MyCal [-j] [-m month] [year] \n");
        }
    }
    return 0;
}
