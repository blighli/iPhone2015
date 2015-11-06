//
//  MyCalendar.m
//  Project1
//
//  Created by Mz on 14-10-7.
//  Copyright (c) 2014年 Zorro M. All rights reserved.
//

#import "MyCalendar.h"
#import "DateUtil.h"
static NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |
                             NSDayCalendarUnit | NSWeekdayCalendarUnit;

@implementation MyCalendar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.components = [DateUtil componentsOfThisMonth];
    }
    return self;
}

- (instancetype)initWithYear:(int) year {
    self = [super init];
    if (self) {
        self.components = [DateUtil componentsFromYear:year andMonth:1];
    }
    return self;
}

- (instancetype)initWithYear:(int)year andMonth:(int)month {
    self = [super init];
    if (self) {
        self.components = [DateUtil componentsFromYear:year andMonth:month];
    }
    return self;
}

- (instancetype)initWithMonth:(int)month {
    self = [super init];
    if (self) {
        self.components = [DateUtil componentsFromMonth:month];
    }
    return self;
}

- (void)printMonth {
    NSMutableArray *ss = [NSMutableArray arrayWithCapacity:8];
    for (int i = 0; i < 8; i++) {
        [ss addObject:[NSMutableString stringWithCapacity:100]];
    }
    [DateUtil generateMonthWithComponents:self.components into:ss hasYear:YES];
    for (NSString *s in ss) {
        printf("%s\n", [s cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

- (void)printYear {
    NSString *year = [[NSNumber numberWithInteger:self.components.year] stringValue];
    // first line
    int before = (64 -  (int)year.length) / 2;
    while (before--) printf(" ");
    printf("%s\n\n", [year cStringUsingEncoding:NSUTF8StringEncoding]);
    
    int y = (int) self.components.year;
    for (int row = 0; row < 4; row++) {
        NSMutableArray *ss = [NSMutableArray arrayWithCapacity:8];
        for (int i = 0; i < 8; i++) {
            [ss addObject:[NSMutableString stringWithCapacity:100]];
        }
        for (int col = 1; col <= 3; col++) {
            self.components = [DateUtil componentsFromYear: y andMonth:row * 3 + col];
            [DateUtil generateMonthWithComponents:self.components into:ss hasYear:NO];
            if (col < 3) {
                for (NSMutableString *s in ss) [s appendString:@"  "];
            }
        }
        for (NSString *s in ss) {
            printf("%s\n", [s cStringUsingEncoding:NSUTF8StringEncoding]);
        }
    }
}
@end	
