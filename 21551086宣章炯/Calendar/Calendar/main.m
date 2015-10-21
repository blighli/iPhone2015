//
//  main.m
//  Calendar
//
//  Created by John on 15/10/18.
//  Copyright © 2015年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Calendar.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int year,month;
        
        Calendar *calendar = [[Calendar alloc] init];
        
        switch (argc) {
                //cal
            case 1:
                [calendar showCurrentMonth];
                break;
                
            case 2:
                //cal 2015
                year = atoi(argv[1]);
                if(year <=0 || year > 9999){
                    NSLog(@"illegal year");
                } else {
                    [calendar showAllTheYear:year];
                }
                break;
                
            case 3:
                //cal -m 9
                if ([@"-m" isEqualToString:[NSString stringWithUTF8String:argv[1]]]){
                    month = atoi(argv[2]);
                    if (month <= 0 || month > 12) {
                        NSLog(@"illegal month");
                    } else {
                        [calendar showCurrentYearWithMonth:month];
                    }
                } else {
                    month = atoi(argv[1]);
                    year = atoi(argv[2]);
                    if(month <= 0 || month > 12 || year <=0 || year > 9999)
                    {
                        NSLog(@"illegal month or year");
                    } else {
                        [calendar showMonth:month andYear:year];
                    }
                }
                break;
                
            default:
                break;
        }
    }
    return 0;
}
