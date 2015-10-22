#import <Foundation/Foundation.h>

@interface NSDate (CalculateDay)
/**
 *  获取对应月份的天数
 *
 *  @return 对应月份的天数
 */
- (NSUInteger)daysOfMonth;
/**
 *  获取对应年份的天数
 *
 *  @return 对应年份的天数
 */
- (NSUInteger)daysOfYear;

/**
 *  获取对应月的第一天是星期几
 *
 *  @return 对应月的第一天是星期几
 */

-(NSUInteger)fWeekDayOfMonth:(NSInteger)Year setMonth:(NSInteger)Month;
///**
//   *  获取对应月份的第一天时间
//   *
//   *  @return 对应月份的第一天时间
//   */
//- (NSDate *)firstDayOfMonth;
//
///**
//   *  获取对应月份的最后一天时间
//   *
//   *  @return 对应月份的最后一天时间
//   */
//- (NSDate *)lastDayOfMonth;
//
///**
//   *  根据月数和天数间隔，获取间隔后的时间
//   *
//   *  @param months 月数间隔
//   *  @param days   天数间隔
//   *
//   *  @return 间隔后的时间
//   */
//- (NSDate *)addMonthAndDay:(NSUInteger)months days:(NSUInteger)days;
//
///**
//   *  根据开始时间和结束时间，获取间隔的时间数组
//   *
//   *  @param toDate 结束时间
//   *
//   *  @return 间隔的时间数组（月数和天数；toDate-fromDate的比较值是有符号整数NSInteger，所以存在负数的可能）
//   */
//- (NSArray *)monthAndDayBetweenTwoDates:(NSDate *)toDate;

@end