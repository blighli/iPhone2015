//
//  main.m
//  Project1
//
//  Created by Mz on 14-10-7.
//  Copyright (c) 2014年 Zorro M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCalendar.h"

// Add exctention to NSArray
@interface NSArray (ArgumentConvenience)
+ (NSArray *) arrayWithArguments:(const char *[]) argv
                           count:(int) argc;
@end

@implementation NSArray (ArgumentConvenience)
+ (NSArray *)arrayWithArguments:(const char *[])argv count:(int)argc {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:argc];
    for (int i = 1; i < argc; i++) {
        [array addObject:[NSString stringWithCString:argv[i]
                                            encoding:NSASCIIStringEncoding]];
    }
    return array;
}
@end

void systemcal(NSArray *args) {
    NSMutableString *cmd = [NSMutableString stringWithString: @"cal"];
    for (NSString *arg in args) {
        [cmd appendFormat:@" %@", arg];
    }
    NSLog(@"%@", cmd);
    system([cmd cStringUsingEncoding:NSASCIIStringEncoding]);
}

void Error(NSString *s) {
    printf("cal: %s\n", [s cStringUsingEncoding:NSUTF8StringEncoding]);
    exit(1);
}

void validateYear(int year) {
    if (year < 1 || year > 9999	) {
        Error([NSString stringWithFormat:@"year %d not in range 1..9999", year]);
    }
}

void validateMonth(int month) {
    if (month < 1 || month > 12) {
        Error([NSString stringWithFormat:@"month %d not in range 1..12", month]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *args = [NSArray arrayWithArguments:argv count:argc];
        MyCalendar *cal = nil;
        switch (args.count) {
            case 0:
                cal = [[MyCalendar alloc] init];
                [cal printMonth];
                break;
            case 1:
                if ([@"-y" compare:args[0]] == NSOrderedSame) {
                    cal = [[MyCalendar alloc] init];
                } else {
                    validateYear([args[0] intValue]);
                    cal = [[MyCalendar alloc] initWithYear:[args[0] intValue]];
                }
                [cal printYear];
                break;
            case 2:
                if ([@"-m" compare:args[0]] == NSOrderedSame) {
                    validateMonth([args[1] intValue]);
                    cal = [[MyCalendar alloc] initWithMonth:[args[1] intValue]];
                    [cal printMonth];
                } else if ([@"-y" compare:args[0]] == NSOrderedSame){
                    validateYear([args[1] intValue]);
                    cal = [[MyCalendar alloc] initWithYear:[args[1] intValue]];
                    [cal printYear];
                } else {
                    validateYear([args[1] intValue]);
                    validateMonth([args[0] intValue]);
                    cal = [[MyCalendar alloc] initWithYear:[args[1] intValue]
                                                  andMonth:[args[0] intValue]];
                    [cal printMonth];
                }
                break;
            default:
                systemcal(args);
                break;
        }
    }
    return 0;
}
