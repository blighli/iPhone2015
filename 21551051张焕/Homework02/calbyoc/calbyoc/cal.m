//
//  cal.m
//  calbyoc
//
//  Created by 张焕 on 10/16/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cal.h"

#define MONTH_NUM 12
#define WEEK_NUM 6
#define YEAR_MONTH_ROW_NUM 4
#define YEAR_MONTH_COL_NUM 3
typedef NS_ENUM(NSUInteger, State) {
    StateNoneArgument,
    StateUncertain,
    StateIllegalOption,
};
//////////////////////////////////////////////////////////////
@interface Cal ()

@property (copy, nonatomic) NSArray* argvArray;
@property (strong, nonatomic) NSArray* monthNames;

@end
//////////////////////////////////////////////////////////////
@implementation Cal

- (instancetype)initWithArray:(NSArray *)argv{
    if (self = [super init]) {
        _argvArray = [argv copy];
        _monthNames = @[ @"January", @"February", @"March", @"April", @"May",
                         @"June", @"July", @"August", @"September", @"October",
                         @"November", @"December"];
    }
    
    return self;
}

- (void)execute{
    
    if (self.argvArray.count == 1) {
        //直接输出当前月份
        [self printMonthCalendar:[self currentMonth] inYear:[self currentYear]];
        
    }else if (self.argvArray.count == 2) {
        //输出特定年份
        NSInteger year;
        State type = [self getState:self.argvArray[1]];
        NSString* str;
        switch (type) {
            case StateIllegalOption:
                str = self.argvArray[1];
                printf("cal: illegal option -- %s\n",str.UTF8String);
                
                break;
            case StateNoneArgument:
                printf("cal: option requires an argument -- m\n");
                printf("usage: cal -m month\n");
                break;
            default:
                year = [self getYearByString:self.argvArray[1]];
                if (year) {
                    [self printYearCalendar:year];
                }
                break;
        }
        
    }else if (self.argvArray.count == 3){
        //如果用输入了两个参数
        State type = [self getState:self.argvArray[1]];
        NSInteger month;
        NSInteger year;
        NSString *str;
        switch (type) {
            case StateIllegalOption:
                str = self.argvArray[1];
                printf("cal: illegal option -- %s\n",str.UTF8String);
                break;
            case StateNoneArgument:
                month = [self getMonthByString:self.argvArray[2]];
                if (month) {
                    [self printMonthCalendar:month inYear:[self currentYear]];
                }
                break;
            default:
                month = [self getMonthByString:self.argvArray[1]];
                year = [self getYearByString:self.argvArray[2]];
                if (year && month) {
                    [self printMonthCalendar:month inYear:year];
                }
                break;
        }
    }
}

- (State)getState:(NSString *)string{
    State curState;
    NSString* firstChar = [string substringToIndex:1];
    if ([firstChar isEqualToString:@"-"]) {
        NSString* secondChar = [string substringFromIndex:1];
        if ([secondChar isEqualToString:@"m"]) {
            curState = StateNoneArgument;
        }else{
            curState = StateIllegalOption;
        }
    }else{
        curState = StateUncertain;
    }
    return curState;
}


/*
 获取月份
 正确返回正确月份
 不正确返回0
 */
- (NSInteger)getMonthByString:(NSString *)monthStr{
    NSInteger month = [monthStr integerValue];
    if (month <= 0 || month > 12) {
        printf("cal: %s is neither a month number (1..12) nor a name\n",monthStr.UTF8String);
        return NO;
    }else
        return month;
}

- (NSInteger)getYearByString:(NSString *)yearStr{
    NSInteger year = [yearStr integerValue];
    if (year <= 0 || year >= 10000) {
        printf("cal: year %s not in range 1..9999\n",yearStr.UTF8String);
        return NO;
    }else{
        return year;
    }
}
- (NSInteger)currentYear{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* now = [NSDate date];
    
    NSDateComponents* components = [calendar components:NSCalendarUnitYear fromDate:now];
    return components.year;
}



- (NSInteger)currentMonth{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDate* now = [NSDate date];
    NSDateComponents* components = [calendar components:NSCalendarUnitMonth fromDate:now];
    
    return components.month;
}

- (void)printYearCalendar:(NSInteger)year{
    NSMutableArray* monthArray = [NSMutableArray arrayWithCapacity:MONTH_NUM];
    for (int i = 0; i < MONTH_NUM; i++) {
        NSArray *daysArray = [self createDaysArrayWithMonth:i+1 year:year];
        [monthArray addObject:daysArray];
    }
    
    printf("                            %ld\n",year);
    printf("\n");
    
    for (int i = 0; i < YEAR_MONTH_ROW_NUM; i++) {
        NSString *str1 = self.monthNames[i * YEAR_MONTH_COL_NUM];
        NSString *str2 = self.monthNames[i * YEAR_MONTH_COL_NUM+ 1];
        NSString *str3 = self.monthNames[i * YEAR_MONTH_COL_NUM + 2];
        int str1StartPos = (64/3-str1.length)/2;
        int str2StartPos = 64/2 - str2.length/2;
        int str3StartPos = 64 - 64/6 - str3.length/2;
        [self printSpace:str1StartPos];
        printf("%s", str1.UTF8String);
        [self printSpace:(str2StartPos - str1StartPos - str1.length)];
        printf("%s", str2.UTF8String);
        [self printSpace:(str3StartPos - str2StartPos - str2.length)];
        printf("%s", str3.UTF8String);
        printf("\n");
        printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
        for (int j = 0; j < 6; j++) {
            
            for (int m = 0; m < 3; m++) {
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

-(void) printSpace: (NSInteger)num{
    for (int i = 0; i < num; i++) {
        printf(" ");
    }
}

- (void)printMonthCalendar:(NSInteger)month inYear:(NSInteger)year{
    NSArray* daysArray = [self createDaysArrayWithMonth:month year:year];
    NSString* monthString = self.monthNames[month-1];
    printf("     %s %ld\n",monthString.UTF8String,year);
    printf("Su Mo Tu We Th Fr Sa\n");
    for (int i = 0; i < daysArray.count; i++) {
        NSArray *lineArray = daysArray[i];
        for (int j = 0; j < lineArray.count; j++) {
            NSString *str = lineArray[j];
            printf("%s ",str.UTF8String);
        }
        printf("\n");
    }
}

- (NSInteger)daysNumberInMonth:(NSInteger)month year:(NSInteger)year{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *customedComp = [[NSDateComponents alloc] init];
    [customedComp setYear:year];
    [customedComp setMonth:month+1];
    [customedComp setDay:0];
    [customedComp setHour:8];
    
    NSDate *date = [calendar dateFromComponents:customedComp];
    NSInteger flags = NSCalendarUnitDay;
    
    NSDateComponents *components = [calendar components:flags fromDate:date];
    return components.day;
}

- (NSArray*)createDaysArrayWithMonth:(NSInteger)month year:(NSInteger)year{
    NSMutableArray *daysArray = [NSMutableArray arrayWithCapacity:6];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *customedComp= [[NSDateComponents alloc] init];
    [customedComp setYear:year];
    [customedComp setMonth:month];
    [customedComp setDay:1];
    [customedComp setHour:8];
    
    NSDate *date = [calendar dateFromComponents:customedComp];
    
    NSInteger flags = NSCalendarUnitWeekday;
    
    NSDateComponents *components = [calendar components:flags fromDate:date];
    
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
                    if (j < components.weekday - 1) {
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