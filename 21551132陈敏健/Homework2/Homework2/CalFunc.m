//
//  CalFunc.m
//  Homework2
//
//  Created by 敏少eclipse on 15/10/20.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import "CalFunc.h"

@interface CalFunc()
@property (nonatomic,strong) NSArray * yearMap;
@property (nonatomic,strong) NSArray * monthMap;
@property (nonatomic,strong) NSArray * dayMap;

@end
@implementation CalFunc

-(void)printCalByYear:(NSInteger)year
{
    
    [self insertDataWithYear:year];
    
    printf("                             %ld\n\n",(long)year);
    printf("        一月                  二月                  三月\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
    for(int i=0;i<6;i++)
    {
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:0] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:1] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:2] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("\n\n");
    }
    printf("        四月                  五月                  六月\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
    for(int i=0;i<6;i++)
    {
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:3] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:4] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:5] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("\n\n");
    }
    printf("        七月                  八月                  九月\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
    for(int i=0;i<6;i++)
    {
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:6] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:7] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:8] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("\n\n");
    }
    printf("        十月                 十一月                十二月\n");
    printf("日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六\n");
    for(int i=0;i<6;i++)
    {
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:9] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:10] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("  ");
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:11] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("\n");
    }
}

-(void)printCalByYear:(NSInteger)year Month:(NSInteger)month
{
    if (month>=10) {
        printf("    %s %ld\n",[[_monthMap objectAtIndex:month] UTF8String],year);
    }
    else
        printf("     %s %ld\n",[[_monthMap objectAtIndex:month] UTF8String],year);
    for (int i=0; i<_dayMap.count; i++) {
        printf("%s ",[[_dayMap objectAtIndex:i] UTF8String]);
    }
    printf("\n");
    [self insertDataWithYear:year];
    for (int i=0; i<6; i++) {
        for (int j=0; j<7; j++) {
            printf("%s",[[[[_yearMap objectAtIndex:month] objectAtIndex:i] objectAtIndex:j] UTF8String]);
        }
        printf("\n");
    }
    
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        
        NSMutableArray *monthTemp=[NSMutableArray array];
        [monthTemp addObject:@"一月"];
        [monthTemp addObject:@"二月"];
        [monthTemp addObject:@"三月"];
        [monthTemp addObject:@"四月"];
        [monthTemp addObject:@"五月"];
        [monthTemp addObject:@"六月"];
        [monthTemp addObject:@"七月"];
        [monthTemp addObject:@"八月"];
        [monthTemp addObject:@"九月"];
        [monthTemp addObject:@"十月"];
        [monthTemp addObject:@"十一月"];
        [monthTemp addObject:@"十二月"];
        _monthMap=monthTemp;
        
        NSMutableArray *dayTemp=[NSMutableArray array];
        [dayTemp addObject:@"日"];
        [dayTemp addObject:@"一"];
        [dayTemp addObject:@"二"];
        [dayTemp addObject:@"三"];
        [dayTemp addObject:@"四"];
        [dayTemp addObject:@"五"];
        [dayTemp addObject:@"六"];

        _dayMap=dayTemp;
        
        NSMutableArray *yearTemp=[NSMutableArray array];
        for (int i=0; i<12; i++) {
            NSMutableArray * temp=[NSMutableArray array];
            for(int j=0;j<6;j++)
            {
                NSMutableArray *temp1=[NSMutableArray array];
                for (int k=0; k<7; k++) {
                    if (k==0) {
                       [temp1 addObject:@"  "];
                    }
                    else
                       [temp1 addObject:@"   "];
                }
                [temp addObject:temp1];
            }
            [yearTemp addObject:temp];
        }
        _yearMap=yearTemp;
        
    }
    return self;
}

-(void)insertDataWithYear:(NSInteger)year
{
    for (int i=0; i<12; i++) {
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *comp = [[NSDateComponents alloc]init];
        [comp setYear:year];
        [comp setMonth:i+1];
        [comp setDay:1];
        NSDate *date = [cal dateFromComponents:comp];
        NSInteger weekDay = [cal component:NSCalendarUnitWeekday fromDate:date];
        //NSLog(@"%ld",weekDay);
        
        int monthDayCount=[self getDayCountWithYear:year Month:i+1];
        //printf("%d\n",monthDayCount);
        int day=1;
        for (int j=0; j<6; j++) {
            for (int k=0; k<7; k++) {
                //printf("%d---%d\n",weekDay,k+1);
                if (k+1==weekDay&&day<=monthDayCount) {
                    if (k==0) {
                        [[[_yearMap objectAtIndex:i] objectAtIndex:j] replaceObjectAtIndex:k withObject:[NSString stringWithFormat:@"%2d",day]];
                    }
                    else
                        [[[_yearMap objectAtIndex:i] objectAtIndex:j] replaceObjectAtIndex:k withObject:[NSString stringWithFormat:@" %2d",day]];
                    day++;
                    weekDay++;
                }
                else{
                    if (k==0) {
                       [[[_yearMap objectAtIndex:i] objectAtIndex:j] replaceObjectAtIndex:k withObject:[NSString stringWithFormat:@"  "]];
                    }
                    else
                       [[[_yearMap objectAtIndex:i] objectAtIndex:j] replaceObjectAtIndex:k withObject:[NSString stringWithFormat:@"   "]];
                }
                if (weekDay==8) {
                    weekDay=1;
                    break;
                }
            }
        }
    }
}

-(NSInteger)getDayCountWithYear:(NSInteger)year Month:(NSInteger)month
{
    int dayCount[12]={31,28,31,30,31,30,31,31,30,31,30,31};
    if ((year%4==0&&year%100!=0)||year%400==0) {
        dayCount[1]=29;
    }
    //printf("%d\n",dayCount[month-1]);
    return dayCount[month-1];
}

+(instancetype)calFunc
{
    return [[CalFunc alloc] init];
}

@end
