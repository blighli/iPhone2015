//
//  Lynn_Cal.m
//  OCHomeWork02
//
//  Created by zhu on 15/10/18.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "Lynn_Cal.h"

@implementation Lynn_Cal

-(instancetype)init
{
    //[super init];
    _months = [NSArray arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月", nil];
    return self;
}

-(void) printBlank:(long)count
{
    for (int i = 0; i<count; i++)
    {
        printf(" ");
    }
}

-(void) printMonthsInYear:(long)month
{
    if (month<11)
    {
        [self printBlank:8];
        const char *ch = [[_months objectAtIndex:month-1] UTF8String];
        printf("%s",ch);
        [self printBlank:10];
    }
    else
    {
        [self printBlank:7];
        const char *ch = [[_months objectAtIndex:month-1] UTF8String];
        printf("%s",ch);
        [self printBlank:9];
    }
}

-(void) printYear:(NSDateComponents*)comp
{
    
    NSDateComponents* compN = [[NSDateComponents alloc]init];
    compN.year = comp.year;
    compN.month = 1;
    compN.day = 1;
    
    NSDateComponents* compNew = [self makeDateComponents:compN];
    
    // 打印年份
    [self printBlank:29];
    printf("%4ld\n\n",compNew.year);
    
    // 打印月份
    int curMonthDay[12] = { 1, 1, 1,
                            1, 1, 1,
                            1, 1, 1,
                            1, 1, 1};
    
    NSDateComponents* comps[12];
    
    for (int i = 0; i<12; i++)
    {
        comps[i] = [self makeDateComponents:compNew];
        compNew.month++;
    }
    
    for (int j = 0; j<4; j++)
    {
        
        for (int i = 0; i<3; i++)
        {
            [self printMonthsInYear:comps[j*3+i].month];
        }
        printf("\n");
        
        for (int i = 0; i<2; i++)
        {
            printf("日 一 二 三 四 五 六  ");
        }
        printf("日 一 二 三 四 五 六\n");
        
        // 打印日期
        for (int rows = 0; rows < 6; rows++)
        {
            for (int i = 0; i<3; i++)
            {
                int curMonthDays = [self countDays:comps[j*3+i].month inYear:comps[j*3+i].year];
                long week = comps[j*3+i].weekday - 1;
                if (rows == 0)
                {
                    [self printBlank:3*week];
                }
                
                for (int k = curMonthDay[j*3+i]; k<43; k++)
                {
                    if (k <= curMonthDays)
                    {
                        printf("%2d ",k);
                    }
                    else
                    {
                        printf("   ");
                    }
                    curMonthDay[3*j+i]++;
                    if ((k+week)%7 == 0)
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

-(NSDateComponents*)makeDateComponents:(NSDateComponents*)comp
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [gregorian dateFromComponents:comp];
    unsigned unitFlags =  NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    NSDateComponents* compNew = [gregorian components:unitFlags fromDate:date];
    return compNew;
}

-(void) printMonth:(NSDateComponents*)comp
{
    
    NSDateComponents* compN = [[NSDateComponents alloc]init];
    compN.year = comp.year;
    compN.month = comp.month;
    compN.day = 1;
    
    NSDateComponents* compNew = [self makeDateComponents:compN];
    [self print:compNew];
}

- (int)countDays:(long)month inYear:(long)year
{
    int count;
    if (month == 2) {
        if ((year%4 == 0 && year%100!=0) || year%400 ==0)
        {
            count = 29;
        }
        else
        {
            count = 28;
        }
        
    }
    else if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
    {
        count = 31;
    }
    else
    {
        count = 30;
    }
    return count;
}

-(void)print:(NSDateComponents*)compNew
{
   
    long year = compNew.year;
    long month = compNew.month;
    long week = compNew.weekday;
    long day = compNew.day;
    int i;
    const char *ch = [[_months objectAtIndex:month-1] UTF8String];
    if (month<11)
    {
        printf("     %s %ld\n",ch, year);
    }
    else
    {
        printf("    %s %ld\n",ch, year);
    }
    
    printf("日 一 二 三 四 五 六\n");
    for ( i = 1; i<week; i++) {
        printf("   ");
    }
    
    int count = [self countDays:month inYear:year];

    
    while (i<43) {
        if (day > count) {
            printf("   ");
        }
        else{
            printf("%2ld ",day);
        }
        if (i%7 == 0) {
            printf("\n");
        }
        
        day++;
        i++;
    }
}
@end
