//
//  main.m
//  ios作业2
//
//  Created by 王林 on 15/10/19.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCalendar.h"
#import "CheckInput.h"

/*
	cal命令模仿。
	接受一下指令模式：
	$./mycal
    $./mycal -m 2011
    $./mycal 10 2011
    $./mycal 2011
 */

int main(int argc, const char * argv[]) {
    //检查输入
    
    @autoreleasepool {
        MyCalendar *mycal = [[MyCalendar alloc] init];
        //获取当前年月
        NSCalendar *current = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDateComponents *components = [current components:unitFlags fromDate:[NSDate new]];
        //命令判断
        if (argc == 1) {
//            NSLog(@"打印当年当月信息");
            //打印
            [mycal printCalendar:components.year andMonth:components.month];
            
        }else if (argc == 2){
//            NSLog(@"打印某一年的月份信息");
            //获取输入的参数
            NSString *inputStr = [NSString stringWithFormat:@"%s",argv[1]];
            //判断输入是否有误
            if ([CheckInput checkStringIsNumber:inputStr]) {
                [mycal printYearCalender:inputStr.integerValue];
            }else{
                printf("输入有误\n");
            }
            
        }else if (argc == 3){
//            NSLog(@"打印某一年某一月信息");
            //获取输入的参数
            NSString *inputFirstStr = [NSString stringWithFormat:@"%s",argv[1]];
            NSString *inputSecondStr = [NSString stringWithFormat:@"%s",argv[2]];
            //判断输入
            if ([inputFirstStr isEqualToString:@"-m"] && [CheckInput checkStringIsNumber:inputSecondStr]) {
                //打印当年某一月月历
                [mycal printCalendar:components.year andMonth:inputSecondStr.integerValue];
            }else if ([CheckInput checkStringIsNumber:inputFirstStr] && [CheckInput checkStringIsNumber:inputSecondStr]){
                //打印某一年某一月月历
                [mycal printCalendar:inputSecondStr.integerValue andMonth:inputFirstStr.integerValue];
            }else{
                printf("输入有误\n");
            }
        }else{
            NSLog(@"输入有误\n");
        }
    }
    
    return 0;
}
