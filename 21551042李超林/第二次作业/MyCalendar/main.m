//
//  ViewController.m
//  AutolayoutDemo
//
//  Created by lichaolin on 15/10/7.
//  Copyright © 2015年 lichaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

static const char *numStr[] = {"", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"};
/*
 showYear():在控制台输出第year年，从minMonth到maxMonth的所有日历，每行显示times个日历
 year:为输入年份
 minMonth:为查询年份的左边界
 maxMoth:为查询年份的右边界
 times:为日历显示每行的个数
 */
void showCalendar(NSUInteger year, NSUInteger minMonth, NSUInteger maxMonth, NSUInteger times)
{
    //控制年份的输出，当只显示一个日历的时候，需要特殊处理
    if (maxMonth - minMonth + 1 < times) times = maxMonth - minMonth + 1;
    NSUInteger spaceNum = times*20 + (times-1)*2;
    spaceNum = spaceNum/2 - 2;
    if (times >= 2)
    {
        for (int i = 0; i < spaceNum; i++) printf(" ");
        printf("%04lu\n\n", year);
    }
    else if (times == 1 && maxMonth - minMonth > 0)
        printf("       %04lu\n\n", year);
    else if (maxMonth == minMonth)
    {
        printf("     %s月 %04lu\n", numStr[minMonth], year);
    }
    //创建calendar对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //创建compt对象
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    
    //arrFirstDay[i]表示当前年份中，第i个月的第一天是星期几
    NSUInteger arrFirstDay[13];
    
    //arrDayCount[i]表示当前年份中，第i个月的天数
    NSUInteger arrDayCount[13];
    
    //初始化两个数组都为0，查询范围以外的月份信息需要置为0
    memset(arrFirstDay, 0, sizeof(arrFirstDay));
    memset(arrDayCount, 0, sizeof(arrDayCount));
    //获得[minMonth, maxMonth]之间的arrFirstDay和arrDayCount
    for (NSUInteger month = minMonth; month <= maxMonth; month++)
    {
        [compt setYear:year];
        [compt setMonth:month];
        [compt setDay:1];
        //根据NSCalendar对象和NSDateComponents对象，创建NSDate对象
        NSDate *date = [calendar dateFromComponents:compt];
        
        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);
        
        compt = [calendar components:unFlag fromDate:date];
        NSUInteger day = [compt day];
        NSUInteger week = [compt weekday];
        NSUInteger firstDayOfMonth = week - day%7 + 1;

        NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        NSUInteger dayCount = range.length;
        arrFirstDay[month] = firstDayOfMonth;
        arrDayCount[month] = dayCount;

    }
    //日历输出步骤
    NSUInteger cnt[12];
    for (NSUInteger month = minMonth; month <= maxMonth; month += times)
    {
        if (maxMonth - month + 1 < times) times = maxMonth - month + 1;
        if (minMonth != maxMonth)
        {
            for (int t = 0; t < times; t++)
            {
                if (month + t < 11)
                    printf("        %s月          ", numStr[month + t]);
                else printf("       %s月         ", numStr[month + t]);

            }
            printf("\n");
        }
        for (int t = 0; t < times; t++)
            printf("日 一 二 三 四 五 六  ");
        printf("\n");
        memset(cnt, 0, sizeof(cnt));
        for (int i = 0; i < times; i++) cnt[i] = 1;
        for (int i = 0; i < 6; i++)
        {
            for (int t = 0; t < times; t++)
            {
                NSUInteger flag = 1;
                //特殊处理第一行的输出,输出1号日期前面的空格
                if (i == 0)
                {
                    for (int j = 1; j < arrFirstDay[month + t]; j++)
                    {
                        printf("   ");
                    }
                    flag = arrFirstDay[month + t];
                }
                for (NSUInteger j = flag; j <= 7; j++)
                {
                    //特殊处理星期日下的日期格式控制，日期为占两个字符位，向右对齐
                    if (j == 1 || cnt[t] == 1)
                    {
                        if (cnt[t] > arrDayCount[month + t])
                        {
                            printf("  ");
                        }
                        else printf("%2lu", cnt[t]++);
                    }
                    else
                    {
                        if (cnt[t] > arrDayCount[month + t])
                        {
                            printf("   ");
                        }
                        else printf("%3lu", cnt[t]++);
                    }
                    //当输入7次后（1好日期包括之前的空格），判断一下是否输出'\n'还是"  "
                    if (j == 7)
                    {
                        if (t == times - 1) printf("\n");
                        else printf("  ");
                    }
                }
                
            }
        }
    }
}

bool isLegal(const char *str)
{
    for (int i = 0; i < strlen(str); i++)
        if (str[i] < '0' || str[i] > '9')
            return false;
    return true;
}

bool isMonth(NSUInteger month)
{
    return month >= 1 && month <= 12;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //showCalendar(2015, 1, 12, 5);
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];
        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);
        
        NSDateComponents *compt = [calendar components:unFlag fromDate:date];
        NSUInteger month = [compt month];
        NSUInteger year = [compt year];
        
        //处理命令行
        for (int i = 0; i < argc; i++)
            printf("%s ", argv[i]);
        printf("\n");
        @try {
            if (argc == 1)
                showCalendar(year, month, month, 1);
            else
            {
                NSException *exception = [NSException exceptionWithName:@"CommandException" reason:@"Command Error" userInfo:nil];
                if (argv[1][0] == '-')
                {
                    if (argv[1][1] == 'm' && argc == 3 && isLegal(argv[2]))
                        month = atoi(argv[2]);
                    else @throw exception;
                    if (!isMonth(month))
                        @throw exception;
                    showCalendar(year, month, month, 1);
                }
                else
                {
                    for (int i = 1; i < argc; i++)
                        if (!isLegal(argv[i]))
                            @throw exception;
                    if (argc == 3)
                    {
                        month = atoi(argv[1]);
                        if (!isMonth(month))
                            @throw exception;
                        year = atoi(argv[2]);
                        showCalendar(year, month, month, 1);
                    }
                    else if (argc == 2)
                    {
                        year = atoi(argv[1]);
                        showCalendar(year, 1, 12, 3);
                    }
                    //for test
                    else if (argc == 5)
                    {
                        NSUInteger minMonth = atoi(argv[1]);
                        NSUInteger maxMonth = atoi(argv[2]);
                        if (!isMonth(minMonth) || !isMonth(maxMonth)) {
                            @throw exception;
                        }
                        NSUInteger year = atoi(argv[3]);
                        NSUInteger times = atoi(argv[4]);
                        showCalendar(year, minMonth, maxMonth, times);
                    }
                    else
                    {
                        @throw exception;
                    }
                    
                }
            }
        }
        @catch (NSException *exception) {
            NSLog(@"%@: parameter is illegal!", exception);
        }
        @finally {
        }
        
    }
    return 0;
}
