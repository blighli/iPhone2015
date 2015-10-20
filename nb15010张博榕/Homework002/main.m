//
//  main.m
//  CalendarBor
//
//  Created by Bor on 15/10/17.
//  Copyright © 2015年 Apres. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSCalendar.h>
#import <Foundation/NSData.h>
#import <Foundation/NSCalendarDate.h>
#import <Foundation/NSDateFormatter.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        char insert[50] = {0};
        char str[20] = {0};
        char yearStr[20] = {0};
        char monthStr[20] = {0};
        int year = 0;
        int month = 0;
        int monthYear = 0;
        
        //scanf("%s", insert);
        printf("please insert cal's command: ");
        //gets(insert);
        fgets(insert, sizeof(insert), stdin);
        strncpy(str, insert + 0, 3);
        strncpy(monthStr, insert + 4, 2);
        NSString *strMonth = [NSString stringWithUTF8String:monthStr];
        
        month = atoi(monthStr);
        if(month > 0 && month < 10 && ![strMonth isEqualToString:@"-m"]){
            strncpy(yearStr, insert + 6, 4);
            year =atoi(yearStr);
        }else if(month >= 10 && month < 13 && ![strMonth isEqualToString:@"-m"]){
            strncpy(yearStr, insert + 7, 4);
            year =atoi(yearStr);
        }else if(month >= 13){
            strncpy(yearStr, insert + 4, 4);
            year =atoi(yearStr);
            int monthYear = 1;
        }
        if([strMonth isEqualToString:@"-m"]){
            strncpy(monthStr, insert + 7, 2);
            year = 0;
        }
        month = atoi(monthStr);
        
        NSString *strChange = [NSString stringWithUTF8String:str];
        NSString *end = [NSString stringWithUTF8String:insert];
        
        while(![end isEqualToString:@"end"]){
            monthYear = 0;
            strncpy(str, insert + 0, 3);
            strncpy(monthStr, insert + 4, 2);
            NSString *strMonth = [NSString stringWithUTF8String:monthStr];
            
            month = atoi(monthStr);
            if(month > 0 && month <10 && ![strMonth isEqualToString:@"-m"]){
                strncpy(yearStr, insert + 6, 4);
                year =atoi(yearStr);
            }else if(month >= 10 && month < 13 && ![strMonth isEqualToString:@"-m"]){
                strncpy(yearStr, insert + 7, 4);
                year =atoi(yearStr);
            }else if(month >= 13){
                strncpy(yearStr, insert + 4, 4);
                year =atoi(yearStr);
                monthYear = 1;
            }
            if([strMonth isEqualToString:@"-m"]){
                strncpy(monthStr, insert + 7, 2);
                year = 0;
            }
            month = atoi(monthStr);
            
            NSString *strChange = [NSString stringWithUTF8String:str];
            if([strChange isEqualToString:@"cal"] && monthYear == 1){
                int i;
                for(i = 1; i <= 12; i++){
                    NSInteger compsYear = year;
                    NSInteger compsMonth = i;
                    NSInteger compsDay = 0;
                    //获得当前日期
                    
                    NSDateComponents *comps = [[NSDateComponents alloc] init];
                    [comps setYear:compsYear];
                    [comps setMonth:compsMonth];
                    [comps setDay:compsDay];
                    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDate *date = [calendar dateFromComponents:comps];
                    
                    //本月第一天的星期
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
                    [formatter setTimeZone:timeZone];
                    [formatter setDateFormat:@"M/d/yyyy"];
                    NSString *firstDay = [NSString stringWithFormat:@"%ld/%d/%ld",(long)compsMonth,2,(long)compsYear];
                    date = [formatter dateFromString:firstDay];
                    comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
                    NSInteger weekday = [comps weekday];
                    //NSLog(@"%@", date);
                    //NSLog(@"%ld", (long)weekday - 2);
                    
                    //下月第一天
                    NSDateComponents *c1 = [[NSDateComponents alloc] init];
                    [c1 setMonth:1];
                    NSDate *date2 = [calendar dateByAddingComponents:c1 toDate:date options:0];
                    //NSLog(@"%@", date2);
                    
                    //本月最后一天
                    NSDateComponents *c2 = [[NSDateComponents alloc] init];
                    [c2 setDay:-2];
                    NSDate *date3 = [calendar dateByAddingComponents:c2 toDate:date2 options:0];
                    comps = [calendar components:(NSCalendarUnitDay) fromDate:date3];
                    NSInteger maxDays = [comps day];
                    //NSLog(@"%ld", (long)maxDays);
                    //输出本月月份英文
                    NSString *chineseNumber;
                    switch (compsMonth) {
                        case 1:chineseNumber = [NSString stringWithUTF8String:"Janurary"];break;
                        case 2:chineseNumber = [NSString stringWithUTF8String:"February"];break;
                        case 3:chineseNumber = [NSString stringWithUTF8String:"March"];break;
                        case 4:chineseNumber = [NSString stringWithUTF8String:"April"];break;
                        case 5:chineseNumber = [NSString stringWithUTF8String:"May"];break;
                        case 6:chineseNumber = [NSString stringWithUTF8String:"June"];break;
                        case 7:chineseNumber = [NSString stringWithUTF8String:"July"];break;
                        case 8:chineseNumber = [NSString stringWithUTF8String:"August"];break;
                        case 9:chineseNumber = [NSString stringWithUTF8String:"September"];break;
                        case 10:chineseNumber = [NSString stringWithUTF8String:"October"];break;
                        case 11:chineseNumber = [NSString stringWithUTF8String:"November"];break;
                        case 12:chineseNumber = [NSString stringWithUTF8String:"December"];break;
                        default:break;
                    }
                    //NSLog(@"%@", chineseNumber);
                    const char *cMonth =[chineseNumber UTF8String];
                    
                    int k, j;
                    
                    printf("    %s  %ld\n", cMonth, (long)compsYear);
                    printf("Su Mo Tu We Tr Fr Sa\n");
                    weekday = weekday - 2;
                    for(k = 0; k < weekday; k++) printf("   ");
                    for(j = 1; j <= maxDays; j++)
                    {
                        printf("%2d ",j);
                        if(++weekday >= 7)
                        {
                            printf("\n");
                            weekday = weekday % 7;
                        }
                    }
                    printf("\n\n");

                }
            }
            if([strChange isEqualToString:@"cal"] && year == 0 && month == 0){
                NSDate *date = [NSDate date];
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *comps;
                
                //本年
                comps = [calendar components:(NSCalendarUnitYear) fromDate:date];
                NSInteger compsYear = [comps year];
                //本月
                comps = [calendar components:(NSCalendarUnitMonth) fromDate:date];
                NSInteger compsMonth = [comps month];
                
                //本月第一天的星期
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                NSTimeZone *timeZone = [NSTimeZone localTimeZone];
                [formatter setTimeZone:timeZone];
                [formatter setDateFormat:@"M/d/yyyy"];
                NSString *firstDay = [NSString stringWithFormat:@"%ld/%d/%ld",(long)compsMonth,2,(long)compsYear];
                date = [formatter dateFromString:firstDay];
                comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
                NSInteger weekday = [comps weekday];
                //NSLog(@"%@", date);
                //NSLog(@"%ld", (long)weekday - 2);
                
                //下月第一天
                NSDateComponents *c1 = [[NSDateComponents alloc] init];
                [c1 setMonth:1];
                NSDate *date2 = [calendar dateByAddingComponents:c1 toDate:date options:0];
                //NSLog(@"%@", date2);
                
                //本月最后一天
                NSDateComponents *c2 = [[NSDateComponents alloc] init];
                [c2 setDay:-2];
                NSDate *date3 = [calendar dateByAddingComponents:c2 toDate:date2 options:0];
                comps = [calendar components:(NSCalendarUnitDay) fromDate:date3];
                NSInteger maxDays = [comps day];
                //NSLog(@"%ld", (long)maxDays);
                
                //输出本月月份英文
                NSString *chineseNumber;
                switch (compsMonth) {
                    case 1:chineseNumber = [NSString stringWithUTF8String:"Janurary"];break;
                    case 2:chineseNumber = [NSString stringWithUTF8String:"February"];break;
                    case 3:chineseNumber = [NSString stringWithUTF8String:"March"];break;
                    case 4:chineseNumber = [NSString stringWithUTF8String:"April"];break;
                    case 5:chineseNumber = [NSString stringWithUTF8String:"May"];break;
                    case 6:chineseNumber = [NSString stringWithUTF8String:"June"];break;
                    case 7:chineseNumber = [NSString stringWithUTF8String:"July"];break;
                    case 8:chineseNumber = [NSString stringWithUTF8String:"August"];break;
                    case 9:chineseNumber = [NSString stringWithUTF8String:"September"];break;
                    case 10:chineseNumber = [NSString stringWithUTF8String:"October"];break;
                    case 11:chineseNumber = [NSString stringWithUTF8String:"November"];break;
                    case 12:chineseNumber = [NSString stringWithUTF8String:"December"];break;
                    default:break;
                }
                //NSLog(@"%@", chineseNumber);
                const char *cMonth =[chineseNumber UTF8String];
                
                int k, j;
                
                printf("    %s  %ld\n", cMonth, (long)compsYear);
                printf("Su Mo Tu We Tr Fr Sa\n");
                weekday = weekday - 2;
                for(k = 0; k < weekday; k++) printf("   ");
                for(j = 1; j <= maxDays; j++)
                {
                    printf("%2d ",j);
                    if(++weekday >= 7)
                    {
                        printf("\n");
                        weekday = weekday % 7;
                    }
                }
                printf("\n");
            }else if([strChange isEqualToString:@"cal"] && [strMonth isEqualToString:@"-m"] && month != 0){
                NSDate *date = [NSDate date];
                NSCalendar *calendar = [NSCalendar currentCalendar];
                NSDateComponents *comps;
                
                //本年
                comps = [calendar components:(NSCalendarUnitYear) fromDate:date];
                NSInteger compsYear = [comps year];
                //本月
                NSInteger compsMonth = month;
                
                //本月第一天的星期
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                NSTimeZone *timeZone = [NSTimeZone localTimeZone];
                [formatter setTimeZone:timeZone];
                [formatter setDateFormat:@"M/d/yyyy"];
                NSString *firstDay = [NSString stringWithFormat:@"%ld/%d/%ld",(long)compsMonth,2,(long)compsYear];
                date = [formatter dateFromString:firstDay];
                comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
                NSInteger weekday = [comps weekday];
                //NSLog(@"%@", date);
                //NSLog(@"%ld", (long)weekday - 2);
                
                //下月第一天
                NSDateComponents *c1 = [[NSDateComponents alloc] init];
                [c1 setMonth:1];
                NSDate *date2 = [calendar dateByAddingComponents:c1 toDate:date options:0];
                //NSLog(@"%@", date2);
                
                //本月最后一天
                NSDateComponents *c2 = [[NSDateComponents alloc] init];
                [c2 setDay:-2];
                NSDate *date3 = [calendar dateByAddingComponents:c2 toDate:date2 options:0];
                comps = [calendar components:(NSCalendarUnitDay) fromDate:date3];
                NSInteger maxDays = [comps day];
                //NSLog(@"%ld", (long)maxDays);
                
                //输出本月月份英文
                NSString *chineseNumber;
                switch (compsMonth) {
                    case 1:chineseNumber = [NSString stringWithUTF8String:"Janurary"];break;
                    case 2:chineseNumber = [NSString stringWithUTF8String:"February"];break;
                    case 3:chineseNumber = [NSString stringWithUTF8String:"March"];break;
                    case 4:chineseNumber = [NSString stringWithUTF8String:"April"];break;
                    case 5:chineseNumber = [NSString stringWithUTF8String:"May"];break;
                    case 6:chineseNumber = [NSString stringWithUTF8String:"June"];break;
                    case 7:chineseNumber = [NSString stringWithUTF8String:"July"];break;
                    case 8:chineseNumber = [NSString stringWithUTF8String:"August"];break;
                    case 9:chineseNumber = [NSString stringWithUTF8String:"September"];break;
                    case 10:chineseNumber = [NSString stringWithUTF8String:"October"];break;
                    case 11:chineseNumber = [NSString stringWithUTF8String:"November"];break;
                    case 12:chineseNumber = [NSString stringWithUTF8String:"December"];break;
                    default:break;
                }
                //NSLog(@"%@", chineseNumber);
                const char *cMonth =[chineseNumber UTF8String];
                
                int k, j;
                
                printf("    %s  %ld\n", cMonth, (long)compsYear);
                printf("Su Mo Tu We Tr Fr Sa\n");
                weekday = weekday - 2;
                for(k = 0; k < weekday; k++) printf("   ");
                for(j = 1; j <= maxDays; j++)
                {
                    printf("%2d ",j);
                    if(++weekday >= 7)
                    {
                        printf("\n");
                        weekday = weekday % 7;
                    }
                }
                printf("\n");
            }else if([strChange isEqualToString:@"cal"] && year > 0 && month > 0 && month < 13){
                
                NSInteger compsYear = year;
                NSInteger compsMonth = month;
                NSInteger compsDay = 0;
                //获得当前日期
                
                NSDateComponents *comps = [[NSDateComponents alloc] init];
                [comps setYear:compsYear];
                [comps setMonth:compsMonth];
                [comps setDay:compsDay];
                NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                NSDate *date = [calendar dateFromComponents:comps];
                
                //NSLog(@"%@", date);
                
                //本月第一天的星期
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                NSTimeZone *timeZone = [NSTimeZone localTimeZone];
                [formatter setTimeZone:timeZone];
                [formatter setDateFormat:@"M/d/yyyy"];
                NSString *firstDay = [NSString stringWithFormat:@"%ld/%d/%ld",(long)compsMonth,2,(long)compsYear];
                date = [formatter dateFromString:firstDay];
                comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
                NSInteger weekday = [comps weekday];
                //NSLog(@"%@", date);
                //NSLog(@"%ld", (long)weekday - 2);
                
                //下月第一天
                NSDateComponents *c1 = [[NSDateComponents alloc] init];
                [c1 setMonth:1];
                NSDate *date2 = [calendar dateByAddingComponents:c1 toDate:date options:0];
                //NSLog(@"%@", date2);
                
                //本月最后一天
                NSDateComponents *c2 = [[NSDateComponents alloc] init];
                [c2 setDay:-2];
                NSDate *date3 = [calendar dateByAddingComponents:c2 toDate:date2 options:0];
                comps = [calendar components:(NSCalendarUnitDay) fromDate:date3];
                NSInteger maxDays = [comps day];
                //NSLog(@"%ld", (long)maxDays);
                
                //输出本月月份汉字
                //            NSString *chineseNumber;
                //            switch (compsMonth) {
                //                case 1:chineseNumber = [NSString stringWithUTF8String:"一"];break;
                //                case 2:chineseNumber = [NSString stringWithUTF8String:"二"];break;
                //                case 3:chineseNumber = [NSString stringWithUTF8String:"三"];break;
                //                case 4:chineseNumber = [NSString stringWithUTF8String:"四"];break;
                //                case 5:chineseNumber = [NSString stringWithUTF8String:"五"];break;
                //                case 6:chineseNumber = [NSString stringWithUTF8String:"六"];break;
                //                case 7:chineseNumber = [NSString stringWithUTF8String:"七"];break;
                //                case 8:chineseNumber = [NSString stringWithUTF8String:"八"];break;
                //                case 9:chineseNumber = [NSString stringWithUTF8String:"九"];break;
                //                case 10:chineseNumber = [NSString stringWithUTF8String:"十"];break;
                //                case 11:chineseNumber = [NSString stringWithUTF8String:"十一"];break;
                //                case 12:chineseNumber = [NSString stringWithUTF8String:"十二"];break;
                //                default:break;
                //            }
                //            NSLog(@"%@", chineseNumber);
                //            const char *cMonth =[chineseNumber UTF8String];
                //输出本月月份英文
                NSString *chineseNumber;
                switch (compsMonth) {
                    case 1:chineseNumber = [NSString stringWithUTF8String:"Janurary"];break;
                    case 2:chineseNumber = [NSString stringWithUTF8String:"February"];break;
                    case 3:chineseNumber = [NSString stringWithUTF8String:"March"];break;
                    case 4:chineseNumber = [NSString stringWithUTF8String:"April"];break;
                    case 5:chineseNumber = [NSString stringWithUTF8String:"May"];break;
                    case 6:chineseNumber = [NSString stringWithUTF8String:"June"];break;
                    case 7:chineseNumber = [NSString stringWithUTF8String:"July"];break;
                    case 8:chineseNumber = [NSString stringWithUTF8String:"August"];break;
                    case 9:chineseNumber = [NSString stringWithUTF8String:"September"];break;
                    case 10:chineseNumber = [NSString stringWithUTF8String:"October"];break;
                    case 11:chineseNumber = [NSString stringWithUTF8String:"November"];break;
                    case 12:chineseNumber = [NSString stringWithUTF8String:"December"];break;
                    default:break;
                }
                //NSLog(@"%@", chineseNumber);
                const char *cMonth =[chineseNumber UTF8String];
                
                int k, j;
                //创建二维数组
                //            int apple[6][6], i = 0, j = 0;
                //            int number = 1, count = 7;
                //            count = count - weekday;
                //            while(j < 4){
                //                apple[0][j] = nil;
                //                j++;
                //            }
                //            while(count <= 7){
                //                apple[0][count] = number;
                //                number++;
                //                count++;
                //            }
                //            for(i = 1; i <= 6; i++){
                //                for(j = 0; j <= 6; j++){
                //                    apple[i][j] = number;
                //                    number++;
                //                    if(number > maxDays) break;
                //                }
                //            }
                printf("    %s  %ld\n", cMonth, (long)compsYear);
                printf("Su Mo Tu We Tr Fr Sa\n");
                weekday = weekday - 2;
                for(k = 0; k < weekday; k++) printf("   ");
                for(j = 1; j <= maxDays; j++)
                {
                    printf("%2d ",j);
                    if(++weekday >= 7)
                    {
                        printf("\n");
                        weekday = weekday % 7;
                    }
                }
                printf("\n");
                
                
                
                //新建二维数组
                //NSMutableArray *columnArray=[NSMutableArray arrayWithCapacity:7];
                //            NSMutableArray *rowArray1 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray2 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray3 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray4 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray5 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray6 = [[NSMutableArray alloc]initWithCapacity:7];
                //            NSMutableArray *rowArray7 = [[NSMutableArray alloc]initWithCapacity:7];
                //            [rowArray1 addObject:@"日"];
                //            [rowArray1 addObject:@"一"];
                //            [rowArray1 addObject:@"二"];
                //            [rowArray1 addObject:@"三"];
                //            [rowArray1 addObject:@"四"];
                //            [rowArray1 addObject:@"五"];
                //            [rowArray1 addObject:@"六"];
                //            NSInteger count1, count2, count3, count4, count5, count6;
                //            int number = 1;
                //
                //            count1 = count2 = count3 = count4 = count5 = count6 = 7;
                //            count1 = count1 - weekday + 2;
                //            while(weekday > 0){
                //                [rowArray2 addObject:@" "];
                //                weekday--;
                //            }
                //            while(count1 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                //char *charNumber = [stringNumber cStringUsingEncoding:NSASCIIStringEncoding];
                //                [rowArray2 addObject:stringNumber];
                //                number++;
                //                count1--;
                //                maxDays--;
                //            }
                //            while(count2 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                [rowArray3 addObject:stringNumber];
                //                number++;
                //                count2--;
                //                maxDays--;
                //            }
                //            while(count3 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                [rowArray4 addObject:stringNumber];
                //                number++;
                //                count3--;
                //                maxDays--;
                //            }
                //            while(count4 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                [rowArray5 addObject:stringNumber];
                //                number++;
                //                count4--;
                //                maxDays--;
                //            }
                //            while(count5 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                [rowArray6 addObject:stringNumber];
                //                number++;
                //                count5--;
                //                maxDays--;
                //            }
                //            while(count6 > 0 && maxDays > 0){
                //                NSString *stringNumber = [NSString stringWithFormat:@"%d", number];
                //                [rowArray7 addObject:stringNumber];
                //                number++;
                //                count6--;
                //                maxDays--;
                //            }
                //            NSString *strArray1 = [rowArray1 componentsJoinedByString:@" "];
                //            const char *cstrArray1 =[strArray1 UTF8String];
                //            NSString *strArray2 = [rowArray2 componentsJoinedByString:@" "];
                //            const char *cstrArray2 =[strArray2 UTF8String];
                //            NSString *strArray3 = [rowArray3 componentsJoinedByString:@"  "];
                //            const char *cstrArray3 =[strArray3 UTF8String];
                //            NSString *strArray4 = [rowArray4 componentsJoinedByString:@" "];
                //            const char *cstrArray4 =[strArray4 UTF8String];
                //            NSString *strArray5 = [rowArray5 componentsJoinedByString:@" "];
                //            const char *cstrArray5 =[strArray5 UTF8String];
                //            NSString *strArray6 = [rowArray6 componentsJoinedByString:@" "];
                //            const char *cstrArray6 =[strArray6 UTF8String];
                //            NSString *strArray7 = [rowArray7 componentsJoinedByString:@" "];
                //            const char *cstrArray7 =[strArray7 UTF8String];
                //            
                //            printf("    %s月  %ld\n", cMonth, (long)compsYear);
                //            //printf("一 二 三 四 五 六 日\n");
                //            printf("%s\n", cstrArray1);
                //            printf("%s\n", cstrArray2);
                //            printf("%s\n", cstrArray3);
                //            printf("%s\n", cstrArray4);
                //            printf("%s\n", cstrArray5);
                //            printf("%s\n", cstrArray6);
                //            printf("%s\n", cstrArray7);
                //本年
                //comps = [calendar components:(NSCalendarUnitYear) fromDate:date];
                //NSInteger year = [comps year];
                //NSLog(@"%ld", (long)year);
                
                //本月
                //comps = [calendar components:(NSCalendarUnitMonth) fromDate:date];
                //NSInteger month = [comps month];
                //NSLog(@"%ld", (long)month);
                
                
            }else{
                //printf("%s: command not found\n",  insert);
                return 0;
            }
            printf("please insert cal's command: ");
            fgets(insert, sizeof(insert), stdin);
            NSString *end = [NSString stringWithUTF8String:insert];
        }
    }
    return 0;
}


