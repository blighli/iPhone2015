//
//  main.m
//  QCalendar
//
//  Created by hucker on 15/10/18.
//  Copyright (c) 2015年 hucker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QCalendar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        QCalendar* calendar = [[QCalendar alloc]init];
        
        switch (argc) {
            case 1:
            {
                [calendar cal_print];
                break;
            }
            case 2:
            {
                int year = atoi(argv[1]);
                if (year>=1 && year <= 9999){
                    [calendar cal_print_all_year:year];
                }else {
                    printf("year %i not in range 1..9999\n",year);
                }
                break;
            }
            case 3:
            {
                if ([@"-m" isEqualToString:[NSString stringWithUTF8String:argv[1]]]){
                    int month = atoi(argv[2]);
                    if (month >= 1 && month <= 12) {
                        [calendar cal_print_month:month];
                    }else{
                        printf("month %i not in range 1..12\n",month);
                    }
                }else{
                    int month = atoi(argv[1]);
                    int year = atoi(argv[2]);
                    if (month >= 1 && month <= 12 && year>=1 && year<=9999) {
                        [calendar cal_print_year:year month:month];
                    }else if(month <1 || month >12 ){
                        printf("month %i not in range 1..12\n",month);
                    }else if(year <1 || year >9999){
                        printf("year %i not in range 1..9999\n",year);
                    }else{
                        printf("invalid input.\n");
                    }
                }
                break;
            }
            default:
            {
                printf("invalid input.\n");
                break;
            }
        }
    }
    return 0;
}
