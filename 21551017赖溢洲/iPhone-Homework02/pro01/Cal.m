//
//  Cal.m
//  pro01
//
//  Created by 赖溢洲 on 15/10/17.
//  Copyright © 2015年 赖溢洲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cal.h"

typedef NS_ENUM(NSUInteger, ErrorType)
{
    ErrorTypeNone,
    ErrorTypeUncertain,
    ErrorTypeIllegalOption,
};

@interface Cal ()

@property (copy, nonatomic) NSArray *argvArray;
@property (strong, nonatomic) NSArray *numberArray;

@end

@implementation Cal

- (instancetype)initWithArray:(NSArray *)argv
{
    if (self = [super init])
    {
        
        _argvArray = [argv copy];
        _numberArray = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    }
    
    return self;
}

- (void)Print{
    
    if (self.argvArray.count == 1)
    {
        [self printCalendarMonth:[self currentMonth] year:[self currentYear]];
        
    }
    else if (self.argvArray.count == 2)
    {

        NSInteger year;
        ErrorType type = [self isLegalM:self.argvArray[1]];
        NSString *str;
        
        switch (type)
        {
            case ErrorTypeIllegalOption:
                str = self.argvArray[1];
                printf("Cal: illegal option -- %s\n",str.UTF8String);
                
                break;
            case ErrorTypeNone:
                printf("Cal: option requires an argument -- m\n");
                printf("usage: Cal -m month\n");
                break;
                
            case ErrorTypeUncertain:
                year = [self isLegalYear:self.argvArray[1]];
                if (year) {
                    [self printCalendarYear:year];
                }
                break;
        }
        
    }
    else if (self.argvArray.count == 3){
       
        ErrorType type = [self isLegalM:self.argvArray[1]];
        NSInteger month;
        NSInteger year;
        NSString *str;
        
        switch (type)
        {
            case ErrorTypeIllegalOption:
                str = self.argvArray[1];
                printf("Cal: illegal option -- %s\n",str.UTF8String);
                break;
            case ErrorTypeNone:
                month = [self isLegalMonth:self.argvArray[2]];
                if (month) {
                    [self printCalendarMonth:month year:[self currentYear]];
                }
                break;
            case ErrorTypeUncertain:
                month = [self isLegalMonth:self.argvArray[1]];
                year = [self isLegalYear:self.argvArray[2]];
                if (year && month) {
                    [self printCalendarMonth:month year:year];
                }
                break;
        }
    }
}

- (ErrorType)isLegalM:(NSString *)string
{
    ErrorType type;
    NSString *firstChar = [string substringToIndex:1];
    if ([firstChar isEqualToString:@"-"]) {
        NSString *secondChar = [string substringFromIndex:1];
        if ([secondChar isEqualToString:@"m"]) {
            type = ErrorTypeNone;
        }else{
            type = ErrorTypeIllegalOption;
        }
    }else{
        type = ErrorTypeUncertain;
    }
    return type;
}

- (NSInteger)isLegalYear:(NSString *)yearString
{
    NSInteger year = [yearString integerValue];
    if (year <= 0 || year > 9999) {
        printf("Cal: year %s not in range 1..9999\n",yearString.UTF8String);
        return 0;
    }else
        return year;
}

- (NSInteger)isLegalMonth:(NSString *)monthString
{
    NSInteger month = [monthString integerValue];
    if (month <= 0 || month > 12) {
        printf("Cal: %s is neither a month number (1..12) nor a name\n",monthString.UTF8String);
        return 0;
    }else
        return month;
}

- (NSInteger)currentMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comp = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
    return comp.month;
}

- (NSInteger)currentYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear fromDate:currentDate];
    return comp.year;
}

- (void)printCalendarYear:(NSInteger)year
{
    NSMutableArray *monthArray = [NSMutableArray arrayWithCapacity:12];
    for (int i = 0; i < 12; i++)
    {
        NSArray *daysArray = [self createDaysArrayWithMonth:i+1 year:year];
        [monthArray addObject:daysArray];
    }
    
    printf("                             %ld\n",year);
    printf("\n");
    
    for (int i = 0; i < 4; i++)
    {
        NSString *str1 = self.numberArray[i * 3];
        NSString *str2 = self.numberArray[i * 3 + 1];
        NSString *str3 = self.numberArray[i * 3 + 2];
        if (i == 3)
        {
            printf("        %s                  %s                 %s\n",str1.UTF8String,str2.UTF8String,str3.UTF8String);
        }else{
            printf("        %s                   %s                   %s \n",str1.UTF8String,str2.UTF8String,str3.UTF8String);
            }
        
        printf("S  M  T  W  T  F  S   S  M  T  W  T  F  S   S  M  T  W  T  F  S\n");
        for (int j = 0; j < 6; j++) {
            
            for (int m = 0; m < 3; m ++) {
                NSArray *dayArray = monthArray[i * 3 + m];
                NSArray *lineArray = dayArray[j];
                for (NSString *str in lineArray) {
                    printf("%s ",str.UTF8String);
                }
                printf(" ");
            }
            printf("\n");
        }
    }
}

- (void)printCalendarMonth:(NSInteger)month year:(NSInteger)year
{
    NSArray *daysArray = [self createDaysArrayWithMonth:month year:year];
    NSString *monthString = self.numberArray[month-1];
    printf("     %s  %ld\n",monthString.UTF8String,year);
    printf("S  M  T  W  T  F  S\n");
    for (int i = 0; i < daysArray.count; i++) {
        NSArray *lineArray = daysArray[i];
        for (int j = 0; j < lineArray.count; j++) {
            NSString *str = lineArray[j];
            printf("%s ",str.UTF8String);
        }
        printf("\n");
    }
}

- (NSInteger)daysNumberInMonth:(NSInteger)month year:(NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *specifyComponents= [[NSDateComponents alloc] init];
    [specifyComponents setYear:year];
    [specifyComponents setMonth:month+1];
    [specifyComponents setDay:0];
    [specifyComponents setHour:8];
    
    NSDate *date = [calendar dateFromComponents:specifyComponents];
    
    NSInteger flags = NSCalendarUnitDay;
    
    NSDateComponents *comp = [calendar components:flags fromDate:date];
    return comp.day;
}

- (NSArray *)createDaysArrayWithMonth:(NSInteger)month year:(NSInteger)year
{
    NSMutableArray *daysArray = [NSMutableArray arrayWithCapacity:6];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *specifyComponents= [[NSDateComponents alloc] init];
    [specifyComponents setYear:year];
    [specifyComponents setMonth:month];
    [specifyComponents setDay:1];
    [specifyComponents setHour:8];
    
    NSDate *date = [calendar dateFromComponents:specifyComponents];
    
    NSInteger flags = NSCalendarUnitWeekday;
    
    NSDateComponents *comp = [calendar components:flags fromDate:date];
    
    NSInteger daysNumber = [self daysNumberInMonth:month year:year];
    
    int number = 1;
    for (int i = 0; i < 6; i++) {
        NSMutableArray *lineArray = [NSMutableArray arrayWithCapacity:7];
        for (int j = 0; j < 7; j++) {
            NSString *numberString;
            if (number > daysNumber) {
                numberString = @"  ";
            }else{
                if (i == 0) {
                    if (j < comp.weekday - 1) {
                        numberString = @"  ";
                    }else{
                        numberString = [NSString stringWithFormat:@" %d",number];
                        number ++;
                    }
                }else{
                    numberString = number<10? [NSString stringWithFormat:@" %d",number] : [NSString stringWithFormat:@"%d",number];
                    number ++;
                }
            }
            [lineArray addObject:numberString];
        }
        [daysArray addObject:lineArray];
    }
    
    return daysArray;
}

@end
