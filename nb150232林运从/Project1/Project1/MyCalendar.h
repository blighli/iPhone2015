//
//  MyCalendar.h
//  Project1
//
//  Created by Mz on 14-10-7.
//  Copyright (c) 2014年 Zorro M. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCalendar : NSObject

@property (retain) NSDateComponents* components;

- (instancetype) initWithYear:(int) year;
- (instancetype) initWithYear:(int) year andMonth:(int) month;
- (instancetype) initWithMonth:(int) month;

- (void) printYear;
- (void) printMonth;
@end
