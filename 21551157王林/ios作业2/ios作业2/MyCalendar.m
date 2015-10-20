//
//  MyCalendar.m
//  ios作业2
//
//  Created by 王林 on 15/10/20.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import "MyCalendar.h"
@implementation MyCalendar

//初始化
- (instancetype)init{
    if (self = [super init]) {
        _currentCalendar = [NSCalendar currentCalendar];
    }
    return self;
}

//打印某一年某一月的月历
- (void) printCalendar:(NSInteger) year andMonth:(NSInteger) month{
    //判断输入
    if (month < 1 || month > 12 || year < 1000 || year > 9999) {
        printf("输入有误\n");
        return;
    }
    //打印年月
    printf("     %ld-%ld\n",year,month);
    //打印星期标题
    printf("日 一 二 三 四 五 六\n");
    //计算第一天星期几
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    //时间字符串
    NSString *dateStr = [NSString stringWithFormat:@"%ld%.2ld01",year,month];
    //获取date
    NSDate *curDate = [formatter dateFromString:dateStr];
    //定义
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [_currentCalendar components:unitFlags fromDate:curDate];
    //获取这个月第一天星期几
    NSInteger dayOfWeek = components.weekday;
    //获取这个月天数
    NSRange dayRange = [_currentCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:curDate];
    //打印空格
    for(int i=0;i<3 * (dayOfWeek-1);i++)
        printf(" ");
    //开始打印
    for (int i = 1; i < dayRange.length + dayOfWeek; i++) {
        //打印空格
        if (i >= dayOfWeek) {
            //打印日期
            printf("%2ld ",i - dayOfWeek + 1);
            if (i % 7 == 0) {
                //换行
                printf("\n");
            }
        }
    }
    
    
}

//打印某一年的月历
- (void) printYearCalender:(NSInteger) year{
    //判断输入
    if (year < 1000 || year > 9999) {
        printf("输入有误\n");
        return;
    }
    //打印月份
    for (int i = 1; i < 13; i++) {
        [self printCalendar:year andMonth:i];
        printf("\n");
    }
}
@end
