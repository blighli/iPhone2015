//
//  Util.m
//  SecondIOSHomework
//
//  Created by 常惠源 on 15/10/20.
//  Copyright © 2015年 常惠源. All rights reserved.
//
#import "Util.h"
@implementation Util
//判断用户输入的年是否合法
+ (BOOL)isLegalYeah: (int)year{
    if (year <= 1970 || year > 9999) {
        
        return NO;
    }else{
        return YES;
    }
    
}
//判断用户输入的年与月是否合法
+ (BOOL)isLegalYear: (int)year andMonth: (int)month{
    if (month <= 0 || month > 12) {
                return NO;
    }else
        return YES && [Util isLegalYeah:year];
    
}
//用户参数错误时，给出提示
+ (void)showParamErrorTip{
    printf("参数错误 请检查参数\n");
}
//某年某月有多少天
+(int)howManyDaysInThisMonth:(int)year month:(int)imonth {
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}
@end
