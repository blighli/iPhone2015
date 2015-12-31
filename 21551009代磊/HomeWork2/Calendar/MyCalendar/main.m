//
//  main.m
//  MyCalendar
//
//  Created by TooWaker on 17/10/15.
//  Copyright © 2015年 TooWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

static const char *numStr[] = {"", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二"};

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

void showCal(NSUInteger year, NSUInteger minMonth, NSUInteger maxMonth, NSUInteger times)
{

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

    NSCalendar *calendar = [NSCalendar currentCalendar];
    

    NSDateComponents *compt = [[NSDateComponents alloc] init];
    

    NSUInteger arrFirstDay[13];
    

    NSUInteger arrDayCount[13];
    

    memset(arrFirstDay, 0, sizeof(arrFirstDay));
    memset(arrDayCount, 0, sizeof(arrDayCount));

    for (NSUInteger month = minMonth; month <= maxMonth; month++)
    {
        [compt setYear:year];
        [compt setMonth:month];
        [compt setDay:1];

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



int main(int argc, const char * argv[]) {
    @autoreleasepool {


        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];
        NSUInteger unFlag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);
        
        NSDateComponents *compt = [calendar components:unFlag fromDate:date];
        NSUInteger month = [compt month];
        NSUInteger year = [compt year];
        

        for (int i = 0; i < argc; i++)
            printf("%s ", argv[i]);
        printf("\n");
        @try {
            if (argc == 1)
                showCal(year, month, month, 1);
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
                    showCal(year, month, month, 1);
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
                        showCal(year, month, month, 1);
                    }
                    else if (argc == 2)
                    {
                        year = atoi(argv[1]);
                        showCal(year, 1, 12, 3);
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
                        showCal(year, minMonth, maxMonth, times);
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
