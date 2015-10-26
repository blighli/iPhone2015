//
//  main.m
//  Work2
//
//  Created by yxq on 15/10/20.
//  Copyright © 2015年 yxq. All rights reserved.
//

#import <Foundation/Foundation.h>
int dayOfMonth(NSInteger month, NSInteger year){
    int days = 0;
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            days = 31;
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            days = 30;
            break;
        case 2:
            if (((year % 4 == 0) && !(year % 100 == 0)) || (year % 400 == 0))
                days = 29;
            else
                days = 28;
            break;
        default:
            break;
    }
    return days;
}

void printMonth(int weekDay, int daysOfMonth, NSInteger month, NSInteger year){
    char* monthName[12] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    if(month >10){
        printf("    %s %ld\n",monthName[month-1],year);
    }else{
        printf("     %s %ld\n",monthName[month-1],year);
    }
    printf("日 一 二 三 四 五 六\n");
    for(int i = 1; i < weekDay; i++){
        printf("   ");
    }
    int temp = 8 - weekDay;
    for(int i = 1; i <= daysOfMonth; i++){
        if(i < 10){
            printf(" ");
        }
        printf("%d ", i);
        if ((i%7 == temp && temp != 7)||(temp == 7 && i%7 == 0)) {
            printf("\n");
        }
    }
}

//print year
void printYear(NSDateComponents *one, NSDateComponents *two, NSDateComponents *three, NSInteger year, int num){
    char* firstLine[4]={"        一月                  二月                  三月","        四月                  五月                  六月","        七月                  八月                  九月","        十月                 十一月                十二月"};
    printf("%s\n",firstLine[num]);
    printf("日 一 二 三 四 五 六   日 一 二 三 四 五 六    日 一 二 三 四 五 六\n");
    int oneWeekDay = (int)[one weekday];
    int oneDays = dayOfMonth(3*num+1, year);
    int twoWeekDay = (int)[two weekday];
    int twoDays = dayOfMonth(3*num+2, year);
    int threeWeekDay = (int)[three weekday];
    int threeDays = dayOfMonth(3*num+3, year);
    int oneNow=1,twoNow=1,threeNow=1;
    BOOL flag1=false, flag2=false, flag3=false;
    int tempOne = 8 - oneWeekDay;
    int tempTwo = 8 - twoWeekDay;
    int tempThree = 8 - threeWeekDay;
    for(int m = 0; m < 6; m++){
        if(m == 0){
            for(int i = 1; i < oneWeekDay; i++){
                printf("   ");
            }
        }
        if(flag1)
        {
            printf("                     ");
        }
        while(oneNow <= oneDays){
            if(oneNow < 10){
                printf(" ");
            }
            printf("%d ", oneNow);
            oneNow ++;
            if(oneNow>oneDays)
            {
                int t1 = 7 - (oneWeekDay + oneDays - 1)%7;
                if(t1 != 7){
                    for(int i1=0; i1 <t1; i1++){
                        printf("   ");
                    }

                }
                flag1=true;
            }
            if (((oneNow-1)%7 == tempOne && tempOne != 7)||(tempOne == 7 && (oneNow-1)%7 == 0)) {
                break;
            }
        }
        
        if(m == 0){
            for(int j = 1; j < twoWeekDay; j++){
                printf("   ");
            }
        }
        if(flag2)
        {
            printf("                     ");
        }
        while(twoNow <= twoDays){
            if(twoNow < 10){
                printf(" ");
            }
            printf("%d ", twoNow);
            twoNow ++;
            if(twoNow>twoDays)
            {
                int t2 = 7 - (twoWeekDay + twoDays - 1)%7;
                if(t2 != 7){
                    for(int j1=0; j1 <t2; j1++){
                        printf("   ");
                    }
                }
                flag2=true;
            }
            if (((twoNow-1)%7 == tempTwo && tempTwo != 7)||(tempTwo == 7 && (twoNow-1)%7 == 0)) {
                break;
            }
        }
        
        if(m == 0){
            for(int k = 1; k < threeWeekDay; k++){
                printf("   ");
            }
        }
        if(flag3)
        {
            printf("                     ");
        }
        while(threeNow <= threeDays){
            if(threeNow < 10){
                printf(" ");
            }
            printf("%d ", threeNow);
            threeNow ++;
            if(threeNow>threeDays)
            {
                int t3 = 7 - (threeWeekDay + threeDays - 1)%7;
                for(int k1=0; k1 <t3; k1++){
                    printf("   ");
                }
                flag3=true;
            }
            if (((threeNow-1)%7 == tempThree && tempThree != 7)||(tempThree == 7 && (threeNow-1)%7 == 0)) {
                break;
            }
        }
        printf("\n");
    }
}

//cal
void firstSec(){
    NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [NSDate date];
    NSDateComponents *dateComponents = [g components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:date];
    int year = (int) [dateComponents year];
    int month = (int) [dateComponents month];
    int weekday = (int)[dateComponents weekday];
    int daysOfMonth = dayOfMonth(month, year);
    printMonth(weekday, daysOfMonth, month, year);
}

//cal -m month
void secondSec(const char* m, NSInteger y){
    NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSString *month = [NSString stringWithFormat:@"%s", m];
    [comps setYear:y];
    [comps setMonth:[month integerValue]];
    NSDate *date = [g dateFromComponents:comps];
    NSDateComponents *dateComponents = [g components:NSCalendarUnitWeekday fromDate:date];
    int weekday = (int)[dateComponents weekday];
    int daysOfMonth = dayOfMonth(atoi(m), y);
    printMonth(weekday, daysOfMonth, atoi(m), y);
}

//cal month year
void thirdSec(const char* m, const char* y){
    NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSString *month = [NSString stringWithFormat:@"%s", m];
    NSString *year = [NSString stringWithFormat:@"%s", y];
    [comps setYear:[year integerValue]];
    [comps setMonth:[month integerValue]];
    NSDate *date = [g dateFromComponents:comps];
    NSDateComponents *dateComponents = [g components:NSCalendarUnitWeekday fromDate:date];
    int weekday = (int)[dateComponents weekday];
    int daysOfMonth = dayOfMonth(atoi(m), atoi(y));
    printMonth(weekday, daysOfMonth, atoi(m), atoi(y));
}

//cal year
void yearSec(const char* y){
    for(int i = 0; i < 4; i++){
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSString *year = [NSString stringWithFormat:@"%s", y];
        
        NSDateComponents *comps1 = [[NSDateComponents alloc] init];
        NSString *month1 = [NSString stringWithFormat:@"%d", 3*i+1];
        [comps1 setYear:[year integerValue]];
        [comps1 setMonth:[month1 integerValue]];
        NSDate *date1 = [g dateFromComponents:comps1];
        NSDateComponents *one = [g components:NSCalendarUnitWeekday fromDate:date1];
        
        NSDateComponents *comps2 = [[NSDateComponents alloc] init];
        NSString *month2 = [NSString stringWithFormat:@"%d", 3*i+2];
        [comps2 setYear:[year integerValue]];
        [comps2 setMonth:[month2 integerValue]];
        NSDate *date2 = [g dateFromComponents:comps2];
        NSDateComponents *two = [g components:NSCalendarUnitWeekday fromDate:date2];
        
        NSDateComponents *comps3 = [[NSDateComponents alloc] init];
        NSString *month3 = [NSString stringWithFormat:@"%d", 3*i+3];
        [comps3 setYear:[year integerValue]];
        [comps3 setMonth:[month3 integerValue]];
        NSDate *date3 = [g dateFromComponents:comps3];
        NSDateComponents *three = [g components:NSCalendarUnitWeekday fromDate:date3];
        
        printYear(one, two, three, [year integerValue], i);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        switch (argc) {
            case 1:
                //cal
                firstSec();
                break;
            case 2:
                //cal year
                yearSec(argv[1]);
                break;
            case 3:
                if(strncmp(argv[1], "-m", 2) == 0){
                    //cal -m month
                    NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
                    NSDate *date = [NSDate date];
                    NSDateComponents *dateComponents = [g components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday fromDate:date];
                    NSInteger year = [dateComponents year];
                    secondSec(argv[2], year);
                }else{
                    //cal month year
                    thirdSec(argv[1], argv[2]);
                }
                break;
            default:
                break;
        }
    }
    return 0;
}