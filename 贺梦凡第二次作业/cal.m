
#import <Foundation/Foundation.h>

@interface CalCommand : NSObject

+ (void)makeByYear: (int)year;
+ (void)makeByYear: (int)year
              month: (int)month;
- (instancetype)initByYear: (NSInteger)year
                       month: (NSInteger)month;
@end

@interface CalCommand ()

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger unitFlags;
@property (nonatomic, strong) NSDictionary* weekdayMap;
@property (nonatomic, strong) NSDictionary* monthMap;
@property (nonatomic, strong) NSCalendar *calendar;
@property (nonatomic, strong) NSDate *BeginningDate;

@end

@implementation CalCommand



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

- (NSDate *)BeginningDate {
    if (!_BeginningDate) {
        NSDateComponents *components = [NSDateComponents new];
        [components setYear:_year];
        [components setMonth:_month == -1 ? 1 : _month];
        [components setDay:1];
        _BeginningDate = [self.calendar dateFromComponents:components];
    }
    return _BeginningDate;
}



- (instancetype)initByYear: (NSInteger)year {
    self = [self init];
    if (self) {
        _year = year;
    }
    return self;
}

- (instancetype)initByYear: (NSInteger)year
                     month: (NSInteger)month {
    self = [self init];
    if (self) {
        _year = year;
        _month = month;
    }
    return self;
}



- (void)blankPrint: (NSInteger)blankNum {
    for (NSInteger i = 0; i < blankNum; i++) {
        printf(" ");
    }
}

- (void)calPrint {
    if (self.year != -1 && self.month != -1) {
        [self yearPrint:self.year month:self.month];
    } else if (self.year != -1) {
        [self yearPrint:self.year];
    }
}



- (void)middlePrint: (NSInteger)month {
    int total = 20;
    NSString *monthStr = self.monthMap[@(month)];
    int blankCh = (total - (int)[monthStr length]) / 2;
    [self blankPrint:blankCh];
    printf("%s", [monthStr UTF8String]);
    [self blankPrint:total - blankCh - [monthStr length]];
}

- (void)middlePrint: (NSInteger)year
              month: (NSInteger)month {
    int all = 20;
    NSString *monthStr = [self.monthMap[@(month)]stringByAppendingFormat:@" %ld", year];
    int blankCh = (all - (int)[monthStr length]) / 2;
    [self blankPrint:blankCh];
    printf("%s", [monthStr UTF8String]);
}


- (void)weekPrint {
    NSMutableArray *arr = [[NSMutableArray alloc]initWithCapacity:[self.weekdayMap count]];
    for (int i = 0; i < [self.weekdayMap count]; i++) {
        [arr addObject:[NSNull null]];
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

- (void)printC: (NSInteger)month {
    while (true) {
        NSDateComponents *components = [self.calendar components:self.unitFlags fromDate:self.BeginningDate];
        if (month != [components month]) break;
        [self printDay:[components day] weekDay:[components weekday]];
        
        NSDateComponents *addOneDayComponents = [NSDateComponents new];
        [addOneDayComponents setDay:1];
        self.BeginningDate = [self.calendar dateByAddingComponents:addOneDayComponents toDate:self.BeginningDate options:0];
    }
}

- (void)printDay: (NSInteger)day
         weekDay: (NSInteger)weekDay {
    NSInteger blank = day == 1 ? (weekDay - 1) * 3 : (weekDay == 1 ? 0 : 1);
    if (day < 10) blank++;
    for (NSInteger i = 0; i < blank; i++) {
        printf(" ");
    }
    printf("%ld", day);
    if (weekDay == 7) {
        printf("\n");
    }
}

- (void)yearPrint: (NSInteger)year
                  month: (NSInteger)month {
    [self middlePrint:year month:month];
    printf("\n");
    [self weekPrint];
    printf("\n");
    [self printC: month];
    printf("\n");
}

- (void)printYear: (NSInteger)year {
    int all = 64;
    int temp = (int)year;
    int count = 0;
    while (temp != 0) {
        count++;
        temp /= 10;
    }
    int blank = (all - count) / 2;
    for (int i = 0; i < blank; i++) {
        printf(" ");
    }
    printf("%li\n\n", year);
}

- (void)printC: (NSInteger)startMonth
                inCol: (NSInteger)col {
    int firstMap[3];
    int monthDay[3];
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
    for (int t = 0; t < 6; t++) {
        for (int k = 0; k < 3; k++) {
            int start = t == 0 ? 1 : (t - 1) * 7 + 7 - firstMap[k] + 2;
            if (t == 0) {
                [self blankPrint:(firstMap[k] - 1) * 3];
            }
            int zCnt = (t == 0 ? 7 - firstMap[k] + 1 : 7);
            for (int q = 0; q < zCnt; q++) {
                if (start + q < 10) {
                    printf(" ");
                }
                if (start + q <= monthDay[k]) {
                    printf("%d", start + q);
                } else {
                    printf("  ");
                }
                if (q != zCnt - 1) {
                    printf(" ");
                }
            }
            if (k != 2) {
                printf("  ");
            }
        }
        printf("\n");
    }
}


- (void)yearPrint: (NSInteger)year {
    [self printYear:year];
    for (int row = 0; row < 4; row++) {
        for (int i = 1; i <= 3; i++) {
            [self middlePrint:row * 3 + i];
            printf("  ");
        }
        printf("\n");
        for (int i = 1; i <= 3; i++) {
            [self weekPrint];
            if (i != 3)
                printf("  ");
        }
        printf("\n");
        [self printC:row * 3 + 1 inCol:3];
    }
}

+ (void)makeByYear:(int)year {
    [[[CalCommand alloc]initByYear:year]calPrint];
}

+ (void)makeByYear:(int)year month:(int)month {
    [[[CalCommand alloc]initByYear:year month:month]calPrint];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc == 1){
            [CalCommand makeByYear:2015 month:10];
            return 0;
        }
        if(argc == 2){
            int year = atoi(argv[1]);
            if(year < 1 || year > 9999){
                printf("所输年份%s不正常\n",argv[1]);
                return 0;
            }else{
                //输出指定年份
                [CalCommand makeByYear:year];
                return 0;
            }
        }
        if(argc == 3){
            if( strcmp(argv[1],"-m") == 0){
                int month = atoi(argv[2]);
                if(month < 1 || month > 12){
                    printf("所输月份%s不正常\n",argv[2]);
                    return 0;
                }
                //输出指定月份日历
                [CalCommand makeByYear:2015 month:month];
                return 0;
            }else{
                int year = atoi(argv[2]);
                int month = atoi(argv[1]);
                if(month < 1 || month > 12){
                    printf("所输月份%s不正常\n",argv[2]);
                    return 0;
                }
                if(year < 1 || year > 9999){
                    printf("所输年份%s不正常\n",argv[1]);
                    return 0;
                }
                [CalCommand makeByYear:year month:month];
                //输出指定年月日历
                return 0;
            }
        }
        if(argc == 4){
            if( strcmp(argv[1],"-m") != 0){
                printf("参数不正确\n");
                return 0;
            }else{
                int year = atoi(argv[3]);
                int month = atoi(argv[2]);
                if(month < 1 || month > 12){
                    printf("所输月份%s不正常\n",argv[2]);
                    return 0;
                }
                if(year < 1 || year > 9999){
                    printf("所输年份%s不正常\n",argv[1]);
                    return 0;
                }
                //输出指定年月日历
                [CalCommand makeByYear:year month:month];
                
            }
        }
        if(argc > 4){
            printf("参数太多\n");
            return 0;
        }
        
        
    }
    return 0;
}







