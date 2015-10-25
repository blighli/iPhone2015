//
//  main.m
//  homework_2
//
//  Created by zhukun on 15/10/25.
//  Copyright (c) 2015年 zhukun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCal.h"

int main(int argc, const char * argv[]) {
    int month;
    int year;
    MyCal *myCal = [[MyCal alloc]init];
    
    switch (argc) {
        case 1:
            [myCal printfSingleMonthWithOutParams];
            break;
        
        case 2:
            year = atoi(argv[1]);
            if(year<0)
                printf("year must > 0\n");
            else
                [MyCal printfDataWithYear:year];
            break;
        
        case 3:
            if([@"-m" isEqualToString:[NSString stringWithUTF8String:argv[1]]]){
                month = atoi(argv[2]);
                if (month <= 0 || month > 12)
                    printf("unavailable month\n");
                else
                    [myCal printfSingleMonthDataWithMonth:month];
            }
            else{
                month = atoi(argv[1]);
                year = atoi(argv[2]);
                if(year<0)
                    printf("year must > 0\n");
                else if (month <= 0 || month > 12)
                    printf("unavailable month\n");
                else
                    [MyCal printfSingleMonthDataWithMonth:month AndYear:year];
            }
        default:
            break;
    }


    return 0;
}
