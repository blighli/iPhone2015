#import "Calendar.h"

@implementation Calendar

- (id)init {
    self = [super init];
    if (self) {
        _cal = [NSCalendar currentCalendar];
        _comp = [[NSDateComponents alloc]init];
        _unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth| NSCalendarUnitWeekday| NSCalendarUnitDay;
        _month_arr = [NSArray arrayWithObjects:@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",nil];
    }
    return self;
}

- (NSArray *) monthCalendarwithDate:(NSDate *)date {
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSDate *firstDate;
    
    if ([_cal rangeOfUnit:NSCalendarUnitMonth startDate:&firstDate interval:nil forDate:date]) {
        _comp = [_cal components:_unitFlags fromDate:firstDate];
        NSUInteger max = [_cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:firstDate].length;
        
        int d = 1;
        for(int i = 0; i < 6; i++) {
            NSMutableString *rowStr = [[NSMutableString alloc]init];
            for (int j = 1; j <= 7; j++) {
                if (((j < [_comp weekday]) && (i == 0)) || (d > max)) {
                    [rowStr appendString:@"   "];
                } else {
                    [rowStr appendString:[NSString stringWithFormat:@"%2d",d]];
                    [rowStr appendString:@" "];
                    d++;
                }
            }
            [arr addObject:rowStr];
        }
    } else {
        NSException *e = [NSException exceptionWithName:@"GettingFirstDateFailureException"
                                                 reason:@"Maybe date has something wrong."
                                               userInfo:nil];
        @throw e;
    }
    return [arr copy];
}

- (void) printBaseContent:(NSString *)string {
    if (![string isEqualToString:@"\n"]) {
        printf("%2s",[[string description] UTF8String]);
        printf(" ");
    } else {
        printf("\n");
    }
}
- (void) newLine {
    [self printBaseContent:@"\n"];
}
- (void) printTitleWithYear:(NSString *)yr andMonth:(NSString *)mth {
    int i = 0;
    if (!mth) {
        for (; i < 29; i++) {
            printf(" ");
        }
        printf("%li",[_comp year]);
    } else {
        for (; i < 2; i++) {
            [self printBaseContent:@" "];
        }
        printf("%s %li",[[mth description] UTF8String],[_comp year]);
    }
}
- (void) printWeekdaysTitle {
    printf("日 一 二 三 四 五 六");
}
//打印月历
- (void) printMonthWithDate:(NSDate *)date {
    _comp = [_cal components:_unitFlags fromDate:date];
    NSString *year = [NSString stringWithFormat:@"%ld",[_comp year]];
    NSString *month = [_month_arr objectAtIndex:([_comp month]-1)];
    [self printTitleWithYear:year andMonth:month];
    [self newLine];
    [self printWeekdaysTitle];
    [self newLine];
    NSArray *arr = [self monthCalendarwithDate:date];
    for (int i = 0; i < [arr count]; i++) {
        printf("%s",[[[arr objectAtIndex:i]description] UTF8String]);
        [self newLine];
    }
}
//指定日期
- (NSDate *) customDateWithMonth:(NSUInteger)month andYear:(NSUInteger)year {
    NSCalendar *cl = [NSCalendar currentCalendar];
    NSDateComponents *cp = [[NSDateComponents alloc]init];
    if (year != 0) {
        [cp setYear:year];
    } else if(year == 0){
        [cp setYear:[cl component:NSCalendarUnitYear fromDate:[NSDate date]]];
    }
    [cp setMonth:month];
    [cp setDay:1];
    return [cl dateFromComponents:cp];
}
//打印年历
- (void) printYearCalendarOfYear:(NSUInteger)year {
    NSMutableArray *monthCals = [[NSMutableArray alloc]init];
    for (int i = 1; i < 13; i++) {
        [monthCals addObject:[self monthCalendarwithDate:[self customDateWithMonth:i andYear:year]]];
    }
    
    [self printTitleWithYear:[NSString stringWithFormat:@"%ld",year] andMonth:nil];
    [self newLine];
    [self newLine];
    //一个季度
    for (int q = 0; q < 4; q++) {
        printf("        %s          ",[[[_month_arr objectAtIndex: 3 * q + 0]description]UTF8String]);
        if (q == 3) {
            //十一月、十二月
            printf("       %s        ",[[[_month_arr objectAtIndex:10]description]UTF8String]);
            printf("        %s",[[[_month_arr objectAtIndex:11]description]UTF8String]);
        } else {
            printf("        %s         ",[[[_month_arr objectAtIndex: 3 * q + 1]description]UTF8String]);
            printf("         %s",[[[_month_arr objectAtIndex: 3 * q + 2]description]UTF8String]);
        }
        [self newLine];
        [self printWeekdaysTitle];
        printf("  ");
        [self printWeekdaysTitle];
        printf("  ");
        [self printWeekdaysTitle];
        [self newLine];
        //每个月的月历
        for (int r = 0; r < 6; r++) {
            printf("%s",[[[[monthCals objectAtIndex: 3 * q + 0]objectAtIndex:r]description] UTF8String ]);
            printf(" ");
            printf("%s",[[[[monthCals objectAtIndex: 3 * q + 1]objectAtIndex:r]description] UTF8String ]);
            printf(" ");
            printf("%s",[[[[monthCals objectAtIndex: 3 * q + 2]objectAtIndex:r]description] UTF8String ]);
            [self newLine];
        }
        
    }
    
}

@end
