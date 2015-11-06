//
//  main.m
//  Homework_2
//
//  Created by YunhanXu on 15/10/20.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import <Foundation/Foundation.h>

//当年默认为2015年
int leapYear[13] = { 0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };//索引代表月数
int normalYear[] = { 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

bool isLeapYear(int year)//判定是否闰年
{
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) return true;
    return false;
}

int CalWeekDay(int year, int mon, int day)//基姆拉尔森计算公式，返回该日期是礼拜几
{
    if (mon == 1 || mon == 2)
    {
        mon += 12;
        year--;
    }
    int weekDayNum = (day + 2 * mon + 3 * (mon + 1) / 5 + year + year / 4 - year / 100 + year / 400 + 1) % 7;
    
    return weekDayNum;
}

void ShowOneMon(int firstDayWeekNum, int monthDays)//给出第一天开始于礼拜几和总天数，输出该月日历
{
    printf("日\t一\t二\t三\t四\t五\t六\n");
    int count = 1;
    int day = 1;
    firstDayWeekNum %= 7;
    //先输出空格
    while (firstDayWeekNum-- != 0)
    {
        printf("\t");
        count++;
    }
    
    while (day <= monthDays)
    {
        printf("%d\t",day++);
        if (count++ % 7 == 0)
        {
            printf("\n");
        }
    }
}

void ShowPresentYearSomeMon(int someMon)//显示某月月历，参数为月份
{
    if (isLeapYear(2015	))//若为闰年
    {
        ShowOneMon(CalWeekDay(2015, someMon, 1), leapYear[someMon]);
    }
    else
    {
        ShowOneMon(CalWeekDay(2015, someMon, 1), normalYear[someMon]);
    }
}

void ShowPresentMonth()//显示本月（十月）
{
    if (isLeapYear(2015))//若为闰年
    {
        ShowOneMon(CalWeekDay(2015, 10, 1), leapYear[10]);
    }
    else
    {
        ShowOneMon(CalWeekDay(2015, 10, 1), normalYear[10]);
    }
}

void ShowSomeYearSomeMonth(int someYear, int someMon)//显示某年某月
{
    if (isLeapYear(someYear))//若为闰年
    {
        ShowOneMon(CalWeekDay(someYear, someMon, 1), leapYear[someMon]);
    }
    else
    {
        ShowOneMon(CalWeekDay(someYear, someMon, 1), normalYear[someMon]);
    }
}

void ShowSomeYear(int someYear)//显示某年
{
    if (isLeapYear(someYear))//若为闰年
    {
        for (int mon = 1; mon <= 12;++mon)
        {
            printf("%d月\n",mon);
            ShowOneMon(CalWeekDay(someYear, mon, 1), leapYear[mon]);
            printf("\n");
        }
    }
    else
    {
        for (int mon = 1; mon <= 12; ++mon)
        {
            printf("%d月\n",mon);
            ShowOneMon(CalWeekDay(someYear, mon, 1), normalYear[mon]);
            printf("\n");
        }
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
           if ([[ [NSString alloc] initWithCString:argv[1]] isEqualToString:@"cal"] && argc == 2)//输出当前月月历
            {
                ShowPresentMonth();
                return 0;
            }
            if ([[[NSString alloc] initWithCString:argv[1]] isEqualToString:@"cal"] && argc == 4)
            {
                int tmp = [[[NSString alloc] initWithCString:argv[3]] intValue];
                if ([[ [NSString alloc] initWithCString:argv[2]] isEqualToString:@"-m"] && tmp <=12 && tmp >= 1)//输出当前年某月
                {
                    ShowPresentYearSomeMon(tmp);
                    return 0;
                }
                tmp = [[[NSString alloc] initWithCString:argv[2]] intValue];
                if (tmp <=12 && tmp >= 1 && [[[NSString alloc] initWithCString:argv[3]] intValue] > 0)//输出某年某月
                {
                    ShowSomeYearSomeMonth([[[NSString alloc] initWithCString:argv[3]] intValue], tmp);
                    return 0;
                }
            }
            if ([[[NSString alloc] initWithCString:argv[1]] isEqualToString:@"cal"] && argc == 3 && [[[NSString alloc] initWithCString:argv[2]] intValue] > 0)//输出某年月历
            {
                ShowSomeYear([[[NSString alloc] initWithCString:argv[2]] intValue]);
                return 0;
            }
            if (argc > 4) {
                printf("输入非法");
                return 0;
            }
        
            printf("输入非法");
            return 0;
        }
    
    return 0;
}

