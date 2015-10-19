//
//  Calendar.m
//  CalOnMac
//
//  Created by HacAdmin on 10/18/15.
//  Copyright (c) 2015 HacAdmin. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar

- (void) InitCalendar
{
    known_year=1;
    known_month=1;
    known_day=1;
    known_weekday=Sat;
    memset(table, 0, 546);
}

- (void)SetNow
{
    NSDate *dateNow;
    dateNow=[NSDate dateWithTimeIntervalSinceNow:0];//dayDelay代表向后推几天，如果是0则代表是今天，如果是1就代表向后推24小时，如果想向后推12小时，就可以改成dayDelay*12*60*60,让dayDelay＝1
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;//这句我也不明白具体时用来做什么。。。
    comps = [calendar components:unitFlags fromDate:dateNow];
    now_year=(int)[comps year];//获取年对应的长整形字符串
    now_month =(int)[comps month];//获取月对应的长整形字符串
}

-  (int)GetNowYear
{
    return now_year;
}

-  (int)GetNowMonth
{
    return now_month;
}

+(int) day_count:(int) month
{
    switch (month)
    {
        case 1: return 0; break;
        case 2: return 31; break;
        case 3: return 31+28; break;
        case 4: return 31+28+31; break;
        case 5: return 31+28+31+30; break;
        case 6: return 31+28+31+30+31; break;
        case 7: return 31+28+31+30+31+30; break;
        case 8: return 31+28+31+30+31+30+31; break;
        case 9: return 31+28+31+30+31+30+31+31; break;
        case 10: return 31+28+31+30+31+30+31+31+30; break;
        case 11: return 31+28+31+30+31+30+31+31+30+31; break;
        case 12: return 31+28+31+30+31+30+31+31+30+31+30; break;
        default:return 0;
    }
}

+ (char *)month_name:(int) month
{
    switch (month)
    {
        case 1:return "January";break;
        case 2:return "February";break;
        case 3:return "March";break;
        case 4:return "April";break;
        case 5:return "May";break;
        case 6:return "June";break;
        case 7:return "July";break;
        case 8:return "August";break;
        case 9:return "September";break;
        case 10:return "October";break;
        case 11:return "November";break;
        case 12:return "December";break;
        default:return "No";break;
    }
}

+ (void) first_line_print:(int) month:(int) year
{
    switch(month)
    {
        case 1:
            printf("%6s%s%3s", "", [Calendar month_name:month],"");
            printf("%12s%s  ", "", [Calendar month_name:month+1]);
            printf("%13s%s\n", "", [Calendar month_name:month+2]);
            break;
        case 4:
            printf("%7s%s  ", "", [Calendar month_name:month]);
            printf("%16s%s  ", "", [Calendar month_name:month+1]);
            printf("%17s%s\n", "", [Calendar month_name:month+2]);
            break;
        case 7:
            printf("%8s%s  ", "", [Calendar month_name:month]);
            printf("%15s%s  ", "", [Calendar month_name:month+1]);
            printf("%12s%s\n", "", [Calendar month_name:month+2]);
            break;
        case 10:
            printf("%6s%s  ", "", [Calendar month_name:month]);
            printf("%13s%s  ", "", [Calendar month_name:month+1]);
            printf("%12s%s\n", "", [Calendar month_name:month+2]);
            break;
    }
}

+ (void) week_print
{
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s%2s", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa","");
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
}


- (int) date_distance_count:(int) month:(int) year
{
    int leap_year_count = 0;
    int i;
    int distance;
    if (year > known_year)
    {
        for (i = known_year; i<year; i++)
        {
            //此处原后方判断闰年表达式结合错误，导致每400年2月错误，应加括号！！！
            if (i >= 1800 && ((i % 4 == 0&& i % 100 != 0) || i % 400 == 0))
            {
                leap_year_count++;
            }
            if (i<1800 && i % 4 == 0)
            {
                leap_year_count++;
            }
        }
        if (month > 2)
        {
            if (year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0))
            {
                leap_year_count++;
            }
            if (year < 1800 && year % 4 == 0)
            {
                leap_year_count++;
            }
        }
    }
    distance = (year - known_year) * 365 + leap_year_count + [Calendar day_count:month];
    if ((year == 1752 && month>9) || year > 1752)
        distance = distance - 11;
    return distance;
}


- (int) makesure_firstday_weekday:(int) month: (int) year
{
    int date_distance = 0;
    int weekday;
    
    date_distance = [self date_distance_count:month:year];
    weekday = (known_weekday + date_distance) % 7;
    
    return weekday;
}

- (void) print_in_turn:(int) month:(int) firstday:(int) year
{
    if (year == 1752 && month == 9)
    {
        table[month][0][Sun] = 0;
        table[month][0][Mon] = 0;
        table[month][0][Tues] = 1;
        table[month][0][Wed] = 2;
        for (int j = 14,row=0,column=Thur; j <= 30; j++)
        {
            table[month][row][column] = j;
            column++;
            if (column > Sat)
            {
                row++;
                column = Sun;
            }
        }
        return;
    }
    
    switch (month)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
        {
            for (int i = 1,row=0,column=firstday; i<=31; i++)
            {
                table[month][row][column] = i;
                column++;
                if (column > Sat)
                {
                    row++;
                    column = Sun;
                }
            }
            break;
        }
        case 2:
        {
            if ((year >= 1800 && ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)) || (year < 1800 && year % 4 == 0)) /*闰年*/
            {
                for (int i = 1, row = 0, column = firstday; i <= 29; i++)
                {
                    table[2][row][column] = i;
                    column++;
                    if (column > Sat)
                    {
                        row++;
                        column = Sun;
                    }
                }
                break;
            }
            else /*平年*/
            {
                for (int i = 1,row = 0, column = firstday; i <= 28; i++)
                {
                    table[2][row][column] = i;
                    column++;
                    if (column > Sat)
                    {
                        row++;
                        column = Sun;
                    }
                }
                break;
            }
            
        }
        case 4:
        case 6:
        case 9:
        case 11:
        {
            for (int i = 1, row = 0, column = firstday; i <= 30; i++)
            {
                table[month][row][column] = i;
                column++;
                if (column > Sat)
                {
                    row++;
                    column = Sun;
                }
            }
            break;
        }
    }
}

- (void) date_print:(int) month:(int) year
{
    int firstday;
    firstday = [self makesure_firstday_weekday:month:year];
    [self print_in_turn:month:firstday:year];
    firstday = [self makesure_firstday_weekday:month+1:year];
    [self print_in_turn:month+1:firstday:year];
    firstday = [self makesure_firstday_weekday:month+2:year];
    [self print_in_turn:month+2:firstday:year];
    for (int i = 0; i <=5; i++)
    {
        for (int j = month; j <= month+2; j++)
        {
            if (table[j][i][0] == 0)
            {
                printf("%2s", "");
            }
            else
            {
                printf("%2d", table[j][i][0]);
            }
            for (int k = 1; k <=6; k++)
            {
                if (table[j][i][k] == 0)
                {
                    printf("%3s", "");
                }
                else
                {
                    printf("%3d", table[j][i][k]);
                }
                if (k == 6)
                {
                    if (j == month + 2)
                        printf("\n");
                    else
                        printf("%2s", "");
                }
            }
        }
    }
}

- (void) PrintMonth:(int) year:(int) month
{
    int yearLen;
    if(year>999)yearLen=4;
    else if(yearLen>99)yearLen=3;
    else if(yearLen>9)yearLen=2;
    else yearLen=1;
    int spaceNum =(20-(int)strlen([Calendar month_name:month])-yearLen-1)/2;
    for (int i=0; i<spaceNum; i++)
    {
        printf(" ");
    }
    printf("%s %d\n",[Calendar month_name:month],year);
    printf("%2s%3s%3s%3s%3s%3s%3s\n", "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa");
    int firstday = (int)[self makesure_firstday_weekday:month:year];
    [self print_in_turn:month:firstday:year];
    for (int row=0; row<=5; row++)
    {
        if (table[month][row][0] == 0)
        {
            printf("%2s", "");
        }
        else
        {
            printf("%2d", table[month][row][0]);
        }
        for(int column=1;column<=6;column++)
        {
            if (table[month][row][column] == 0)
            {
                printf("%3s", "");
            }
            else
            {
                printf("%3d", table[month][row][column]);
            }
            if (column == 6)
            {
                printf("\n");
            }
        }
    }
}

- (void) main_calendar:(int) year
{
    int i;
    printf("%33d\n\n",year);
    for (i = 1; i <= 10; i=i+3)
    {
        [Calendar first_line_print:i:year];
        [Calendar week_print];
        [self date_print:i:year];
    }
}

+ (int) GetNumber:(char*) str
{
    int year=0;
    int weight=1;
    for (int i=(int)strlen(str)-1; i>=0; i--)
    {
        year = year+weight*(str[i]-'0');
        weight=10*weight;
    }
    return year;
}
@end

