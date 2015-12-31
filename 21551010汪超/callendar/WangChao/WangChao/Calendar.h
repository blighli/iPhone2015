//
//  Calendar.h
//  WangChao
//
//  Created by linbo on 15/10/23.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import "Foundation/Foundation.h"

@interface Calendar : NSObject
{
    int dayNum[12];
    char week[7][4];
    char month[12][20];
    int yyy;
    int mmm;
}

-(int) yyy;

-(int) mmm;

-(void) setDayNum;

-(void) setWeek;

-(void) setMonth;

- (int) calstr:(char*)st;

- (int) HandString:(NSString*)string;

- (bool) isLeapYear:(int)year;

- (int) judgeDayDay:(int)year Month:(int)m Day:(int)day;

- (int) judgeMonthDay:(int)year Month:(int)m;

- (int) judgeYearFirstDay:(int)year;

- (void) print:(int)year Month:(int)m;

- (void) printY:(int)year;


@end

