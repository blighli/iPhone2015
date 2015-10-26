//
//  main.m
//  TestTwo
//
//  Created by gongzhentao on 15/10/17.
//  Copyright © 2015年 gongzhentao. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isLeapYear (int year) {
    if (year < 1800 && year % 4 == 0) {
        return true;
    }else if ((year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)) {
        return true;
    }
    else {
        return false;
    }
}
void printWeekTab() {
    printf("Su Mo Tu We Th Fr Sa");
}
void printMonthTab(int year, int month) {
    switch (month) {
        case 1:
            printf("    January %d",year);
            break;
        case 2:
            printf("    February %d",year);
            break;
        case 3:
            printf("     March %d",year);
            break;
        case 4:
            printf("     April %d",year);
            break;
        case 5:
            printf("      May %d",year);
            break;
        case 6:
            printf("     June %d",year);
            break;
        case 7:
            printf("     July %d",year);
            break;
        case 8:
            printf("    August %d",year);
            break;
        case 9:
            printf("   September %d",year);
            break;
        case 10:
            printf("    October %d",year);
            break;
        case 11:
            printf("   November %d",year);
            break;
        case 12:
            printf("   December %d",year);
            break;
    }
}
int endOfMonth (int year, int month) {
    switch (month) {
        case 1:
            return 31;
        case 2:
            if (isLeapYear(year)) {
                return 29;
            }
            return 28;
        case 3:
            return 31;
        case 4:
            return 30;
        case 5:
            return 31;
        case 6:
            return 30;
        case 7:
            return 31;
        case 8:
            return 31;
        case 9:
            return 30;
        case 10:
            return 31;
        case 11:
            return 30;
        case 12:
            return 31;
    }
    return 0;
}

int* fillMonth(int year,int month) {

    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* comp = [[NSDateComponents alloc] init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:1];
    [comp setHour:9];
    NSDate* date = [calendar dateFromComponents:comp];
    comp = [calendar components:NSCalendarUnitWeekday fromDate:date];

    int startOfWeek = (int)comp.weekday - 1;
    int i = 1;
    int k = startOfWeek;
    static int cal[6][7];
    for (int row = 0; row < 6; row++) {
        for (int col = 0; col < 7; col++) {
            cal[row][col] = 0;
        }
    }
    for (int col = 0; col < 7; col++) {
        if (k) {
            cal[0][col] = 0;
            k--;
        } else {
            cal[0][col] = i;
            i++;
        }
    }
    for (int row = 1; i <= endOfMonth(year, month); row++) {
        for (int col = 0; col < 7; col++) {
            cal[row][col] = i;
            i++;
            if(i > endOfMonth(year, month)) {
                break;
            }
        }
    }
    return cal;
}

void printMonth(int year, int month, int* cal) {
    printMonthTab(year, month);
    printf("\n");
    printWeekTab();
    printf("\n");
    //NSLog(@"Su Mo Tu We Th Fr Sa");
    for (int row = 0; row < 6; row++) {
        for (int col = 0; col < 7; col++) {
            if (*cal == 0) {
                printf("   ");
                cal ++;
            } else {
                printf("%2d ",*cal ++);
            }
        }
        printf("\n");
    }
}

int* fillYear(int year,int l) {
    static int cal[6][21];
    for (int row = 0; row < 6; row++) {
        for (int col = 0; col < 21; col++) {
            cal[row][col] = 0;
        }
    }
    int* p;
    for(int i = 1;i < 4; i++) {
        p = fillMonth(year, i + (l - 1));
        for (int row = 0; row < 6; row++) {
            for (int col = 0 + (i - 1) * 7; col < 7 + (i - 1) * 7; col++) {
                cal[row][col] = *p ++;
            }
        }
    }
    return cal;
}

void printYear(int month, int* cal) {
    switch (month) {
        case 1:
            printf("      January               February               March");
            break;
        case 4:
            printf("       April                  May                   June");
            break;
        case 7:
            printf("        July                 August              September");
            break;
        case 10:
            printf("      October               November              December");
            break;
        default:
            break;
    }
    printf("\n");
    printf("Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n");
    for (int row = 0; row < 6; row++) {
        for (int col = 0; col < 21; col++) {
            if (col == 7 || col == 14) {
                printf(" ");
            }
            if (*cal == 0) {
                printf("   ");
                cal ++;
            } else {
                printf("%2d ",*cal ++);
            }
        }
        printf("\n");
    }
}

int main(int argc, const char * argv[]) {
    
        if (argc > 3) {
            printf("usage: cal [- m month] [year]\n");
        } else {
            
            NSString *arg1 = [NSString stringWithFormat:@"%s", argv[1]];
            NSString *arg2 = [NSString stringWithFormat:@"%s", argv[2]];
            
            NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
            NSDateComponents* comp = [[NSDateComponents alloc] init];
            NSDate* date = [NSDate date];
            unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth;
            comp = [calendar components:unitFlags fromDate:date];
            int year = (int)comp.year;
            int month = (int)comp.month;
            
            switch (argc) {
                case 1:
                    //情形一："cal";
                    printMonth(year, month,fillMonth(year,month));
                    break;
                case 2:
                    //情形二："cal Year"
                    if ([arg1 intValue] > 0 && [arg1 intValue] < 9999) {
                        printf("                             %d\n", year);
                        printYear(1, fillYear([arg1 intValue], 1));
                        printYear(4, fillYear([arg1 intValue], 4));
                        printYear(7, fillYear([arg1 intValue], 7));
                        printYear(10, fillYear([arg1 intValue], 10));
                    } else {
                        printf("year %d not in range 1..9999", [arg1 intValue]);
                    }
                    break;
                case 3:{
                    if (strcmp(argv[1], "-m") == 0) {

                        if ([arg2 intValue] > 0 && [arg2 intValue] < 12) {
                            printMonth(year, [arg2 intValue], fillMonth(year, [arg2 intValue]));
                        } else {
                            printf("%d is neither a month number (1..12) nor a name",[arg2 intValue]);
                        }
                    } else {
                        //情形四："cal Month Year"
                        if ([arg1 intValue] > 0 && [arg1 intValue] < 12 &&
                                [arg2 intValue] > 0 && [arg2 intValue] < 9999) {
                            printMonth([arg2 intValue], [arg1 intValue],
                                       fillMonth([arg2 intValue], [arg1 intValue]));
                        } else {
                            printf("command not found");
                        }
                    }
                    break;
                }
                default:
                    break;
            }
        }
        return 0;
    
}
