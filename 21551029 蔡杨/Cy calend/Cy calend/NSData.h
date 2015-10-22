//
//  NSData.h
//  Cy calend
//
//  Created by zhengxiang on 15/10/19.
//  Copyright © 2015年 Big Nerd Banch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData : NSObject

- (NSUInteger)numberOfDaysInCurrentMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}

@end
