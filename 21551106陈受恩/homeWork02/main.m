//
//  main.m
//  homeWork02
//
//  Created by 陈受恩 on 15/10/20.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

void printMonth(NSInteger month,NSInteger year)
{
    
    char *Month[12] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    
    //得到当前年、月第一天是星期几
    NSDateComponents *day1 = [[NSDateComponents alloc] init];
    [day1 setYear:year];
    [day1 setMonth:month];
    [day1 setDay:1];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    
    //计算和当前年、月第一天是星期几 绝对距离日期
    NSDate *date = [calendar dateFromComponents:day1];
    NSDateComponents *day2 = [calendar components:unitFlags fromDate:date];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    //NSInteger year2 = [day2 year];
    //NSInteger month2 = [day2 month];
    NSInteger weekday = [day2 weekday];
    
    
    
    
    printf("     %s %lu     \n",Month[month-1],year);
    printf("日 一 二 三 四 五 六\n");
    
    for (int j=0; j<(weekday-1)*3; j++) {
        printf(" ");
    }
    for (int i = 1; i<=range.length; i++) {
        printf("%2d",i);
        if (weekday!=0) {
            printf(" ");
        }else
            printf("\n");
        weekday++;
        weekday = weekday%7;
    }
    
    printf("\n");
}



//char *getSubStr(int)

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //将输入的字符串序列化进可变数组中
        NSMutableArray* arrayString = [NSMutableArray arrayWithCapacity:argc];
        for (int i = 0; i < argc; i++) {
            NSString *str = [NSString stringWithUTF8String:argv[i]];
            [arrayString addObject:str];
        }
        //获取当前日历时间
        NSDate *now = [NSDate date];
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *nowCalendar = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:now];
        NSInteger year = [nowCalendar year];
        NSInteger month = [nowCalendar month];
        
        
        //按参数个数输出情况分成三种类型
       
        if (arrayString.count == 1) {
             printMonth(month, year);
        }else if (arrayString.count == 3) {
            NSString *s1 = arrayString[1];
            NSString *s2 = arrayString[2];
            
            if ([s1 characterAtIndex:0]>='0' && [s1 characterAtIndex:0]<='9') {
                if ([s2 characterAtIndex:0]>='0' && [s2 characterAtIndex:0]<='9')
                {
                    if ([s1 intValue]>=1 && [s1 intValue]<=12) {
                        if ([s2 intValue]>=1 && [s2 intValue]<=9999) {
                            printMonth([s1 intValue], [s2 intValue]);
                        }else{
                            printf("cal: year %s not in range 1..9999\n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);
                        }
                    }else
                    {
                        printf("cal:%s is neither a month number (1..12) nor a name\n",[s1 cStringUsingEncoding:NSUTF8StringEncoding]);
                    }
                }else{
                    printf("cal: year 0 not in range 1..9999\n");
                }
            }else if([s1 characterAtIndex:0]=='-'){
                if ([s1 isEqualToString:@"-m"]) {
                    if([s2 intValue]>=1 && [s2 intValue]<=12){
                        printMonth([s2 intValue], year);
                    }else{
                        printf("cal: %d is neither a month number (1..12) nor a name\n",[s2 intValue]);
                    }
                }
                }else{
                    printf("cal:%s is neither a month number (1..12) nor a name\n",[s1 cStringUsingEncoding:NSUTF8StringEncoding]);
                }
            }
        }
    return 0;
}
