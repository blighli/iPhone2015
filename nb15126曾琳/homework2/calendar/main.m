//
//  main.m
//  calendar
//
//  Created by Mac on 15/10/19.
//  Copyright © 2015年 zenglin. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents* component = [[NSDateComponents alloc ] init];
        NSDate* date = [NSDate date];
        unsigned unitFlag = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday;
        NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        component = [calendar components:unitFlag fromDate:date];
        int year = (int)component.year;
        int month = (int)component.month;
        int week = (int)component.weekday + 1;
        
        int i = 1;
        printf("     %d  %d\n",month,year);
        printf("Su Mo Tu We Th Fr Sa\n");
        for (int row = 0; row < 6; row ++) {
            for (int col = 0 ; col < 7; col ++) {
                if (week > 0) {
                    printf("   ");
                    week --;
                } else {
                    printf("%2d ",i);
                    i++;
                    if (i > range.length) {
                        break;
                    }
                }
            }
            if (i > range.length) {
                break;
            }
            printf("\n");
        }
        printf("\n");
    }
    return 0;
}
