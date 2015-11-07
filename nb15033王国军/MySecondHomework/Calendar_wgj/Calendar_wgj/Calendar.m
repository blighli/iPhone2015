//
//  Calendar.m
//  Calendar_wgj
//
//  Created by 王国军 on 15/10/23.
//  Copyright © 2015年 王国军. All rights reserved.
//

#import "Calendar.h"

@implementation Calendar
{
    int days[24][43];
    NSArray *arrayChineseCharacter;
}



@synthesize day = _day, month = _month, year = _year;

- (instancetype)init
{
    self = [super init];
    if (self) {
        for (int i = 0; i < 24; i++) {
            for (int j = 0; j < 64; j++) {
                days[i][j] = 0;
            }
        }
    }
    return self;
}

- (void)printCalendarForYear
{
    
    [self monthOfYearArray];
    printf("                             %lu                        \n\n",_year);
    printf("          一月                  二月                  三月        ");
    printf("\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
    printf("\n");
    [self printMonthForYear:6 andLastRow:0];
    printf("        四月                  五月                  六月        ");
    printf("\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
    printf("\n");
    [self printMonthForYear:12 andLastRow:6];
    printf("        七月                  八月                  九月        ");
    printf("\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
    printf("\n");
    [self printMonthForYear:18 andLastRow:12];
    printf("        十月                 十一月                十二月        ");
    printf("\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六");
    printf("\n");
    [self printMonthForYear:24 andLastRow:18];
    
    
    
}

- (void)printMonthForYear:(int) row andLastRow:(int) lastRow
{
    int count = 0;
    int totalCount = 0;
    
    for (int i = lastRow; i < row; i++) {
        if (i == lastRow && days[i][0] == 0) {
            printf(" ");
        }
        totalCount = 0;
        count=0;
        for (int j = 0; j < 43; j++) {
            if (days[i][j] == 0) {
                count++;
                totalCount++;
                
            }else
            {
                int countNumber = 0;
                countNumber = count+count/2;
                if (count > 0) {
                    if (totalCount > 13 && count > 2) {
                        countNumber = countNumber -1 + (count % 2);
                        //                        printf(" \n totalcount= %i i= %i countNumber = %i\n",totalCount,i,countNumber);
                        totalCount = 0;
                    }else if (count == 2) {
                        countNumber = countNumber -1 + (count % 2);
                        //                        printf(" \ni = %i countNumber = %i\n",i,countNumber);
                        
                    }else if(count > 2)
                    {
                        countNumber = countNumber -1 ;
                    }
                    for (int p = 0; p < countNumber; p++) {
                        printf(" ");
                    }
                }
                count = 0;
                if (days[i][j] < 10) {
                    printf(" %i",days[i][j]);
                }else
                {
                    printf("%i",days[i][j]);
                }
                totalCount = 0;
            }
        }
        printf("\n");
    }
    
}

- (void)monthOfYearArray
{
    
    int dayNumberForMonth[13] = {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if((_year % 4 == 0 && _year % 100 != 0)||(_year % 400 == 0))
    {
        dayNumberForMonth[2] = 29;
    }else{
        dayNumberForMonth[2] = 28;
    }
    int x = 0;
    int pointTag = 0;
    for (int monthNumber = 1; monthNumber <= 12; monthNumber++) {
        
        if (monthNumber <= 3) {
            if (monthNumber == 1) {
                pointTag = 0;
            }
            x = 0;
        }else if (monthNumber <= 6)
        {
            if (monthNumber == 4) {
                pointTag = 0;
            }
            x = 6;
        }else if (monthNumber <= 9)
        {
            if (monthNumber == 7) {
                pointTag = 0;
            }
            x = 12;
        }else if (monthNumber <= 12)
        {
            if (monthNumber == 10) {
                pointTag = 0;
            }
            x = 18;
        }
        
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        [dateComponents setYear:_year];
        [dateComponents setMonth:monthNumber];
        [dateComponents setDay:1];
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *date = [calendar dateFromComponents:dateComponents];
        NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:date];
        NSUInteger weekday = [weekdayComponents weekday];
        int remainder = monthNumber % 3;
        int spaceStart = 0;
        if (remainder == 1) {
            spaceStart = 0;
        }
        if (remainder == 2) {
            spaceStart = 15;
        }
        if (remainder == 0) {
            spaceStart = 30;
        }
        pointTag = spaceStart;
        for (int k = 0; k < (weekday - 1) * 2; k++) {
            pointTag ++;
        }
        days[x][pointTag] = 1;
        pointTag++;
        for (int k = 2; k <= dayNumberForMonth[monthNumber]; k++) {
            
            if (weekday == 7) {
                x++;
                pointTag = spaceStart;
                
                days[x][pointTag] = k;
                pointTag++;
                weekday = 0;
            }else{
                pointTag++;
                days[x][pointTag] = k;
                pointTag++;
            }
            weekday++;
        }
    }
    //
    //        for (int i = 0; i < 43; i++) {
    //            printf(" %i",days[18][i]);
    //        }
    
    
}

- (void)printCalendarForMonth
{
    arrayChineseCharacter = [NSArray arrayWithObjects:@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",
                             @"九",@"十",@"十一",@"十二",nil];
    const char *monthOfCharacter = [[arrayChineseCharacter objectAtIndex:_month-1] UTF8String];
    printf("     %s月 %lu \n", monthOfCharacter , _year);
    printf("日 一 二 三 四 五 六\n");
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:_year];
    [dateComponents setMonth:_month];
    [dateComponents setDay:1];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [calendar dateFromComponents:dateComponents];
    NSDateComponents *weekdayComponents = [calendar components:NSCalendarUnitWeekday fromDate:date];
    NSUInteger weekday = [weekdayComponents weekday];
    for (int k = 0; k < (weekday - 1) * 3; k++) {
        printf(" ");
    }
    if (weekday == 1) {
        printf("1");
    }else
    {
        printf(" 1");
        
    }
    
    for (int k = 2; k <= _day; k++) {
        if (weekday == 7) {
            printf("\n");
            if (k<10) {
                printf(" ");
            }
            printf("%i",k);
            weekday = 0;
        }else if (k < 10) {
            printf("  ");
            printf("%i",k);
        }else{
            printf(" ");
            printf("%i",k);
        }
        weekday++;
        
    }
    printf("\n");
    
    
    
}


@end
