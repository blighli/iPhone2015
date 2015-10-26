#import <Foundation/Foundation.h>
#define NSLog(FORMAT, ...) fprintf(stderr,"%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


@interface MyCalendar : NSObject
+ (long) getWeekDayByDate:(NSDate *) theDate;
+ (int) getDayNumberOfMonth:(int) month AndYear:(int) year;
+ (NSDate *) getFirstDayByMonth:(int) month AndYear:(int) year;
@end //MyCalendar

@interface MyDisplayer : NSObject
+ (void) displaySingleMonthOfMonth:(int) month AndYear :(int) year;
+ (void) displayWholeMonthOfYear:(int) year;
@end //MyDisplayer


@implementation MyDisplayer
+ (void) displaySingleMonthOfMonth:(int) month AndYear :(int) year
{
    int dateTable[10][10];
    [MyDisplayer makeDateTableByMonth:month AndYear:year In:dateTable];
    [MyDisplayer showTitleByMonth:month AndYear:year ];
    NSLog(@"Su Mo Tu We Th Fr Sa");
    int i = 1,j = 1;
    for(i = 1; i <= 6; ++i){
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable[i][j]];
        }
        printf("  \n");
    }
}

+ (void) printDateFormate:(int) day
{
    if(day == 0){
        printf("   ");
        return;
    }
    if(day < 10){
        printf(" %d ",day);
    }else{
        printf("%d ",day);
    }
}

+ (void) displayWholeMonthOfYear:(int) year
{
    int dateTable1[10][10],dateTable2[10][10],dateTable3[10][10];
    NSLog(@"                             %d\n",year);
    NSLog(@"      January               February               March");
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    [MyDisplayer makeDateTableByMonth:1 AndYear:year In:dateTable1];
    [MyDisplayer makeDateTableByMonth:2 AndYear:year In:dateTable2];
    [MyDisplayer makeDateTableByMonth:3 AndYear:year In:dateTable3];
    int i = 1,j = 1;
    for(i = 1; i <= 6; ++i){
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable1[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable2[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable3[i][j]];
        }
        printf("  \n");
    }
    NSLog(@"       April                  May                   June");
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    [MyDisplayer makeDateTableByMonth:4 AndYear:year In:dateTable1];
    [MyDisplayer makeDateTableByMonth:5 AndYear:year In:dateTable2];
    [MyDisplayer makeDateTableByMonth:6 AndYear:year In:dateTable3];
    for(i = 1; i <= 6; ++i){
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable1[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable2[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable3[i][j]];
        }
        printf("  \n");
    }
    NSLog(@"        July                 August              September");
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    [MyDisplayer makeDateTableByMonth:7 AndYear:year In:dateTable1];
    [MyDisplayer makeDateTableByMonth:8 AndYear:year In:dateTable2];
    [MyDisplayer makeDateTableByMonth:9 AndYear:year In:dateTable3];
    for(i = 1; i <= 6; ++i){
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable1[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable2[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable3[i][j]];
        }
        printf("  \n");
    }
    NSLog(@"      October               November              December");
    NSLog(@"Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa");
    [MyDisplayer makeDateTableByMonth:10 AndYear:year In:dateTable1];
    [MyDisplayer makeDateTableByMonth:11 AndYear:year In:dateTable2];
    [MyDisplayer makeDateTableByMonth:12 AndYear:year In:dateTable3];
    for(i = 1; i <= 6; ++i){
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable1[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable2[i][j]];
        }
        printf(" ");
        for(j = 1; j <=7; ++j){
            [MyDisplayer printDateFormate : dateTable3[i][j]];
        }
        printf("  \n");
    }
}

+ (void) makeDateTableByMonth:(int) month AndYear :(int) year In:(int [10][10])dateTable
{
    long weekday = [MyCalendar getWeekDayByDate: [MyCalendar getFirstDayByMonth: month AndYear:year]];
    int monthLen = [MyCalendar getDayNumberOfMonth:month AndYear:year];
    int curDay = 1;
    int i = 1,j = 1;
    while( weekday > 1 )
    {
        --weekday;
        dateTable[i][j++] = 0;
    }
    while(curDay <= monthLen)
    {
        dateTable[i][j++] = curDay;
        ++curDay;
        if(j >= 8){
            j = 1;
            ++i;
        }
    }
    while(j <= 7){
        dateTable[i][j] = 0;
        ++j;
    }
    while(i<6){
        ++i;
        for(j=1;j<=7;++j){
            dateTable[i][j] = 0;
        }
    }
}


+ (void) showTitleByMonth:(int) month AndYear :(int) year
{
    char monthName[13][20] =
    {
        "","January","February","March","April","May","June","July","August","September","October","November","December"
    };
    
    char buff[1024];
    sprintf(buff,"%s %d",monthName[month],year);
    int len = strlen(buff);
    int space = (20 - len)/2;
    for(int i = 0; i < space; ++i){
        printf(" ");
    }
    printf("%s\n",buff);
}
@end //MyDisplayer


@implementation MyCalendar
+ (long) getWeekDayByDate:(NSDate *) theDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger unitFlags = NSCalendarUnitWeekOfYear|NSCalendarUnitWeekday;
    NSDateComponents *dateComps = [calendar components:unitFlags fromDate: theDate];
    return [dateComps weekday];
}

+ (int) getDayNumberOfMonth:(int) month AndYear:(int) year
{
    int day = 0;
    switch (month)
    {
        case 2:
            if( (year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
                return 29;
            }
            return 28;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        default:
            return 31;
    }
}

+ (NSDate *) getFirstDayByMonth:(int) month AndYear:(int) year
{
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setYear:year];
    [dateComps setMonth:month];
    [dateComps setDay:1];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *needDate = [calendar dateFromComponents:dateComps];
    return needDate;
}

@end//MyCalendar

int main(int argc,const char * argv[])
{
    //1752年前历法不统一
    @autoreleasepool {
        if(argc >4){
            NSLog(@"cal: too many auguments are given");
        }
        else if(argc == 4 && strcmp(argv[1],"-m") != 0){
            NSLog(@"cal: the auguments given is illegal")
        }
        else if(argc == 1){
            NSTimeZone *zone = [NSTimeZone defaultTimeZone];
            NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
            NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
            NSDate *nowDate=[NSDate dateWithTimeIntervalSinceNow:interval];
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
            NSDateComponents *dateComps = [calendar components:unitFlags fromDate: nowDate];
            int year = (int)[dateComps year];
            int month = (int)[dateComps month];
            [MyDisplayer displaySingleMonthOfMonth:month AndYear:year];
            //show current month
        }
        else if(argc == 2){
            int year = atoi(argv[1]);
            if(year <= 1753 || year >9999){
                NSLog(@"cal: year %s not in range 1753..9999",argv[1]);
            }else{
                [MyDisplayer displayWholeMonthOfYear:year];
            }
        }
        else if(argc == 3){
            
            if( strcmp(argv[1],"-m") == 0 ){
                NSTimeZone *zone = [NSTimeZone defaultTimeZone];
                NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
                NSDate *localeDate = [[NSDate date] dateByAddingTimeInterval:interval];
                NSDate *nowDate=[NSDate dateWithTimeIntervalSinceNow:interval];
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSInteger unitFlags = NSCalendarUnitYear;
                NSDateComponents *dateComps = [calendar components:unitFlags fromDate: nowDate];
                int year = (int)[dateComps year];
                int month = atoi(argv[2]);
                if(month <= 0 || month > 12){
                    NSLog(@"cal: %s is not a month number (1..12)",argv[2]);
                    return 0;
                }
                [MyDisplayer displaySingleMonthOfMonth:month AndYear:year];
                return 0;
            }else{
                int month = atoi(argv[1]);
                int year = atoi(argv[2]);
                if(year <= 1753 || year >9999){
                    NSLog(@"cal: year %s not in range 1753..9999",argv[2]);
                    return 0;
                }
                if(month <= 0 || month > 12){
                    NSLog(@"cal: %s is not a month number (1..12)",argv[1]);//
                    return 0;
                }
                [MyDisplayer displaySingleMonthOfMonth:month AndYear:year];
                return 0;
            }
        }
        else if(argc == 4 && strcmp(argv[1],"-m") == 0){
            int month = atoi(argv[2]);
            int year = atoi(argv[3]);
            if(year <= 1753 || year >9999){
                NSLog(@"cal: year %s not in range 1753..9999",argv[3]);
                return 0;
            }
            if(month <= 0 || month > 12){
                NSLog(@"cal: %s is not a month number (1..12)",argv[2]);
                return 0;
            }
            [MyDisplayer displaySingleMonthOfMonth:month AndYear:year];
            //show the month of the year
        }
        
        
    }
    return 0;
}








