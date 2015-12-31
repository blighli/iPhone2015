//
//  QCalendar.m
//  QCalendar
//
//  Created by hucker on 15/11/6.
//  Copyright (c) 2015年 hucker. All rights reserved.
//

#import "QCalendar.h"

@implementation QCalendar





-(void)cal:(NSString *)str{
}

//获取本月日历
-(void)cal_print{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    NSDateComponents *compt = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:date];
    
    NSInteger current_year = compt.year;//年
    NSInteger current_month = compt.month;//月
    printf("\n      %i月     %i年\n",(int)current_month,(int)current_year);
    
    //本月有多少天
    int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    //本月第一天是周几
    NSDate *f_date = [[NSDate alloc]init];
    [compt setDay:1];
    f_date = [calendar dateFromComponents:compt];
    NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:f_date];
    int f_day = (int)f_compt.weekday;
    
    [self print_cal:[self generateCalWithF_day:f_day andDays:days]];
    
    return;
}

//获取指定年／月的日历
-(void)cal_print_year:(int)y month:(int) m{
    NSDateComponents *compt = [[NSDateComponents alloc]init];
    [compt setYear:y];
    [compt setMonth:m];
    [compt setDay:1];
    printf("\n      %i月     %i年\n",m,y);
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateFromComponents:compt];
    //当月有多少天
    int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    //当月第一天是周几
    NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:date];
    int f_day = (int)f_compt.weekday;
    
    [self print_cal:[self generateCalWithF_day:f_day andDays:days]];
    
    return;
    
}

//获取本年指定月份的日历
-(void)cal_print_month:(int)m{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *current_date = [NSDate date];
    NSDateComponents *compt = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:current_date];
    
    NSInteger current_year = compt.year;//年
    printf("\n      %i月     %i年\n",m,(int)current_year);
    
    [compt setMonth:m];
    [compt setDay:1];
    NSDate *date = [calendar dateFromComponents:compt];
    //当月有多少天
    int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    //当月第一天是周几
    NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:date];
    int f_day = (int)f_compt.weekday;
    
    [self print_cal:[self generateCalWithF_day:f_day andDays:days]];
    
    return;
}

//获取指定年份日历
-(void)cal_print_all_year:(int)y{
    printf("\n                                                    %i年\n\n",y);
    
    NSMutableArray *allCal = [NSMutableArray arrayWithCapacity:4];
    for (int i = 1; i <= 4; i++) {
        NSMutableArray *semCal = [NSMutableArray arrayWithCapacity:3];
        for(int j = 1; j<= 3; j++){
            NSDateComponents *compt = [[NSDateComponents alloc]init];
            [compt setYear:y];
            [compt setMonth:(j+(i-1)*3)];
            [compt setDay:1];
            
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSDate *date = [calendar dateFromComponents:compt];
            //当月有多少天
            int days = (int)[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
            //当月第一天是周几
            NSDateComponents *f_compt = [calendar components:NSCalendarUnitWeekday fromDate:date];
            int f_day = (int)f_compt.weekday;
            
            [semCal addObject:[self generateCalWithF_day:f_day andDays:days]];
        }
        [allCal addObject:semCal];
    }
    int month = 1;
    for (NSMutableArray *sem in allCal) {
        printf("               %i月                                    %i月                                    %i月\n",month,month+1,month+2);
        printf(" Sun  Mon  Tue  Wed  Thr  Fri  Sat     Sun  Mon  Tue  Wed  Thr  Fri  Sat      Sun  Mon  Tue  Wed  Thr  Fri  Sat\n");
        for (int l = 0; l < 6; l++) {
            for (NSMutableArray *myCal in sem) {
                NSMutableArray *week = [myCal objectAtIndex:l];
                for (NSNumber *num in week) {
                    int weekday = [num intValue];
                    if(weekday == 0) {
                        printf("%s","   ");
                    }else if(weekday < 10){
                        printf("  %i",weekday);
                    }else{
                        printf(" %i",weekday);
                    }
                    printf("  ");
                }
                printf("    ");
            }
            printf("\n");
        }
        month += 3;
    }
    
}

//生成单月日历
-(NSMutableArray*)generateCalWithF_day:(int)f_day andDays:(int)days{
    
    NSMutableArray *myCal = [NSMutableArray arrayWithCapacity:6];
    
    int current_day = 1;
    for(int week =0 ; week < 6; week++){
        if (week == 0) {
            NSMutableArray *weekday = [NSMutableArray arrayWithCapacity:7];
            for(int i = 0; i < 7; i++){
                if (i < (f_day-1)) {
                    [weekday addObject: [NSNumber numberWithInt:0]];
                }else{
                    [weekday addObject: [NSNumber numberWithInt:current_day]];
                    current_day += 1;
                }
            }
            [myCal addObject:weekday];
        }else {
            NSMutableArray *weekday = [NSMutableArray arrayWithCapacity:7];
            for (int i = 0; i < 7; i++) {
                if (current_day <= days) {
                    [weekday addObject: [NSNumber numberWithInt:current_day]];
                    current_day += 1;
                }else{
                    [weekday addObject: [NSNumber numberWithInt:0]];
                }
            }
            [myCal addObject:weekday];
        }
    }
    return myCal;
}

//打印单月日历
-(void)print_cal:(NSMutableArray*)myCal{
    printf(" Sun Mon Tue Wed Thr Fri Sat\n");
    for (NSMutableArray *week in myCal) {
        for (NSNumber *num in week) {
            int weekday = [num intValue];
            if(weekday == 0) {
                printf("%s","    ");
            }else if(weekday < 10){
                printf("   %i",weekday);
            }else{
                printf("  %i",weekday);
            }
        }
        printf("\n");
    }
}

@end