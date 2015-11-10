//
//  LYCalCommand.m
//  ios第二次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import "LYCalCommand.h"
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"


char* _strOfYear[12] = {"一","二","三","四","五","六","七","八","九","十","十一","十二"};
int _numTemp[9] = {9,99,999,9999,99999,999999,9999999,99999999,999999999};
int _numMonth[12] = {31,28,31,30,31,30,31,31,30,31,30,31};

@implementation LYCalCommand
{
    NSCalendar* _gregorian;
    unsigned long _unitFlags;
}
@synthesize month;
@synthesize year;

- (id) init
{
    //初始化默认年月为今天的年月
    _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate* today = [NSDate date];
    _unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit
				| NSDayCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents* comp = [_gregorian components: _unitFlags fromDate: today];
    
    self.month = (int)comp.month;
    self.year = (int)comp.year;
    //NSLog(@"初始化函数：%d年%d月", self.year, self.month);
    return self;
}

/* 输入某个月日历 */
- (void) printMonth
{
    //NSLog(@"printMonth()-->现在输出%d月的日历", self.month);
    int n = 0;
    
    if(self.month < 10)
    {
        n = 5 + [self numOfInt: self.month];
    }
    else
    {
        n = 7 + [self numOfInt: self.month];
    }
    for(int i=0; i<(20-n)/2;i++)
        printf(" ");
    printf("%s月 %d\n", _strOfYear[self.month-1], self.year);
    printf("日 一 二 三 四 五 六\n");
    
    //获取对应月份的第一天的date对象
    NSString* str_month =
    self.month >= 10 ? [[NSString alloc] initWithFormat:@"%d", self.month] : [[NSString alloc] initWithFormat:@"0%d", self.month];
    NSString* str_date = [[NSString alloc] initWithFormat:@"%d-%@-01", self.year, str_month];
    //NSLog(@"printMonth() ---> %@", str_date);
    
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [df dateFromString: str_date];
    
    //查询当月第一天是星期几
    NSDateComponents* comp = [_gregorian components: _unitFlags fromDate: date];
    //存储星期几
    int pos = (int)comp.weekday;
    if(pos == 7) //星期六
        printf("%2d\n", 1);
    else
    {
        if(pos != 1)//不是星期日
        {
            for(int i=0;i<3*(pos-1);i++)
                printf(" ");
        }
        printf("%2d ", 1);
    }
    
    //获取当月有多少天
    int day = _numMonth[self.month-1];
    if([self isLeapYear: self.year] && self.month == 2)
    {
        day++;
    }
    pos++;
    for(int i=2; i <= day; i++)
    {
        //pos++;
        //已经是星期六(7)的下一天
        //if(pos == 8)
        //	pos = 1;
        if(pos == 7)
        {
            printf("%2d\n", i);
            pos = 1;
        }
        else
        {
            printf("%2d ", i);
            pos++;
        }
    }
    printf("\n");
}

- (void) printYear
{
    //NSLog(@"现在输出%d年的日历", self.year);
    //输出年份标题
    int space = (64 - [self numOfInt: self.year])/2;
    for(int i=0; i<space; i++)
        printf(" ");
    printf("%d\n\n", self.year);
    
    [self printThreeMonth: 1];
    [self printThreeMonth: 4];
    [self printThreeMonth: 7];
    [self printThreeMonth: 10];
}

- (void) printThreeMonth: (int) sMonth
{
    //获取三个月份的第一个月份第一天是星期几
    NSString* str_month =
    sMonth == 10 ? [[NSString alloc] initWithFormat:@"%d", sMonth] : [[NSString alloc] initWithFormat:@"0%d", sMonth];
    NSString* str_date = [[NSString alloc] initWithFormat:@"%d-%@-01", self.year, str_month];
    
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate* date = [df dateFromString: str_date];
    NSDateComponents* comp = [_gregorian components: _unitFlags fromDate: date];
    int pos = (int)comp.weekday - 1;
    
    //打印月份标题
    if(sMonth != 10)
    {
        for(int i=0; i<3; i++)
            printf("        %s月          ", _strOfYear[sMonth-1+i]);
    }
    else
    {
        for(int i=0; i<3; i++)
        {
            if(i == 0)
                printf("        %s月          ", _strOfYear[sMonth-1+i]);
            else
                printf("       %s月         ", _strOfYear[sMonth-1+i]);
        }
    }
    printf("\n");
    
    //输出星期标题
    for(int i=0; i<3; i++)
    {
        printf("日 一 二 三 四 五 六  ");
    }
    printf("\n");
    
    //计算日历数据，并存储在二维数组中
    int cal_one[6][7] = {0};
    int cal_two[6][7] = {0};
    int cal_three[6][7] = {0};
    int month_one = _numMonth[sMonth-1];
    int month_two = _numMonth[sMonth];
    int month_three = _numMonth[sMonth+1];
    if([self isLeapYear: self.year] && sMonth == 1)
        month_two++;
    
    int week = 0;
    for(int i = 1; i <= month_one; i++)
    {
        cal_one[week][pos] = i;
        pos++;
        if(pos > 6)
        {
            pos = 0;
            week++;
        }
    }
    
    week = 0;
    for(int i = 1; i <= month_two; i++)
    {
        cal_two[week][pos] = i;
        pos++;
        if(pos > 6)
        {
            pos = 0;
            week++;
        }
    }
    
    week = 0;
    for(int i = 1; i <= month_three; i++)
    {
        cal_three[week][pos] = i;
        pos++;
        if(pos > 6)
        {
            pos = 0;
            week++;
        }
    }
    
    for(int i=0; i<6; i++)
    {
        for(int j=0;j<7; j++)
        {
            if(cal_one[i][j] == 0)
                printf("   ");
            else
                printf("%2d ", cal_one[i][j]);
            
            if(j == 6)
                printf(" ");
        }
        
        for(int j=0;j<7; j++)
        {
            if(cal_two[i][j] == 0)
                printf("   ");
            else
                printf("%2d ", cal_two[i][j]);
            
            if(j == 6)
                printf(" ");
        }
        
        for(int j=0;j<7; j++)
        {
            if(cal_three[i][j] == 0)
                printf("   ");
            else
                printf("%2d ", cal_three[i][j]);
            
            if(j == 6)
                printf("\n");
        }
    }
    //printf("\n");
}

/* 判断一个非负整数有几位数字 */
- (int) numOfInt: (int) number
{
    if (number < 0)
        return 0;
    else if(number <= _numTemp[0])
        return 1;
    else if(number <= _numTemp[1])
        return 2;
    else if(number <= _numTemp[2])
        return 3;
    else if(number <= _numTemp[3])
        return 4;
    else if(number <= _numTemp[4])
        return 5;
    else if(number <= _numTemp[5])
        return 6;
    else if(number <= _numTemp[6])
        return 7;
    else if(number <= _numTemp[7])
        return 8;
    else if(number <= _numTemp[8])
        return 9;
    
    return 0;
}

/* 判断某年是不是闰年 */
- (BOOL) isLeapYear:(int) year
{
    return self.year%100 == 0 ? (self.year%400 == 0 ? YES:NO) : (self.year%4 == 0 ? YES:NO);
}

+ (void) printNoSuchCommand
{
    printf("usage: ./cal [-m month] [year]\n       month: 1~12\n       year: 1~9999");
}

@end