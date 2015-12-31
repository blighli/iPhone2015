#import <Foundation/Foundation.h>
#include <stdio.h>
@interface NewCalendar : NSObject
+(NSString *)getDateFromDate:(NSString *)date withMonth:(int)num;
+(int)firstWeekDayInMonth;
+ (int)weekdayStringFromDate:(NSDate*)inputDate ;
+ (NSDate *)getDateFromDate3:(NSString *)date withMonth:(int)num;
+ (int) howManyDayInThisMonth: (NSDate*)inputDate;
+ (NSDate *)changeDate;
+ (NSString *)changeDateFromOneDay:(NSString *)intputdate;
+ calMonthNow;
+ (id)calMonthwithMonth:(int)month Year:(int)year;
+ makeCalOneYearwith:(int)year;
+ (void)fmakeCalwithweekday:(int)weekday numOfDay:(int)numOfDay numOfWeeksInMonth:(int)numOfWeeksInMonth;
+ (void)makeCalwithweekday:(int)weekday numOfDay:(int)numOfDay numOfWeeksInMonth:(int)numOfWeeksInMonth;
@end
@implementation NewCalendar
//获得当月1号
+ (NSDate *)changeDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal
                               components:NSYearCalendarUnit | NSMonthCalendarUnit
                               fromDate:now];
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    //    NSString *s =[dateFormatter stringFromDate:firstDay];
    return firstDay;
}
//获得输入月1号
+ (NSString *)changeDateFromOneDay:(NSString *)intputdate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *newdate=[dateFormatter dateFromString:intputdate];
    
    //    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal
                               components:NSYearCalendarUnit | NSMonthCalendarUnit
                               fromDate:newdate];
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    NSString *s =[dateFormatter stringFromDate:firstDay];
    return s;
}
char s[6][7][5];
//三个参数产生月历
+ (void)makeCalwithweekday:(int)weekday numOfDay:(int)numOfDay numOfWeeksInMonth:(int)numOfWeeksInMonth{
    int count = 1;
    printf("  S  M  T  W  T  F  S\n");
    for (int j = 1;  j <= numOfWeeksInMonth+1; j++) {//周数
        for (int i = 1; i <= 7; i++) {//每周的7天
            if (j == 1 && i < weekday) {
                printf("   ");
                //sprintf(s[j-1][i-1],"%s","   ");
            }
            if (j == 1 && i >= weekday) {
                if (count <= 9) {
                    printf("  %i",count);
                    //sprintf(s[j-1][i-1],"  %i", count);
                }
                else{
                    printf(" %i",count);
                    //sprintf(s[j-1][i-1], " %i", count);
                }
                count ++;
                
            }
            if (j > 1 ) {
                if (count > numOfDay) {
                    printf("   ");
                    //sprintf(s[j-1][i-1],"%s","   ");
                }
                else{
                    if (count <= 9) {
                        printf("  %i",count);
                        //sprintf(s[j-1][i-1], "  %i",count);
                    }
                    else{
                        printf(" %i",count);
                        //sprintf(s[j-1][i-1], " %i",count);
                    }
                    count ++;
                }
                
            }
            
        }
        printf("\n");
    }
    return ;
}

//三个参数产生月历
+ (void)fmakeCalwithweekday:(int)weekday numOfDay:(int)numOfDay numOfWeeksInMonth:(int)numOfWeeksInMonth{
    int count = 1;
    for (int j = 1;  j <= numOfWeeksInMonth+1; j++) {//周数
        for (int i = 1; i <= 7; i++) {//每周的7天
            if (j == 1 && i < weekday) {
                //printf("   ");
                sprintf(s[j-1][i-1],"%s","   ");
            }
            if (j == 1 && i >= weekday) {
                if (count <= 9) {
                    //printf("  %i",count);
                    sprintf(s[j-1][i-1],"  %i", count);
                }
                else{
                    //printf(" %i",count);
                    sprintf(s[j-1][i-1], " %i", count);
                }
                count ++;
                
            }
            if (j > 1 ) {
                if (count > numOfDay) {
                    //printf("   ");
                    sprintf(s[j-1][i-1],"%s","   ");
                }
                else{
                    if (count <= 9) {
                        //printf("  %i",count);
                        sprintf(s[j-1][i-1], "  %i",count);
                    }
                    else{
                        //printf(" %i",count);
                        sprintf(s[j-1][i-1], " %i",count);
                    }
                    count ++;
                }
                
            }
            
        }
        //printf("\n");
    }
    return ;
}


//产生年例
+ makeCalOneYearwith:(int)year{
    NSDate *newdate=[NSDate date];
    //    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    //?没有设定日？
    NSDateComponents *comps = [cal
                               components:NSYearCalendarUnit | NSMonthCalendarUnit
                               fromDate:newdate];
    comps.year = year;
    
    //1月
    comps.month = 1;
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    int weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    int numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    //倍数
    int numOfWeeksInMonth;
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    char c1[6][7][5];
    memcpy(c1, s, sizeof(char)*5*6*7);
    
    //2月
    comps.month = 2;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c2[6][7][5];
    memcpy(c2, s, sizeof(char)*5*6*7);
    
    //3月
    comps.month = 3;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c3[6][7][5];
    memcpy(c3, s, sizeof(char)*5*6*7);
    
    //4月
    comps.month = 4;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    char c4[6][7][5];
    memcpy(c4, s, sizeof(char)*5*6*7);
    
    //5月
    comps.month = 5;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c5[6][7][5];
    memcpy(c5, s, sizeof(char)*5*6*7);
    
    //6月
    comps.month = 6;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c6[6][7][5];
    memcpy(c6, s, sizeof(char)*5*6*7);
    
    //7月
    comps.month = 7;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    char c7[6][7][5];
    memcpy(c7, s, sizeof(char)*5*6*7);
    
    //8月
    comps.month = 8;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c8[6][7][5];
    memcpy(c8, s, sizeof(char)*5*6*7);
    
    //9月
    comps.month = 9;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c9[6][7][5];
    memcpy(c9, s, sizeof(char)*5*6*7);
    
    //10月
    comps.month = 10;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    char c10[6][7][5];
    memcpy(c10, s, sizeof(char)*5*6*7);
    
    //11月
    comps.month = 11;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c11[6][7][5];
    memcpy(c11, s, sizeof(char)*5*6*7);
    
    //12月
    comps.month = 12;
    comps.day = 1;
    firstDay = [cal dateFromComponents:comps];
    weekday = [NewCalendar weekdayStringFromDate:firstDay];
    
    numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    [NewCalendar fmakeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    
    char c12[6][7][5];
    memcpy(c12, s, sizeof(char)*5*6*7);
    
    
    printf("\n");
    printf("                                %i",year);
    printf("\n");
    printf("           1月         ");
    printf("           2月         ");
    printf("           3月         ");
    printf("\n");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("\n");
    for (int j = 1; j <= 6; j++) {
        for (int i = 1; i <= 7; i++) {
            printf("%s",c1[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c2[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c3[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("\n");
    }
    printf("           4月         ");
    printf("           5月         ");
    printf("           6月         ");
    printf("\n");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("\n");
    for (int j = 1; j <= 6; j++) {
        for (int i = 1; i <= 7; i++) {
            printf("%s",c4[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c5[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c6[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("\n");
    }
    printf("           7月         ");
    printf("           8月         ");
    printf("           9月         ");
    printf("\n");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("\n");
    for (int j = 1; j <= 6; j++) {
        for (int i = 1; i <= 7; i++) {
            printf("%s",c7[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c8[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c9[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("\n");
    }
    printf("          10月         ");
    printf("          11月         ");
    printf("           12月         ");
    printf("\n");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("  ");
    printf("  S  M  T  W  T  F  S");
    printf("\n");
    for (int j = 1; j <= 6; j++) {
        for (int i = 1; i <= 7; i++) {
            printf("%s",c10[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c11[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("  ");
        for (int i = 1; i <= 7; i++) {
            printf("%s",c12[j-1][i-1]);
            //printf("(%i,%i)",j-1,i-1);
        }
        printf("\n");
    }
    
    
    return 0;
}

//输入当月月历
+ calMonthNow{
    NSDate *date = [NewCalendar changeDate];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents
    *dateComponents = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:date];
    
    int weekday = [NewCalendar weekdayStringFromDate:date];
    
    int numOfDay = [NewCalendar howManyDayInThisMonth: date];
    
    //倍数
    int numOfWeeksInMonth;
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay-(7-weekday+1)) /7 ;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    printf("      %li  %li月         \n", (long)dateComponents.year,(long)dateComponents.month);
    [NewCalendar makeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    return 0;
}
//指定某年某月的月历
+ (id)calMonthwithMonth:(int)month Year:(int)year{
    
    NSDate *newdate=[NSDate date];
    //    NSDate *now = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    //?没有设定日？
    NSDateComponents *comps = [cal
                               components:NSYearCalendarUnit | NSMonthCalendarUnit
                               fromDate:newdate];
    comps.year = year;
    comps.month = month;
    comps.day = 1;
    NSDate *firstDay = [cal dateFromComponents:comps];
    int weekday = [NewCalendar weekdayStringFromDate:firstDay];
    //NSLog(@"%d",weekday);
    
    int numOfDay = [NewCalendar howManyDayInThisMonth: firstDay];
    //NSLog(@"%d",numOfDay);
    
    //倍数
    int numOfWeeksInMonth;
    
    numOfWeeksInMonth = 1;
    numOfWeeksInMonth = numOfWeeksInMonth + (numOfDay - weekday)/7;
    if ((numOfDay-(7-weekday+1)) %7 > 0) {
        numOfWeeksInMonth += 1;
    }
    
    //numOfWeeksInMonth = (numOfDay-(7-weekday+1))/7+1;
    
    //NSLog(@"%d",numOfWeeksInMonth);
    printf("      %i  %i月         \n", year,month);
    
    [NewCalendar makeCalwithweekday:weekday numOfDay:numOfDay numOfWeeksInMonth:numOfWeeksInMonth];
    //    NSString *s =[dateFormatter stringFromDate:firstDay];
    return 0;
}
//+(int) numberOfWeeksInCurrentMonth{
//    NSUInteger weeks = 0;
//    NSUInteger weekday = [self firstWeekDayInMonth];
//    if (weekday > 0) {
//        weeks += 1;
//    }
//    NSUInteger monthDays = [self numberOfDaysInCurrentMonth];
//    weeks = weeks + (monthDays - weekday)/7;
//    if ((monthDays - weekday) %7 > 0) {
//        weeks += 1;
//    }
//
//    return weeks;
//}

//获得当天的星期 不是当月第一天的星期
+ (int)weekdayStringFromDate:(NSDate*)inputDate {
    
    //    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"Sunday", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    //NSLog(@"%ld",(long)theComponents.weekday);
    //NSLog(@"%@",[weekdays objectAtIndex:theComponents.weekday]);
    //return [weekdays objectAtIndex:theComponents.weekday];
    
    //强制转换？
    return (int)theComponents.weekday;
    
}
+ (int) howManyDayInThisMonth: (NSDate*)inputDate {
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:inputDate].length;
}
@end

int main()
{
    int month, year;
    char a[1000];
    char c[] = " ";
    gets(a);
    
    char *p = strtok(a,c);
    char *p1 = p;
    //printf("%s\n",p1);
    p = strtok(NULL,c);
    char *p2 = p;
    //printf("%s\n",p2);
    p = strtok(NULL,c);
    char *p3 = p;
    //printf("%s\n",p3);
    
    p = strtok(NULL,c);
    if (p) {
        printf("usage:cal [[month] year]\n      cal [-m month] [year]\n      cal [year]\n");
    }
    char *cal = "cal";
    if (strcmp(p1,cal)==0) {
        //printf("p1是cal\n");
    }
    //第二个为空
    if (p2 == '\0') {
        //printf("输出当前月历");
        [NewCalendar calMonthNow];
    }
    //第二个不为空
    else{
        char *_m = "-m";
        //第二个为-m
        if (strcmp(p2,_m)==0) {
            //printf("p2是-m\n");
            //p3是空
            if(p3 == '\0'){
                printf("usage:cal [[month] year]\n      cal [-m month] [year]\n      cal [year]\n");
            }
            //p3不是空
            else{
                //printf("p3不是空\n");
                int num3=atoi(p3);
                //printf("%i",num3);
                //p3为错误字符
                if (num3 == 0) {
                    printf("usage:cal [[month] year]\n      cal [-m month] [year]\n      cal [year]\n");
                }
                else{
                    //不可以写为0 < num3 <13
                    if (0 < num3 && num3 <13) {
                        month = num3;
                        //printf("输出当年某月月历\n");
                        [NewCalendar calMonthwithMonth:month Year:2015];
                    }
                    else{
                        printf("cal: %i is neither a month number (1..12) nor a name\n",num3);
                    }
                }
            }
        }
        //第二个不为-m
        else{
            int num2=atoi(p2);
            //printf("%i",num2);
            //第二个为错误字符
            if (num2 == 0) {
                printf("usage:cal [[month] year]\n      cal [-m month] [year]\n      cal [year]\n");
            }
            //第二个为数字
            else
                //p3为空
                if(p3 == '\0') {
                    //printf("输出某年年历\n");
                    year = num2;
                    [NewCalendar makeCalOneYearwith:year];
                }//p3不为空
                else
                {
                    int num3=atoi(p3);
                    //p3为错误字符
                    if (num3 == 0) {
                        printf("usage:cal [[month] year]\n      cal [-m month] [year]\n      cal [year]\n");
                    }
                    if (0 < num3 && num3 <13) {
                        year = num3;
                        month = num2;
                        //printf("输出某年某月月历\n");
                        [NewCalendar calMonthwithMonth:month Year:year];
                    }
                    else{
                        printf("cal: %i is neither a month number (1..12) nor a name\n",num2);
                    }
                }
        }
    }
}