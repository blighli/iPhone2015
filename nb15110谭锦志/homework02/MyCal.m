//
//  MyCall.m
//  cal-test
//
//  Created by apanoo on 15/10/17.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import "MyCal.h"

@implementation MyCal

/**
 * @use : 输出number个空格
 */
-(void) printBlank: (int) number
{
    for (int i=0; i<number; i++) {
        printf(" ");
    }
}

/*
 * @use：init month string map
 */
-(void) initStr
{
    NSMutableArray * key = [[NSMutableArray alloc] init];
    NSMutableArray * value = [[NSMutableArray alloc]init];
    if (!_monthStr) {
        
        for (int i=0; i<12; i++) {
            [key addObject:@(i)];
        }
        [value addObject:@"一月"];
        [value addObject:@"二月"];
        [value addObject:@"三月"];
        [value addObject:@"四月"];
        [value addObject:@"五月"];
        [value addObject:@"六月"];
        [value addObject:@"七月"];
        [value addObject:@"八月"];
        [value addObject:@"九月"];
        [value addObject:@"十月"];
        [value addObject:@"十一月"];
        [value addObject:@"十二月"];
    }
    _monthStr = [[NSDictionary alloc] initWithObjects:value forKeys:key];
}

/**
 * @ use : 输出日历头部信息
 */
-(void) printBaseInfoYear: (int)year month:(int) month
{
    // 拼接日历头字符串
    NSString *str_print = [_monthStr[@(month-1)] stringByAppendingFormat:@" %i", year ];
    
    // 输出空格使得日历头居中
    int blank = (20 - (int)[str_print length]) / 2;
    [self printBlank:blank-1];
    
    printf("%s \n", [str_print UTF8String]);
    printf("日 一 二 三 四 五 六 \n");
}

/*
 * @input  : (int) year; (int) month
 * @output : year年，month月的总天数
 */
-(int) monthmax:(int) month year:(int)year
{
    int monthmax = 30;
    if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
        monthmax=31;
    if(month == 2)
        monthmax = 28;
    if(month == 4 || month == 6 || month == 9 || month == 11)
        monthmax = 30;
    
    if ((year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0) {   // 闰年
        if (month == 2) {
            monthmax = 29;
        }
    }
    return monthmax;
}

/**
 * @input  : (int) year; (int) month
 * @output : year年，month月第一天是周几
 */
-(int) dayIndex:(int) month year:(int)year
{
    // 基姆拉尔森计算公式取得一号是周几
    if(month == 1 || month == 2)
    {
        month += 12;    // 一月算做上一年的十三月，二月算做上一年的十四月
        year --;
    }
    
    // 算出这月一号是周几
    return (1 + 2*month + 3*(month + 1)/5 + year + year/4 - year/100 + year/400 + 1) % 7;
}

/**
 * @input  : (int)year; (int) month
 * @output : year年，month月的日历
 */
-(void) printCalYear: (int) year month: (int) month
{
    // 输出日历
    int monthmax = [self monthmax:month year:year];  // 计算当前月天数
    int dayIndex = [self dayIndex:month year:year];  // 计算当前月1号为周几
    [self printBlank:(3 * dayIndex)];
    for(int i=1; i <= monthmax; i++)
    {
        printf("%2i ",i);
        if((i + dayIndex) % 7==0)
        {
            printf("\n");
        }
        if(i == monthmax)
        {
            printf("\n");
        }
    }
}

/**
 * @input  : (int) year
 * @use    : 输出年份为year的日历
 */
-(void) printWithYear:(int)year
{
    [self initStr];
    [self printBlank:((20*3 + 4 - 4) / 2) - 1];
    
    // 输出年份
    printf("%i\n\n", year);
    
    int cur_i[12];  // 记录每个月已经输出的日期的后一天
    for (int j=0; j<12; j++) {
        cur_i[j] = 1;
    }
    
    for (int i=0; i<4; i++) {
        
        // 输出月份头
        for (int j=0; j<3; j++) {
            int left = ((int)((20 - [_monthStr[@(3*i + j)] length]) / 2)) - 1;
            [self printBlank:left];
            printf("%s",[_monthStr[@(3*i + j)] UTF8String]);
            [self printBlank:(left + 2)];
        }
        printf("\n");
        
        // 输出每月星期
        for (int j=0; j<3; j++) {
            printf("日 一 二 三 四 五 六  ");
        }
        printf("\n");
        
        // 输出每月日历
        for (int row=0; row<6; row++) {
            for (int j=0; j<3; j++) {
                int monthmax = [self monthmax:(i*3 + j + 1) year:year];
                int dayIndex = [self dayIndex:(i*3 + j + 1) year:year];
                if (row == 0) {
                    [self printBlank:(3 * dayIndex)];
                }
                
                for(int k=cur_i[i*3 + j]; k <= 42; k++)   // 做大占用6 x 7 = 42
                {
                    if (k <= monthmax) {
                        printf("%2i ",k);  // 日期在范围内
                    } else {
                        printf("   ");     // 日期超出范围，空格代替
                    }
                    
                    cur_i[i*3 + j] ++;
                    if((k + dayIndex) % 7 == 0)
                    {
                        printf(" ");
                        break;
                    }
                }
            }
            printf("\n");
        }
    }
}

/**
 * @input  : (int) year; (int) month
 * @use    : 输出年份为year，月份为month的日历
 */
-(void) printWithYear:(int)year month:(int)month
{
    [self initStr];
    [self printBaseInfoYear:year month:month];
    [self printCalYear:year month:month];
}

@end

