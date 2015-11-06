//
//  MyCalender.m
//  Work02
//
//  Created by 黄梦妃 on 15/10/17.
//  Copyright © 2015年 黄梦妃. All rights reserved.
//

#import "MyCalendar.h"


@implementation MyCalendar

-(void)calCurrentMonth
{
    
    [self LogWithMonth:[self getCurrentMonth] andWithYear:[self getCurrentYear]];
    [self LogWeek];
    printf("\n");
    
    [self printCalWithArr:[self proCalenderWithMonth:[self getCurrentMonth] andWithYear:[self getCurrentYear]]];
}

-(void)calWithMonth:(NSInteger)month
{
    [self LogWithMonth:month andWithYear:[self getCurrentYear]];
    [self LogWeek];
    printf("\n");
    [self printCalWithArr:[self proCalenderWithMonth:month andWithYear:[self getCurrentYear]]];
}

-(void)calWithYear:(NSInteger)year
{
    [self LogWithYear:year];
    printf("\n");
    
    
    
    for(NSInteger i=0;i<4;i++)
    {
        [self LogWithMonth:i*3+1];
        printf("%2s","");
        [self LogWithMonth:i*3+2];
        printf("%2s","");
        [self LogWithMonth:i*3+3];
        
        printf("\n");

        [self LogWeek];
        printf("%2s","");
        [self LogWeek];
        printf("%2s","");
        [self LogWeek];
        printf("\n");
        
        NSArray *arr=@[
                       [self proCalenderWithMonth:i*3+1 andWithYear:year],
                        [self proCalenderWithMonth:i*3+2 andWithYear:year],
                       [self proCalenderWithMonth:i*3+3 andWithYear:year],
                           ];
        [self printCalWithThreeArr:arr];
        

        
    }
}

-(void)calWithMonth:(NSInteger)month andWithYear:(NSInteger)year
{
    [self LogWithMonth:month andWithYear:year];
    [self LogWeek];
    printf("\n");
    [self printCalWithArr:[self proCalenderWithMonth:month andWithYear:year]];
}

-(void)printCalWithArr:(NSArray *)arr
{

    for (NSInteger i=0; i<6; i++) {
        for (NSInteger j=0; j<7; j++) {
             NSNumber *n=arr[i][j];
            if([n intValue]!=0)
            {
                printf("%3d",[n intValue]);
            }
            else
            {
                printf("%3s","");
            }
        }
        printf("\n");
    }
}

-(void)printCalWithThreeArr:(NSArray *)arr
{
    NSArray *arr1=arr[0];
    NSArray *arr2=arr[1];
    NSArray *arr3=arr[2];
    
    for (NSInteger i=0; i<6; i++) {
        for (NSInteger j=0; j<7; j++) {
            NSNumber *n=arr1[i][j];
            if([n intValue]!=0)
            {
                printf("%3d",[n intValue]);
            }
            else
            {
                printf("%3s","");
            }
        }
        printf("%2s","");
        for (NSInteger j=0; j<7; j++) {
            NSNumber *n=arr2[i][j];
            if([n intValue]!=0)
            {
                printf("%3d",[n intValue]);
            }
            else
            {
                printf("%3s","");
            }
        }
        printf("%2s","");
        for (NSInteger j=0; j<7; j++) {
            NSNumber *n=arr3[i][j];
            if([n intValue]!=0)
            {
                printf("%3d",[n intValue]);
            }
            else
            {
                printf("%3s","");
            }
        }
        
        printf("\n");
    }
}

-(NSArray *)proCalenderWithMonth:(NSInteger )month andWithYear:(NSInteger )year
{
    NSInteger week=[self getFirstWeekDayWithMonth:month andWithYear:year];
    NSInteger days=[self getDaysWithMonth:month andWithYear:year];
    NSInteger times=1;
    NSMutableArray *marr=[NSMutableArray arrayWithCapacity:6];
    NSMutableArray *marr1=[NSMutableArray arrayWithCapacity:7];
    for (NSInteger i=0; i<7; i++) {
        marr1[i]=@0;
    }
    for (NSInteger i=0; i<6; i++) {
    
        marr[i]=[marr1 mutableCopy];
    }
   
    
    NSInteger j;
    for (NSInteger i=0; i<6; i++) {
        
        j=i==0?week-1:0;
        
        for(;j<7;j++)
        {
            marr[i][j]=[NSNumber numberWithInteger:times];
            times++;
            
            if(times>days)
            {
                return marr;
            }
        }
    }
    return marr;
}

//获取每月的天数
-(NSInteger)getDaysWithMonth:(NSInteger )month andWithYear:(NSInteger )year
{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDateComponents *comp =[[NSDateComponents alloc]init];
    comp.year=year;
    comp.month=month;
    
    
    NSDate *date=[gregorian dateFromComponents:comp];
    
    NSRange days = [gregorian rangeOfUnit:NSCalendarUnitDay
                           inUnit:NSCalendarUnitMonth
                          forDate:date];
    return days.length;
}

-(NSInteger)getCurrentYear
{
    NSDate *today=[NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDateComponents *comp =[gregorian components:NSCalendarUnitYear fromDate:today];
    return comp.year;
}

-(NSInteger)getCurrentMonth
{
    NSDate *today=[NSDate date];
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDateComponents *comp =[gregorian components:NSCalendarUnitMonth fromDate:today];
    return comp.month;
}

//获取每月第一天是星期几
-(NSInteger)getFirstWeekDayWithMonth:(NSInteger )month andWithYear:(NSInteger )year
{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    NSDateComponents *weekdayComponents =[[NSDateComponents alloc]init];
    weekdayComponents.day = 1;
    weekdayComponents.month=month;
    weekdayComponents.year=year;
    NSDate *date=[gregorian dateFromComponents:weekdayComponents];
    
    NSUInteger firstDay = [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];  //该月的第10天星期几
    
    return firstDay;
}

-(void)LogWeek
{
    printf("%3s%3s%3s%3s%3s%3s%3s","Su","Mo","Tu","We","Th","Fr","Sa");
}

-(void)LogWithMonth:(NSInteger )month andWithYear:(NSInteger )year
{
    
    NSString *s=[self getStrWithMonth:month];

    printf("%9s  %4ld",[s UTF8String],(long)year);
    
    printf("\n");
}

-(void)LogWithMonth:(NSInteger )month
{
    NSString *s=[self getStrWithMonth:month];
    if(month%3==1)
    {
        printf("%12s",[s UTF8String]);
    }else
    {
        printf("%21s",[s UTF8String]);

    }
    
}

-(NSString *)getStrWithMonth:(NSInteger )month
{
    NSString *n=[NSString string];
    switch (month) {
        case 1:
            n=@"Jan";
            break;
        case 2:
            n=@"Feb";
            break;
        case 3:
            n=@"Mar";
            break;
        case 4:
            n=@"Apr";
            break;
        case 5:
            n=@"May";
            break;
        case 6:
            n=@"Jun";
            break;
        case 7:
            n=@"Jul";
            break;
        case 8:
            n=@"Aug";
            break;
        case 9:
            n=@"Sep";
            break;
        case 10:
            n=@"Oct";
            break;
        case 11:
            n=@"Nov";
            break;
        case 12:
            n=@"Dec";
            break;
        default:
            break;
    }

    return n;
}

-(void)LogWithYear:(NSInteger )year
{
    printf("%35ld",(long)year);
    printf("\n");
}



@end
