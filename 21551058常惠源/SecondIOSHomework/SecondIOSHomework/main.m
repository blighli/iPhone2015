//
//  main.m
//  SecondIOSHomework
//
//  Created by 常惠源 on 15/10/15.
//  Copyright © 2015年 常惠源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyCal.h"
#import "Util.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MyCal *myCal = [[MyCal alloc] init];
        //首先对参数个数进行判断
        switch (argc) {
            case 1:
                //当前月： cal
                [myCal showCurrentMonthOfThisYear];
                
                break;
            case 2:{
                //显示某年: cal 2015
                //校验输入
                NSString *arg = [NSString stringWithFormat:@"%s", argv[1]];
                int year = [arg intValue];
                if([Util isLegalYeah:year] == YES)
                {
                    [myCal showYear:year];
                }else{
                    [Util showParamErrorTip];
                }
            }
                break;
            case 3:{
                //三个参数: cal 10 2015
                NSString *yearField = [NSString stringWithFormat:@"%s", argv[2]];
                NSString *monthField = [NSString stringWithFormat:@"%s", argv[1]];
                int year = [yearField intValue];
//                NSLog(@"input year:%d",year);
                int month = [monthField intValue];
                if ([Util isLegalYear:year andMonth:month]) {
                    [myCal showMonthDetail:year andMonth:month];
                }else{
                    [Util showParamErrorTip];
                }
            }
                break;
            default:
                [Util showParamErrorTip];
                break;
        }
        
    }
    return 0;
}
