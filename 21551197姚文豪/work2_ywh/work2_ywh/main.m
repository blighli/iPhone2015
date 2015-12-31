//
//  main.m
//  work2_ywh
//
//  Created by ywh on 15/10/24.
//  Copyright © 2015年 ywh. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "stdio.h"
#include "stdlib.h"
#include "time.h"
#include "string.h"
#include "math.h"

char* Year[12] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
int Month[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
char* Week[7] = {"一","二","三","四","五","六","日"};
int MonthIndex[12] = {3,6,6,2,4,7,2,5,1,3,6,1};//2015年每月的1号的偏移量

//index表示每月的偏移量
void printCalendar(int mon, int index)
{
    printf("       %s         \n",Year[mon-1]);
    for (int i = 0; i < 7; i++)
    {
        printf("%s ", Week[i]);
    }
    printf("\n");
    for (int j = 0; j < Month[mon - 1] + index; j++)
    {
        if (j < index)
        {
            printf("   ");
        }
        else
        {
            if (j + 1 - index < 10)
            {
                printf(" ");
            }
            printf("%d ", j + 1 - index);
        }
        if ((j + 1) % 7 == 0 && j != 0)
        {
            printf("\n");
        }
    }
}

bool isLeapYear(int y)
{
    if (y % 400 == 0 || (y % 4 == 0 && y % 100 != 0))
    {
        return true;
    }
    return false;
}

void printCalendarByYearAndMonth(int y,int mon)
{
    int addDay = 0;
    //“‘2015ƒÍ10‘¬Œ™ª˘◊º
    bool isAdd = y > 2015;
    for (int i = y; i != 2015; y > 2015 ? i-- : i++)
    {
        if (isLeapYear(i))
        {
            //printf("%d is leap year", i);
            if (isAdd)
            {
                addDay++;
            }
            else
            {
                addDay--;
            }
        }
        if (isAdd)
        {
            addDay++;
        }
        else
        {
            addDay--;
        }
    }
    //printf("addday  %d",addDay);
    if ((y>2015)&&isLeapYear(y) && (mon <= 2))
    {
        addDay--;
    }
    if ((y<2015)&&isLeapYear(y) && (mon > 2))
    {
        addDay++;
    }
    if (isLeapYear(y) &&(mon == 2))
    {
        Month[1] = 29;
    }
    //printf("---addday  %d", addDay);
    int index = ((MonthIndex[mon - 1] + addDay) % 7+7)%7;//2015年以后的偏移量对7求余即可，2015年以前的偏移量对7求余为负数，需要加7再对7求余
    //printf("index=%d\n",index);
    
    printCalendar(mon,index);
    Month[1] = 28;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSDate *now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSUInteger unitFlags = NSYearCalendarUnit|NSMonthCalendarUnit;
        
        NSDateComponents *comps = [calendar components:unitFlags fromDate:now];
        
        int nowYear = [comps year];
        int nowMonth = [comps month];
        
        //NSLog(@"%d %d",nowYear,nowMonth);
        
        if (argc == 2)
        {
            if (strcmp(argv[1], "cal") != 0)
            {
                NSLog(@"input error, please input cal as arguments!");
                return -1;
            }
            printCalendarByYearAndMonth(nowYear, nowMonth);
            printf("\n");
        }
        else if (argc == 3)
        {
            int year = atoi(argv[2]);
            if (year <= 0)
            {
                NSLog(@"input error, please input cal year as arguments(for example:cal 2014)");
                return -2;
            }
            for (int m = 1; m <= 12; m++)
            {
                printCalendarByYearAndMonth(year,m);
                printf("\n");
            }
        }
        else if (argc == 4 && (strcmp(argv[1], "cal") == 0))
        {
            int mon = atoi(argv[2]);
            int year = atoi(argv[3]);
            if (year <= 0||(mon <= 0&&strcmp(argv[2],"-m")!=0)||mon > 12)
            {
                NSLog(@"input error, please input cal month year or cal -m month as arguments(for example:cal 10 2015 or cal -m 10)");
                return -3;
            }
            if (mon != 0)
            {
                printCalendarByYearAndMonth(year, mon);
                printf("\n");
            }
            if (strcmp(argv[2],"-m") == 0)
            {
                if(year > 12){
                    NSLog(@"input error, the month is less than or equals 12");
                    return -4;
                }
                printCalendarByYearAndMonth(nowYear,year);//this year is month
                printf("\n");
            }
        }
        else
        {
            NSLog(@"arguments error, please input the correct arguments number(1~3)");
        }
    }
    return 0;
}
