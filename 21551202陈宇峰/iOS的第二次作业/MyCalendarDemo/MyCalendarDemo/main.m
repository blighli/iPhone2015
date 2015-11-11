//
//  main.m
//  MyCalendarDemo
//
//  Created by chenyufeng on 15/10/18.
//  Copyright © 2015年 chenyufengweb. All rights reserved.
//


/*
 要求：
 1.运行cal，输出当月的月历；
 2.运行cal 10 2014,输出2014年10月的月历；
 3.运行cal -m 10,输出当年10月的月历；
 4.运行cal 2014,输出2014年的月历；
 
 */

/*
 注意事项：
 1.年份是从 1...9999的；
 2.月份是从  1...12的；
 
 
 */

#import <Foundation/Foundation.h>
#import "YearAndMonthNow.h"
#import "JudgeNumberRegex.h"
#import "PrintYearAndMonth.h"
#import "Days.h"

int main(int argc, const char * argv[])
{
  
  @autoreleasepool{
    
    int year,yue;
    PrintYearAndMonth *printMonthObj = [[PrintYearAndMonth alloc] init];
    PrintYearAndMonth *printYearObj = [[PrintYearAndMonth alloc] init];
    
    if (argc == 2) {
      //1.执行“cal”命令；
      //执行该命令时argc = 2;argv[1] = cal;argv[2] = null
      
      //计算当前年月；
      YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
      [yearAndMonthNow yearAndMonth];
      
      year = yearAndMonthNow.yearNow;
      yue = yearAndMonthNow.monthNow;
      
      [printMonthObj printmonth:year yue:yue];
      
    }
    
    else if(argc == 3){
      //4.执行“cal 2014”命令；
      
      //这个argv2表示年份；
      NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
      
      [printYearObj printyear:[argv2 intValue]];
    
    }
    
    else if(argc == 4){
      //2.执行“cal 10 2014”命令；
      //这一步是为了把传递进来的char * argv参数转化为 OC中的NSString；
      //    NSString *argv1 = [NSString stringWithUTF8String:argv[1]];
      NSString *argv2 = [NSString stringWithUTF8String:argv[2]];
      NSString *argv3 = [NSString stringWithUTF8String:argv[3]];
      
      JudgeNumberRegex *judgeNumberRegex = [[JudgeNumberRegex alloc] init];
      BOOL isMonthRegex = [judgeNumberRegex isNumber:argv2];
      BOOL isYearRegex = [judgeNumberRegex isNumber:argv3];
      
      if (isMonthRegex && isYearRegex) {
        //执行该命令时，argc = 4,argv[1] = cal,argv[2] = 10,argv[3] = 2014;
        //需要把数字字符串转化为整型；
        
        [printMonthObj printmonth:[argv3 intValue] yue:[argv2 intValue]];
        
        
      }
      else{
        //3.执行“cal -m 10”命令；
        //需要输出本年的10月份日历；
        //注意这里和上一个if的差异：这里的月份是在第三个参数的；
        YearAndMonthNow *yearAndMonthNow = [[YearAndMonthNow alloc] init];
        [yearAndMonthNow yearAndMonth];
        year = yearAndMonthNow.yearNow;
        
        [printMonthObj printmonth:year yue:[argv3 intValue]];
        
      }
      
      
    }
    
  }
  
  
  return 0;
}
