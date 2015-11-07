//
//  CalBrain.m
//  SecondAssignment
//
//  Created by Xin on 14/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import "CalBrain.h"
#import "objc/runtime.h"

@interface CalBrain ()

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger unitFlags;
@property (nonatomic, strong) NSDictionary* weekdayMap;
@property (nonatomic, strong) NSDictionary* monthMap;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDate *startDate;

@end

@implementation CalBrain

- (NSDate *)startDate {
    if (!_startDate) {
        NSDateComponents *components = [NSDateComponents new];
        [components setYear:_year];
        [components setMonth:_month == -1 ? 1 : _month];
        [components setDay:1];
        _startDate = [self.calendar dateFromComponents:components];
    }
    return _startDate;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _year = -1;
        _month = -1;
        _calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        _unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;

        NSMutableArray *keys = [[NSMutableArray alloc]init];
        NSMutableArray *values = [[NSMutableArray alloc]init];
        for (int i = 1; i <= 7; i++) {
            [keys addObject:@(i)];
        }
        [values addObject:@"Su"];
        [values addObject:@"Mo"];
        [values addObject:@"Tu"];
        [values addObject:@"We"];
        [values addObject:@"Th"];
        [values addObject:@"Fr"];
        [values addObject:@"Sa"];
        
        _weekdayMap = [[NSDictionary alloc]initWithObjects:values forKeys:keys];
        
        for (int i = 8; i <= 12; i++) {
            [keys addObject:@(i)];
        }
        
        [values removeAllObjects];
        [values addObject:@"January"];
        [values addObject:@"February"];
        [values addObject:@"March"];
        [values addObject:@"April"];
        [values addObject:@"May"];
        [values addObject:@"June"];
        [values addObject:@"July"];
        [values addObject:@"August"];
        [values addObject:@"September"];
        [values addObject:@"October"];
        [values addObject:@"November"];
        [values addObject:@"December"];
        
        _monthMap = [[NSDictionary alloc]initWithObjects:values forKeys:keys];
    }
    return self;
}

- (instancetype)initWithYear: (NSInteger)year
                       month: (NSInteger)month {
    self = [self init];
    if (self) {
        _year = year;
        _month = month;
    }
    return self;
}


- (instancetype)initWithYear: (NSInteger)year {
    self = [self init];
    if (self) {
        _year = year;
    }
    return self;
}

- (void)printCal {
    if (self.year != -1 && self.month != -1) {
        [self printCalForYear:self.year month:self.month];
    } else if (self.year != -1) {
        [self printCalForYear:self.year];
    }
}

- (void)printBlankCh: (NSInteger)numBlank {
    for (NSInteger i = 0; i < numBlank; i++) {
        printf(" ");
    }
}

//居中显示月份信息, January、February等
- (void)printCentered: (NSInteger)year
                month: (NSInteger)month {
    int total = 20;//某月的日历信息一行占20个字符
    NSString *monthStr = [self.monthMap[@(month)]stringByAppendingFormat:@" %ld", year];
    int blankCh = (total - (int)[monthStr length]) / 2;
    [self printBlankCh:blankCh];
    printf("%s", [monthStr UTF8String]);
}

- (void)printCentered: (NSInteger)month {
    int total = 20;//某月的日历信息一行占20个字符
    NSString *monthStr = self.monthMap[@(month)];
    int blankCh = (total - (int)[monthStr length]) / 2;
    [self printBlankCh:blankCh];
    printf("%s", [monthStr UTF8String]);
    [self printBlankCh:total - blankCh - [monthStr length]];
}

//打印所有的weekday
- (void)printWeekday {
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:[self.weekdayMap count]];
    for (int i = 0; i < [self.weekdayMap count]; i++) {
        [arr addObject:[NSNull null]];//预分配内存
    }
    for (id eachKey in self.weekdayMap) {
        arr[[eachKey intValue] - 1] = self.weekdayMap[eachKey];
    }
    for (int i = 0; i < [arr count]; i++) {
        printf("%s", [arr[i]UTF8String]);
        if (i != [arr count] - 1) {
            printf(" ");
        }
    }
}

- (void)printCalendar: (NSInteger)month {
    while (true) {
        NSDateComponents *components = [self.calendar components:self.unitFlags fromDate:self.startDate];
        if (month != [components month]) break;
        [self printDay:[components day] weekDay:[components weekday]];
        
        NSDateComponents *addOneDayComponents = [NSDateComponents new];
        [addOneDayComponents setDay:1];
        self.startDate = [self.calendar dateByAddingComponents:addOneDayComponents toDate:self.startDate options:0];
    }
}

- (void)printDay: (NSInteger)day
         weekDay: (NSInteger)weekDay {
    NSInteger blankCh = day == 1 ? (weekDay - 1) * 3 : (weekDay == 1 ? 0 : 1);
    if (day < 10) blankCh++;//右对齐
    for (NSInteger i = 0; i < blankCh; i++) {
        printf(" ");
    }
    printf("%ld", day);
    if (weekDay == 7) {
        printf("\n");
    }
}

- (void)printCalForYear: (NSInteger)year
                  month: (NSInteger)month {
    [self printCentered:year month:month];
    printf("\n");
    [self printWeekday];
    printf("\n");
    [self printCalendar: month];
    printf("\n");
}

- (void)printYear: (NSInteger)year {
    int total = 64;
    int tmp = (int)year;
    int cnt = 0;
    while (tmp != 0) {
        cnt++;
        tmp /= 10;
    }
    int blankCh = (total - cnt) / 2;
    for (int i = 0; i < blankCh; i++) {
        printf(" ");
    }
    printf("%li\n\n", year);
}

- (void)printCalendar: (NSInteger)startMonth
                inCol: (NSInteger)col {
    int firstMap[3];//保存每个月的第一天是星期几
    int monthDay[3];//保存每个月有多少天
    NSDateComponents *components = [NSDateComponents new];
    [components setYear:_year];
    [components setMonth:startMonth];
    [components setDay:1];
    NSDate *date = [self.calendar dateFromComponents:components];
    for (int i = 0; i < 3; i++) {
        NSDateComponents *components = [self.calendar components:self.unitFlags fromDate:date];
        firstMap[i] = (int)[components weekday];
        NSDateComponents *addOneMonthComponents = [NSDateComponents new];
        [addOneMonthComponents setMonth:1];
        NSDate *addedDate = [self.calendar dateByAddingComponents:addOneMonthComponents toDate:date options:0];
        NSDateComponents *diffComp = [self.calendar components:NSCalendarUnitDay fromDate:date toDate:addedDate options:0];
        monthDay[i] = (int)[diffComp day];
        date = addedDate;
    }
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 3; j++) {
            int start = i == 0 ? 1 : (i - 1) * 7 + 7 - firstMap[j] + 2;
            if (i == 0) {
                [self printBlankCh:(firstMap[j] - 1) * 3];
            }
            int zCnt = (i == 0 ? 7 - firstMap[j] + 1 : 7);
            for (int z = 0; z < zCnt; z++) {
                if (start + z < 10) {
                    printf(" ");
                }
                if (start + z <= monthDay[j]) {
                    printf("%d", start + z);
                } else {
                    printf("  ");
                }
                if (z != zCnt - 1) {
                    printf(" ");
                }
            }
            if (j != 2) {
                printf("  ");
            }
        }
        printf("\n");
    }
}


- (void)printCalForYear: (NSInteger)year {
    [self printYear:year];
    for (int row = 0; row < 4; row++) {
        for (int i = 1; i <= 3; i++) {
            [self printCentered:row * 3 + i];
            printf("  ");
        }
        printf("\n");
        for (int i = 1; i <= 3; i++) {
            [self printWeekday];
            if (i != 3)
                printf("  ");
        }
        printf("\n");
        [self printCalendar:row * 3 + 1 inCol:3];
    }
}

+ (void)runWithYear:(int)year {
    [[[CalBrain alloc]initWithYear:year]printCal];
}

+ (void)runWithYear:(int)year month:(int)month {
    [[[CalBrain alloc]initWithYear:year month:month]printCal];
}

@end
