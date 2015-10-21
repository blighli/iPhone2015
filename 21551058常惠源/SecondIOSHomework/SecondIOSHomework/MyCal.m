//
//  MyCal.m
//  SecondIOSHomework
//
//  Created by 常惠源 on 15/10/20.
//  Copyright © 2015年 常惠源. All rights reserved.
//

#import "MyCal.h"
#import "Util.h"
@interface MyCal ()

@property NSInteger *year;
@property NSInteger *month;

@end

@implementation MyCal

- (id)init {
    self = [super init];
    if (self) {
        monthArray = [NSArray arrayWithObjects:@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",nil];
    }
    return self;
}

- (void)showCurrentMonthOfThisYear{
    NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth;
    NSDateComponents *d = [cal components:unitFlags fromDate:date];
    int currentYear = (int)[d year];
    int currentMonth =(int)[d month];
    [self showMonthDetail:currentYear andMonth:currentMonth];
}


//显示某年一整年的日历信息
- (void)showYear: (int)year{
    
    int howLongEveryMonth[12];
    int firstWeekdayEveryMonth[12];
    //每个月的天数
    for(int i = 0; i < 12 ; i ++){
        howLongEveryMonth[i] = [Util howManyDaysInThisMonth:year month:(i+1)];
    }
    //每个月第一天是周几
    for (int i = 0; i < 12 ; i ++){
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setDay:1];
        [components setMonth:(i + 1)];
        [components setYear:year];
        NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
        unsigned int unitFlags = NSCalendarUnitWeekday;
        NSDateComponents *d = [greCalendar components:unitFlags fromDate:dateFromDateComponentsForDate];
        int dayOfWeek = (int)[d weekday];
        firstWeekdayEveryMonth[i] = dayOfWeek;
//        NSLog(@"fistDay:%d",dayOfWeek);
    }

    //打印年 某某年
    for(int i = 0 ; i < 35;i++){
        printf(" ");
    }
    printf("%d",year);
    for(int i = 0 ; i < 35;i++){
        printf(" ");
    }
    printf("\n");
    int months = 0;
    //接下来打印 月的标题 周的标题 还有每周的内容
    for (int k = 0; k < 3; k++) {
        
        //月 行
        for(int i = 0; i < 4; i ++){
            for(int i = 0 ; i < 8;i++){
                printf(" ");
            }
            
            NSString *monthString = [monthArray objectAtIndex:(months)];
            months++;
            printf("%2s",[[monthString description] UTF8String]);
            for(int i = 0 ; i < 10;i++){//多空一个
                printf(" ");
            }
        }
        printf("\n");
        //周 行
        for(int i = 0; i < 4; i ++){
            [self showOneWeekTitle];
            printf(" ");
        }
        [self showNextLine];
        //打印具体的日历 需要知道该年每个月的天数 以及 每个月第一天
        
        int temp[4];
        
        for(int i = 0; i < 4; i++){
            temp[i] = 1;
        }

        //最多可能5行
        for(int m = 0;m <5; m++){
            
            
        //每行四个月
        for (int p = 0; p < 4; p++) {
            
            //一个月的
//            NSLog(@"cur month date size:%d",k + m * 4);
//            NSLog(@"temp[p]:%d",temp[k]);
            for (int j = 0; j < 7; j++) {
                if (temp[p] > howLongEveryMonth[p + k * 4]) {
                    printf("   ");
                    continue;
                }
                
                if(j+1 + m * 7 < firstWeekdayEveryMonth[p+ k * 4]){
                    printf("   ");
                     continue;
                }
                printf("%3d",temp[p]++);
            }
            printf(" ");
        }
        [self showNextLine];
        }
    }
    
}
- (void)showMonth: (NSDate *)date{
    }

- (void)showMonthDetail:(int)year andMonth:(int) month{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:1];//为了获取每月一号是周几
    [components setMonth:month];
    [components setYear:year];
    NSDate *dateFromDateComponentsForDate = [greCalendar dateFromComponents:components];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;//要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；
    NSDateComponents *d = [greCalendar components:unitFlags fromDate:dateFromDateComponentsForDate];//把要从date中获取的unitFlags标示的日期元素存放在NSDateComponents类型的d里面；
    //然后就可以从d中获取具体的年月日了；
    int currentYear = (int)[d year];
    int currentMonth =(int)[d month];
//    int currentDay = (int)[d day];
    int dayOfWeek = (int)[d weekday];
    
//    NSLog(@"year:%d",currentYear);
//    NSLog(@"month:%d",currentMonth);
//    NSLog(@"day:%d",currentDay);
//    NSLog(@"dayOfWeek:%d",dayOfWeek);
    int totalDay = [Util howManyDaysInThisMonth:currentYear month:(currentMonth)];
//    NSLog(@"total day:%d",totalDay);
    [self showMonthAndYearTitle:currentYear andMonth:currentMonth];
    [self showNextLine];
    [self showOneWeekTitle];
    [self showNextLine];
    int dayOfMonth = 1;
    for(int i = 0;i < 6;i ++){
        for (int j = 0; j < 7; j++) {
            
            if (dayOfMonth > totalDay) {
                break;
            }
            if(i == 0 && j < dayOfWeek - 1){
                printf("   ");
                continue;
            }
            
            printf("%3d", dayOfMonth++);
        }
        printf("\n");
    }

}

- (void)showMonthAndYearTitle: (int)year andMonth: (int)month{
    
    for (int i = 0; i < 5; i ++) {
        printf(" ");
    }
    
    NSString *monthString = [monthArray objectAtIndex:(month-1)];
    printf("%2s",[[monthString description] UTF8String]);
    printf(" ");
    printf("%2d",year);
    for (int i = 0; i < 5; i ++) {
        printf(" ");
    }
    
}

- (void)showOneWeekTitle{
    printf(" 日 一 二 三 四 五 六");
}
- (void)showNextLine{
    printf("\n");
}
@end
