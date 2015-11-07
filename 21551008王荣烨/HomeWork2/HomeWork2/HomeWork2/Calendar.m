//
//  Calendar.m
//  homework02
//
//  Created by Hardor-PRO on 15-10-24.
//  Copyright (c) 2015年 Hardor-PRO. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

//初始化日期数组
- (void)initMonthArray {
    monthArray = [NSArray arrayWithObjects:@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",nil];
    
}
//打印日历的头信息
- (void) printWeekday{
    printf("日 一 二 三 四 五 六  ");
}
//空行
- (void) printNextline{
    printf("\n");
}

//计算某年的某个月的第一天对应的星期
- (int) calWeekday: (int)year andMonth:(int) month{
    int month1,day,i,weekday;
    weekday = (int)(floor(year-1+(year-1)/4.0-(year-1)/100.0+(year-1)/400.0+1))%7;
    for(month1 = 1;month1<month;month1++)
    {
        if(month1 == 4 || month1 == 6 || month1 == 9|| month1 == 11)
        {
            day = 30;
        }
        else if(month1 == 2)
        {
            //判断是否是闰年
            if((year%4==0&&year%100!=0)||year%400==0)
                day = 29;
            else
                day = 28;
        }
        else
        {
            day = 31;
        }
        for(i=1;i<=day;i++)
        {
            weekday = (weekday+1)%7;
        }
    }
    return weekday;
}

//计算某年某月有多少天
- (int) calDay:(int) month andYear:(int) year{
    int day;
    if(month == 4 || month == 6 || month == 9 || month == 11)
    {
        day=30;
    }
    else if(month == 2)
    {
        //判断是否是闰年
        if((year%4==0&&year%100!=0)||year%400==0)
            day=29;
        else
            day=28;
    }
    else
    {
        day=31;
    }
    return day;
}

//打印日历
- (void) printCarlendar:(int) year andMonth:(int) month{
    int i,j,month1,day,m,month2,l,weekdayMonth;
    int weekday[13];
    int days[13];
    int currentday[13];
    for(i = 0;i<13;i++)
        currentday[i] = 1;
    i = 0;
    //打印某一年
    if(month == 0)
    {
        for(month1 = 1;month1 <= 12;month1 = month1 + 3)
        {
            NSString *monthStr1 = [monthArray objectAtIndex:(month1 - 1)];
            NSString *monthStr2 = [monthArray objectAtIndex:(month1 - 1 + 1)];
            NSString *monthStr3 = [monthArray objectAtIndex:(month1 - 1 + 2)];
            //打印月份标题
            printf("         %s                 %s                  %s\n",[[monthStr1 description] UTF8String],[[monthStr2 description] UTF8String],[[monthStr3 description] UTF8String]);
            [self printWeekday];
            [self printWeekday];
            [self printWeekday];
            [self printNextline];
            //一个月最多占五行
            for(m = 0;m<6;m++)
            {
                //每一排显示三个月
                for(i = 0;i<3;i++)
                {
                    month2 = month1 + i;
                    if(m == 0)
                    {
                        weekday[month2] = [self calWeekday:year andMonth:month2];
                        //weekday[month2] = calWeekday(year,month2);
                        days[month2] = [self calDay:month2 andYear:year];
                        //days[month2] = calDay(month2,year);
                        for(j = 0;j<weekday[month2];j++)
                        {
                            printf("   ");
                        }
                    }
                    //当遇到最后一行的时候判断留空距离
                    if(currentday[month2] > days[month2])
                    {
                        printf(" ");
                        for(l = 0;l<7;l++)
                        {
                            printf("   ");
                        }
                    }
                    for(j = currentday[month2];j<=days[month2];j++)
                    {
                        printf("%2d ",j);
                        weekday[month2] = (weekday[month2] + 1)%7;
                        if(weekday[month2] == 0 && j != days[month2])
                        {
                            printf(" ");
                            currentday[month2] = j + 1;
                            break;
                        }
                        if(j >= days[month2])
                        {
                            printf(" ");
                            currentday[month2] = j + 1;
                            if(weekday[month2] != 0)
                            {
                                for(l = 0;l<7-weekday[month2];l++)
                                {
                                    printf("   ");
                                }
                            }
                        }
                    }
                }
                [self printNextline];
            }
        }
    }else
        //打印某年某月
    {
        weekdayMonth=[self calWeekday:year andMonth:month];
        NSString *monthStr = [monthArray objectAtIndex:(month - 1)];
        printf("        %s\n",[[monthStr description] UTF8String]);
        [self printWeekday];
        [self printNextline];
        day = [self calDay:month andYear:year];
        for(j=0;j<weekdayMonth;j++)
        {
            printf("   ");
        }
        for(i=1;i<=day;i++)
        {
            printf("%2d ",i);
            weekdayMonth = (weekdayMonth + 1) % 7;
            if(weekdayMonth == 0)
            {
                [self printNextline];
            }
        }
        [self printNextline];
    }
}

//对输入的字符串进行切分
- (int) spliteString:(NSString *)str{
    NSMutableArray * strArray = [NSMutableArray arrayWithCapacity:100];
    NSString *strs = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for(NSString *isStr in [strs componentsSeparatedByString:@" "]){
        if(![isStr isEqualToString:@""]){
            [strArray addObject:isStr];
        }
    }
    int year;
    
    
    //对切分后的数组根据长度分类
    switch([strArray count]){
        case 1:
            if([[strArray objectAtIndex:0] isEqualToString:@"CAL"] || [[strArray objectAtIndex:0] isEqualToString:@"cal"]){
                return 1;
            }
            else
            {
                return 0;
            }
            break;
        case 2:
            @try {
                year = [[strArray objectAtIndex:1] intValue];
                currentYear = year;
            }
            @catch (NSException *exception) {
                return 0;
            }
            @finally {
                if(year <= 0 || year >= 10000){
                    return 0;
                }
            }
            return 2;
            break;
        case 3:
            if([[strArray objectAtIndex:1] isEqualToString:@"-M"] || [[strArray objectAtIndex:1] isEqualToString:@"-m"]){
                //获取系统当前日期
                NSDateFormatter *dateFormatter = [NSDateFormatter new];
                [dateFormatter setDateFormat:@"YYYY-MM-dd"];
                NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
                NSArray *arr = [dateString componentsSeparatedByString:@"-"];
                year = [[arr objectAtIndex:0] intValue];
                currentYear = year;
                @try {
                    currentMonth  = [[strArray objectAtIndex:2] intValue];
                }
                @catch (NSException *exception) {
                    return 0;
                }
                @finally {
                    if(currentMonth <= 0 || currentMonth >= 13){
                        return 0;
                    }
                }
            }else{
                @try {
                    currentYear = [[strArray objectAtIndex:2] intValue];
                }
                @catch (NSException *exception) {
                    return 0;
                }
                @finally {
                    if(currentYear <= 0 || currentYear >= 100000){
                        return 0;
                    }
                }
                @try {
                    currentMonth = [[strArray objectAtIndex:1] intValue];
                }
                @catch (NSException *exception) {
                    return 0;
                }
                @finally {
                    if(currentMonth <= 0 || currentMonth >= 13){
                        return 0;
                    }
                }
            }
            return 3;
            break;
        default:return 0;
    }
}

- (int) currentYear{
    return currentYear;
}
- (int) currentMonth{
    return currentMonth;
}
@end
