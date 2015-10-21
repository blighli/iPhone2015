//
//  MyCal.h
//  SecondIOSHomework
//
//  Created by 常惠源 on 15/10/20.
//  Copyright © 2015年 常惠源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCal : NSObject
{
    NSArray *monthArray;
}
- (void)showCurrentMonthOfThisYear;
- (void)showYear: (int)year;
- (void)showMonth: (NSDate *)date;
- (void)showMonthDetail:(int)year andMonth:(int) month;
- (void)showMonthAndYearTitle: (int)year andMonth: (int)month;
- (void)showOneWeekTitle;
- (void)showNextLine;
@end