//
//  main.m
//  Cal
//
//  Created by LYH on 15/10/17.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <getopt.h>
#import <time.h>
#import <stdlib.h>

const NSString* legalFormat[] = {
    @"",
    @"year",
    @"month year",
    @"-m month",
    @"-m month year"
};

const NSString* correspondingYear[] = {
    @"currentYear",
    @"1",
    @"2",
    @"currentYear",
    @"3"
};

const NSString* correspondingMonth[] = {
    @"currentMonth",
    @"allMonth",
    @"1",
    @"2",
    @"2"
};

const char* monthName[] = {
    "一月",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "十一月",
    "十二月"
};

const char* weekName[] = {
    "日",
    "一",
    "二",
    "三",
    "四",
    "五",
    "六"
};

const int leapYearMonth[] = {
    31, 29, 31,
    30, 31, 30,
    31, 31, 30,
    31, 30, 31
};

const int nonLeapYearMonth[] = {
    31, 28, 31,
    30, 31, 30,
    31, 31, 30,
    31, 30, 31
};

enum FormatError {
    FE_FORMAT_ERROR = 1,
    FE_YEAR_ERROR,
    FE_MONTH_ERROR
};

void parseMonth(char *arg, int *month) {
    *month = 0;
    for (int i = 0; i < strlen(arg); ++i) {
        if (!isdigit(arg[i])) {
            break;
        }
        *month = *month * 10 + arg[i] - '0';
    }
    for (int i = 1; i < 12; ++i)
        *(month + i) = 0;
}

void parseYear(char *arg, int *year) {
    *year = 0;
    for (int i = 0; i < strlen(arg); ++i) {
        if (!isdigit(arg[i])) {
            break;
        }
        *year = *year * 10 + arg[i] - '0';
    }
}

bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
}

bool isIllegalYear(int year) {
    return !(1900 <= year && year <= 9999);
}

bool isIllegalMonth(int month) {
    return !(1 <= month && month <= 12);
}

int parseInputFormat(int argc, char **argv, int *year, int *month) {

    //format-judging
    int formatId = sizeof(legalFormat) / sizeof(legalFormat[0]);
    switch (argc) {
        case 1:
            formatId = 0;
            break;
        case 2:
            formatId = 1;
            break;
        case 3:
            if (strcmp(argv[1], "-m") == 0) {
                formatId = 3;
            } else {
                formatId = 2;
            }
            break;
        case 4:
            if (strcmp(argv[1], "-m") == 0) {
                formatId = 4;
            }
            break;
        default:
            return FE_FORMAT_ERROR;
    }

    if (formatId < 0 || formatId >= sizeof(legalFormat) / sizeof(legalFormat[0])) {
        return FE_FORMAT_ERROR;
    }
    //year&month parsing
      //get current time
    time_t rawTime;
    struct tm *timeInfo;
    time(&rawTime);
    timeInfo = localtime(&rawTime);
      //format-parsing
    if ([correspondingYear[formatId]  isEqual: @"currentYear"]) {
        *year = timeInfo->tm_year + 1900;
    } else {
        int col = [correspondingYear[formatId] intValue];
        parseYear(argv[col], year);
    }
    if ([correspondingMonth[formatId] isEqual: @"allMonth"]) {
        for (int i = 0; i < 12; ++i) {
            *(month + i) = i + 1;
        }
    } else if ([correspondingMonth[formatId] isEqual: @"currentMonth"]) {
        *month = timeInfo->tm_mon + 1;
        for (int i = 1; i < 12; ++i)
            *(month + i) = 0;
    } else {
        int col = [correspondingMonth[formatId] intValue];
        parseMonth(argv[col], month);
    }
    
    if (isIllegalYear(*year)) {
        return FE_YEAR_ERROR;
    }
    if (isIllegalMonth(*month)) {
        return FE_MONTH_ERROR;
    }
    
    return 0;
}

int parseWeek(int year, int month, int day) {
    //1900-01-01 Mon

    int totalPassDay = 0;
    for (int i = 1; i < year; ++i) {
        if (isLeapYear(i)) {
            totalPassDay += 366;
        } else {
            totalPassDay += 365;
        }
    }
    for (int i = 1; i < month; ++i) {
        if (isLeapYear(year)) {
            totalPassDay += leapYearMonth[i - 1];
        } else {
            totalPassDay += nonLeapYearMonth[i - 1];
        }
    }
    totalPassDay += day - 1;
    
    return (1 + totalPassDay) % 7;
}

void memwrite(char *str, int *length, const char *append) {
    int size = (int)strlen(append);
    memcpy(str + *length, append, size);
    *length += size;
}

void scheduleForMonth(int year, int month, char *output) {
    int length = 0;
    const char *weekstr = "日 一 二 三 四 五 六";
    memwrite(output, &length, weekstr);
    output[length++] = '\n';
    int firstdayweek = parseWeek(year, month, 1);
    int spaceCount = firstdayweek * 3 - 1;
    for (int i = 0; i < spaceCount; ++i)
        output[length++] = ' ';
    output[length] = 0;
    int monthDay = isLeapYear(year) ? leapYearMonth[month - 1] : nonLeapYearMonth[month - 1];
    for (int i = 1, w = firstdayweek; i <= monthDay; ++i, w = (w + 1) % 7) {
        char str[16];
        sprintf(str, "%2d", i);
        if (w != 0) {
            output[length++] = ' ';
        }
        memwrite(output, &length, str);
        if (w == 6) {
            output[length++] = '\n';
        }
    }
    output[length] = 0;
}

int main(int argc, char *argv[]) {
    int year;
    int month[12];
    int parseResult = parseInputFormat(argc, argv, &year, month);
    switch (parseResult) {
        case FE_FORMAT_ERROR:
            puts("input format error");
            break;
        case FE_YEAR_ERROR:
            printf("intput year %d is out of range[1900...9999]\n", year);
            break;
        case FE_MONTH_ERROR:
            printf("intput month %d is out of range[1...12]\n", month[0]);
            break;
    }
    if (parseResult != 0) {
        exit(1);
    }
    
    
    if (month[1] == 0) { //print one month
        char output[512];
        int length = 0;
        char topic[32];
        sprintf(topic, "%s %d", monthName[month[0] - 1], year);
        int spaceCount = 10 - (int)strlen(topic) / 2;
        for (int i = 0; i < spaceCount; ++i)
            output[length++] = ' ';
        memwrite(output, &length, topic);
        output[length++] = '\n';
        scheduleForMonth(year, month[0], output + length);
        puts(output);
    } else { //print all month
        char output[4016];
        int length = 0;
        char topic[32];
        sprintf(topic, "%d", year);
        int spaceCount = 32 - (int)strlen(topic) / 2;
        
        for (int i = 0; i < spaceCount; ++i)
            output[length++] = ' ';
        memwrite(output, &length, topic);
        output[length++] = '\n';
        output[length++] = '\n';
        for (int i = 0; i < 4; ++i) {
            // line for month name
            if (i == 0) {
                memwrite(output, &length, "        一月                  二月                  三月");
            } else if (i == 1) {
                memwrite(output, &length, "        四月                  五月                  六月");
            } else if (i == 2) {
                memwrite(output, &length, "        七月                  八月                  九月");
            } else {
                memwrite(output, &length, "        十月                 十一月                十二月");
            }
            output[length++] = '\n';
            //line for weekday
            const char *weekPattern = "日 一 二 三 四 五 六  日 一 二 三 四 五 六  日 一 二 三 四 五 六";
            memwrite(output, &length, weekPattern);
            output[length++] = '\n';
            
            //lines for schedule
            int day[3] = {0, 0, 0};
            for (int j = 0; j < 6; ++j) {
                for (int k = 0; k < 3; ++k) {
                    ++day[k];
                    int monthId = i * 3 + k;
                    int monthDay = isLeapYear(year) ? leapYearMonth[monthId] : nonLeapYearMonth[monthId];
                    if (k != 0) {
                        output[length++] = ' ';
                        output[length++] = ' ';
                    }
                    if (day[k] <= monthDay) {
                        int firstdayweek = parseWeek(year, monthId + 1, day[k]);
                        int spaceCount = firstdayweek * 3 - 1;
                        for (int x = 0; x < spaceCount; ++x)
                            output[length++] = ' ';
                        
                        int w;
                        for (w = firstdayweek; day[k] <= monthDay; ++day[k], w = (w + 1) % 7) {
                            if (w != 0)
                                output[length++] = ' ';
                            char str[16];
                            sprintf(str, "%2d", day[k]);
                            memwrite(output, &length, str);
                            if (w == 6) {
                                break;
                            }
                      }
                      if (day[k] > monthDay) {
                          for (; w <= 6; ++w) {
                              output[length++] = ' ';
                              output[length++] = ' ';
                              output[length++] = ' ';
                          }
                          
                      }
                    } else {
                        for (int x = 0; x < 20; ++x)
                            output[length++] = ' ';
                    }
                    
                }
                output[length++] = '\n';
            }
        }
        puts(output);
    }
    return 0;
}