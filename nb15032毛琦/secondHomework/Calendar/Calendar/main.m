//
//  main.m
//  Calendar
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Month.h"
#import "Year.h"
#import "Util.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc==1){
            MonthCal *util=[[MonthCal alloc]initWithYear:-1 AndMonth:-1];
            [util outputMonthByYM];
        }else if (argc==2){
            NSString *year=[NSString stringWithUTF8String:argv[1]];
            NSInteger y=[year integerValue];
            YearCal *util=[[YearCal alloc]initWithYear:y];
            if(y>=1&&y<=9999){
                NSInteger len=[year length];
                NSString *yearline=[Utils addSpace:64 string:year len:len];
                NSLog(@"%@",yearline);
                NSLog(@"");
                [util outputYear];
            }else{
                NSLog(@"cal: year is not in range 1..9999");
            }
        }else if (argc==3){
            NSString *str2=[NSString stringWithUTF8String:argv[1]];
            if([[str2 substringToIndex:1] compare:@"-"]==NSOrderedSame){
                if([str2 compare:@"-m"]==NSOrderedSame){
                    NSString *str3=[NSString stringWithUTF8String:argv[2]];
                    NSInteger month=[str3 integerValue];
                    if(month>=1&&month<=12){
                        MonthCal *util=[[MonthCal alloc]initWithYear:-1 AndMonth:month];
                        [util outputMonthByYM];
                    }else{
                        NSLog(@"cal: month is not in range 1..12");
                    }
                }else{
                    NSLog(@"cal: illegal option");
                }
            }else{
                NSInteger month=[str2 integerValue];
                
                NSString *str3=[NSString stringWithUTF8String:argv[2]];
                NSInteger year=[str3 integerValue];
                if(month>=1&&month<=12){
                    if(year<=9999&&year>=1){
                        MonthCal *util=[[MonthCal alloc]initWithYear:year AndMonth:month];
                        [util outputMonthByYM];
                    }
                    else{
                        NSLog(@"cal: year is not in range 1..9999");
                    }
                }else{
                    NSLog(@"cal: month is not in range 1..12");
                }
            }
        }
    }
    
    return 0;
}

