//
//  Calendar.m
//  Calendar
//
//  Created by John on 15/10/18.
//  Copyright © 2015年 John. All rights reserved.
//

#import "Calendar.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

@implementation Calendar {
    //标题
    NSArray *monthArray;
    //日历
    NSCalendar *calendar;
}

-(id)init {
    self = [super init];
    if (self) {
        monthArray = @[@" 一月",@" 二月",@" 三月",@" 四月",@" 五月",@" 六月",@" 七月",@" 八月",@" 九月",@" 十月",@"十一月",@"十二月"];
        calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        [calendar setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
        //设置周日为第一天
        [calendar setFirstWeekday:1];
    }
    return self;
}

//打印当前月份
-(void)showCurrentMonth {
    NSDateComponents *comp = [self getCurrentComponents];
    for (NSString *str in [self setDateWithMonth:comp.month Year:comp.year]) {
        NSLog(@"%@",str);
    }
}

//打印今年的某个月
-(void)showCurrentYearWithMonth:(NSInteger)month {
    NSDateComponents *comp = [self getCurrentComponents];
    for (NSString *str in [self setDateWithMonth:month Year:comp.year]) {
        NSLog(@"%@",str);
    }
}

/*
 显示年中的所有月份
 */
-(void)showAllTheYear:(NSInteger)year {
    NSLog(@"                                %@",[NSString stringWithFormat:@"%ld",year]);
    NSLog(@"");
    NSMutableArray *strArray = [[NSMutableArray alloc] init];
    //一个月的需要8行
    for (int i = 0; i < 8; i++) {
        [strArray addObject:[NSMutableString stringWithCapacity:0]];
    }
    //每个月的拼起来
    for (int i = 1; i <= 12; i ++) {
        NSArray *tempArray = [self setDateWithMonth:i Year:year];
        for (int j = 0; j < 8; j++) {
            NSMutableString *tempStr = [tempArray[j] mutableCopy];
            if (j > 1) {
                //补空
                while ([tempStr length] <= 20) {
                    [tempStr appendString:@" "];
                };
            }
            [strArray[j] appendString:tempStr];
            [strArray[j] appendString:@"  "];
        }
        if (i % 3 == 0) {
            for (NSString *str in strArray) {
                NSLog(@"%@",str);
            }
            //清空
            strArray = [[NSMutableArray alloc] init];
            //重新加8行
            for (int i = 0; i < 8; i++) {
                [strArray addObject:[NSMutableString stringWithCapacity:0]];
            }
        }
    }
}

-(void)showMonth:(NSInteger)month andYear:(NSInteger)year {
    for (NSString *str in [self setDateWithMonth:month Year:year]) {
        NSLog(@"%@",str);
    }
}
/*
 获取当月的component
 */
-(NSDateComponents *)getCurrentComponents {
    //当前日期
    NSDate *date = [NSDate date];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    //需要注意的是，只有明确指定了unitFlags，NSDateComponents相应的那一部分才有值
    NSDateComponents *comp = [calendar components:unitFlags fromDate:date];
    return comp;
}
/*
 传入月份，年份 返回月历数组
 */
-(NSArray *)setDateWithMonth:(NSInteger)month Year:(NSInteger)year{
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    comp.year = year;
    comp.month = month;
    comp.day = 1;
    NSDate *date = [calendar dateFromComponents:comp];
    NSInteger dayOfWeek = [calendar ordinalityOfUnit:NSWeekdayCalendarUnit
                                              inUnit:NSWeekCalendarUnit forDate:date];
    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnit
                                   inUnit:NSMonthCalendarUnit forDate:date];
    NSUInteger dayOfMonth = range.length;
    return [self calendarWithDayOfWeek:dayOfWeek withTotalDay:dayOfMonth Month:month Year:year];
}

/*
    根据每个月的第一天是星期几，一共几天 ，月，年 返回这个月的月历数组

 */
-(NSArray *)calendarWithDayOfWeek:(NSInteger)dayOfWeek withTotalDay:(NSInteger)totalDay Month:(NSInteger)month Year:(NSInteger)year{
    NSMutableArray *strArray = [[NSMutableArray alloc] init];
    NSMutableString *line = [[NSMutableString alloc] init];
    [strArray addObject:[NSString stringWithFormat:@"     %@ %ld      ",monthArray[month-1] ,(long)year]];
    [strArray addObject:@"日 一 二 三 四 五 六 "];
    
        NSInteger count = dayOfWeek;
        //空格占位
        for (int i = 1 ; i < dayOfWeek; i++) {
            [line appendString:@"   "];
        }
        for (int i = 1 ; i <= totalDay; i++) {
            [line appendFormat:@"%2d ",i];
            if (count % 7 == 0) {
                //删除最后的空格
                [line deleteCharactersInRange:NSMakeRange([line length]-1, 1)];
                [strArray addObject:line];
                line = [[NSMutableString alloc] init];
            }
            count ++;
        }
        //这个月的最后一天的空格去掉
        if (![line isEqualToString:@""]) {
            [line deleteCharactersInRange:NSMakeRange([line length]-1, 1)];
            [strArray addObject:line];
        }
        while ([strArray count] < 8) {
            [strArray addObject:[NSMutableString stringWithCapacity:0]];
        }
    
    return strArray;
}


@end
