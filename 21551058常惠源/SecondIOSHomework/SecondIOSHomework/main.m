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
                NSString *yearField = [NSString stringWithFormat:@"%s", argv[1]];
                NSString *monthField = [NSString stringWithFormat:@"%s", argv[2]];
                int year = [yearField intValue];
                int month = [monthField intValue];
                if ([Util isLegalYear:year andMonth:month]) {
                    NSDate *date = [NSDate date];
                    NSString *datestring = [NSString stringWithFormat:@"1999-09-03"];
                    //想要设置自己想要的格式，可以用nsdateformatter这个类，这里是初始化
                    NSDateFormatter * dm = [[NSDateFormatter alloc]init];
                    //指定输出的格式   这里格式必须是和上面定义字符串的格式相同，否则输出空
                    [dm setDateFormat:@"yyyy-MM-dd"];
                    //把字符串的时间转换成Date对象，用dateFromString方法
                    NSDate * newdate = [dm dateFromString:datestring];
//                    [myCal showMonth:<#(NSDate *)#>];
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
