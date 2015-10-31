//
//  main.m
//  iOS第二次作业
//
//  Created by zhuzhu on 15/10/20.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calendar.h"

//对月份的合法性检查
BOOL isMonth(NSString *month) {
    if (([month intValue] >= 1) && ([month intValue] <= 12)) {
        return true;
    } else if([[month substringToIndex:1]isEqualToString:@"-"]){
        printf("错误！非法参数！\n");
        return false;
    } else {
        printf("错误！不是合法数字月份！\n");
        return false;
    }
}

//对年份的合法性检查
BOOL isYear(NSString *year) {
    int y = [year intValue];
    if ((y > 1752) && (y <= 9999)) {
        return true;
    } else if((y >= 1) && (y <= 1752)) {
        printf("由于系统NSCalendar类的限制，不能使用儒略历。\n");
        printf("现行公历（格里历）直至1752年才被英帝国（美国）采用，此前则为儒略历。\n");
        printf("cal命令的计算基于美国历法，故1752年之后的计算结果才与cal命令相同。\n");
        return false;
    } else if([[year substringToIndex:1]isEqualToString:@"-"]) {
        printf("错误！非法参数！\n");
        return false;
    } else {
        printf("错误！不是合法数字年份！\n");
        return false;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        if (argc > 3) {
            printf("错误！参数过多！\n");
        } else {
            NSString *arg1 = [NSString stringWithFormat:@"%s", argv[1]];
            NSString *arg2 = [NSString stringWithFormat:@"%s", argv[2]];
            Calendar *cale = [[Calendar alloc] init];
            
            switch (argc) {
                case 1:
                    //情形一："cal"
                    [cale printMonthWithDate:[NSDate date]];
                    break;
                case 2:
                    //情形二："cal Year"
                    if (isYear(arg1)) {
                        [cale printYearCalendarOfYear:[arg1 intValue]];
                    }
                    break;
                case 3:{
                    if (strcmp(argv[1], "-m") == 0) {
                        //情形三："cal -m Month"
                        if (isMonth(arg2)) {
                            [cale printMonthWithDate:[cale customDateWithMonth:[arg2 intValue] andYear:0]];
                        }
                    } else {
                        //情形四："cal Month Year"
                        if (isMonth(arg1) && isYear(arg2)) {
                            [cale printMonthWithDate:[cale customDateWithMonth:[arg1 intValue] andYear:[arg2 intValue]]];
                        }
                    }
                    break;
                }
                default:
                    break;
            }//end switch
            
        }//end if
    }// end autoreleasepool
    return 0;
}
