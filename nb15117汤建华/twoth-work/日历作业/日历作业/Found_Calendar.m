

#import "Found_Calendar.h"

@implementation NSDate (CalculateDay)

- (NSUInteger)daysOfMonth {
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [gregorian rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

- (NSUInteger)daysOfYear {
    NSUInteger days = 0;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear fromDate:self];
    for (NSUInteger i=1; i<=12; i++) {
        [comps setMonth:i];
        days += [[gregorian dateFromComponents:comps] daysOfMonth];
    }
    return days;
}
-(NSUInteger)fWeekDayOfMonth:(NSInteger)Year setMonth:(NSInteger)Month{
    NSDateComponents *comp = [[NSDateComponents alloc] init];
    [comp setMonth:Month];
    [comp setDay:01];
    [comp setYear:Year];
    NSCalendar *myCal02 = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *myDate1 = [myCal02 dateFromComponents:comp];
    //        [myCal02 setFirstWeekday:1];
    NSInteger count = [myCal02 ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth  forDate:myDate1];
    return count;
};
@end