//
//  main.m
//  homework02
//
//  Created by Hardor-PRO on 15-10-24.
//  Copyright (c) 2015年 Hardor-PRO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Calendar.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSString *inputStr = @"";
        switch(argc){
            case 2:
                inputStr = [NSString stringWithFormat:@"%s",argv[1]];
                break;
            case 3:
                inputStr = [NSString stringWithFormat:@"%s %s",argv[1],argv[2]];
                break;
            case 4:
                inputStr = [NSString stringWithFormat:@"%s %s %s",argv[1],argv[2],argv[3]];
        }
        
        // insert code here...
        //NSLog(@"Hello, World!");
            Calendar *calendar = [[Calendar alloc]init];
            //初始化日期字符串数组
            [calendar initMonthArray];
            
            int found = [calendar spliteString:inputStr];
            
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
            //获取系统当前的日期数组
            NSArray *arr = [dateString componentsSeparatedByString:@"-"];
            int year,month;
            switch(found){
                case 1:
                    year = [[arr objectAtIndex:0] intValue];
                    month = [[arr objectAtIndex:1] intValue];
                    [calendar printCarlendar:year andMonth:month];
                    break;
                case 0:
                    printf("输入参数有误\n");
                    break;
                case 2:
                    year = [calendar currentYear];
                    [calendar printCarlendar:year andMonth:0];
                    break;
                case 3:
                    year = [calendar currentYear];
                    month = [calendar currentMonth];
                    [calendar printCarlendar:year andMonth:month];
                    break;
            }
    }
    return 0;
}

