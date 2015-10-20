//
//  Cal.h
//  HomeWork
//
//  Created by linbo on 15/10/18.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cal : NSObject{
    int year;
    int month;
    int m1[6][7];
    int m2[6][7];
    int m3[6][7];
    int m4[6][7];
    int m5[6][7];
    int m6[6][7];
    int m7[6][7];
    int m8[6][7];
    int m9[6][7];
    int m10[6][7];
    int m11[6][7];
    int m12[6][7];
}

-(void) setYear:(int)y;
-(void) setMonth:(int)m;
- (int) calculateWeek;
-(BOOL) isRunYear:(int)y;
-(bool) isSpecialYear:(int)y;
-(void) printYear;
-(void) printMonth:(int)quarter;
-(void)printWeek;
-(void)printDays;
-(void) everyMonth;
-(void) printSingleMonth;

//- (void) test;

@end
