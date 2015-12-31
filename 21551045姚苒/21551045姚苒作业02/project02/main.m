//
//  main.m
//  project02
//
//  Created by yaoran on 15/10/20.
//  Copyright © 2015年 yaoran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

void Calendar(long num, long year,char flag)
{
    long Number[13][4] = {0};
    Number[0][3] = 1;
    for (int i=1; i<=12; i++) {
        NSDateComponents *p = [[NSDateComponents alloc] init];
        [p setYear:year];
        [p setDay:1];
        [p setMonth:i];
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *date = [cal dateFromComponents:p];
        int unitFlag = NSCalendarUnitWeekday;
        p = [cal components:unitFlag fromDate:date];
        NSRange range = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        Number[i][1] = [p weekday];//1 表示周几
        Number[i][2] = range.length;//2 表示当月天数
        Number[i][3] = Number[i-1][2] + Number[i-1][3];//3表示至今总天数
    }
    
    char *Month[12] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
    if (flag == 'j') {
        for (int i=1; i<num/2.0*28; i++) {
            printf("%c",' ');
        }
    }else{
        for (int i=1; i<num/2.0*21; i++) {
            printf("%c",' ');
        }
    }
    printf("%lu",year);
    printf("\n");
    printf("\n");
    long row;
    if(12%num==0){
        row=12/num;}
    else{
        row=12/num+1;
    }
    long iRow = 1;
    if (flag == 'm') {//只输出一个月
        row = num;
        iRow = row;
        num = 1;
    }
    if (flag == 'j') {//-j
        num = 2;
        if(12%num==0){
            row=12/num;}
        else{
            row=12/num+1;
        }
    }
    /*
     输出各月份
     */
    for (; iRow<=row; iRow++) {
        for (int m=1; m<=num; m++) {
            if(((m-1)+num*(iRow-1)+1)<=10){
                if(flag == 'j'){
                    printf("%12c",' ');
                }
                else{
                    printf("%8c",' ');;
                }
                printf("%s",Month[(m-1)+num*(iRow-1)]);
                if(flag == 'j'){
                    printf("%13c",' ');
                }
                else{
                    printf("%10c",' ');
                }
            }else if(((m-1)+num*(iRow-1)+1)<=12){
                if(flag == 'j'){
                    printf("%11c",' ');
                }
                else{
                    printf("%7c",' ');;
                }

                printf("%s",Month[(m-1)+num*(iRow-1)]);
                if(flag == 'j'){
                    printf("%12c",' ');
                }
                else{
                    printf("%9c",' ');;
                }

            }
        }
        printf("\n");
        
        for (int m=1; m<=num; m++) {
            if(m+num*(iRow-1)<=12){
                if (flag=='j') {
                    printf(" 日  一  二  三  四  五  六");
                    printf("%2c",' ');
                }else{
                    printf("日 一 二 三 四 五 六");
                    printf("%2c",' ');
                }
            }
        }
        printf("\n");
        
        long sum[13];
        for (int i=1; i<=12; i++) {
            sum[i] = 1;
        }
        
        if (flag == 'j') {
            for (int i=1; i<=12; i++) {
                sum[i] = Number[i][3];
            }
        }
        
        long t = (iRow-1)*num+1;
        int n = 1;
        for (n=1; n<=6;) {
            if (n == 1) {
                int s;
                if(flag == 'j'){
                    s = 4;
                }
                else{
                    s = 3;
                }
                for (int j=0; j<(Number[t][1]-1)*s; j++) {
                    printf(" ");
                }
            }
            
            long k;
            if (t<=iRow*num && t<=12) {
                flag == 'j'?(k = Number[t][2] + Number[t][3]-1):(k = Number[t][2]);
                
                for (; sum[t]<=k; ) {//+yearInfo[t][3]-1
                    
                    if(flag == 'j'){
                        printf("%3lu",sum[t]);sum[t]++;
                    }else{
                        printf("%2lu",sum[t]);sum[t]++;
                    }
                    switch(Number[t][1]%7){
                        case 0:{
                            Number[t][1] = 1;
                            t++;
                            flag == 'j'?(k = Number[t][2] + Number[t][3]-1):(k = Number[t][2]);
                            printf("%2c",' ');
                            if (t==(num*iRow+1) || t == 13) {
                                t=(iRow-1)*num+1;
                                n++;
                                printf("\n");
                                break;
                        }
                        default:{
                            printf("%c",' ');
                            Number[t][1]++;
                            //yearInfo[t][1] = yearInfo[t][1]%7;
                            break;

                        }
                    }
                                   }
            }
            
            if (sum[t] > k && n<=6)
            {
                for (; Number[t][1]<=7; Number[t][1]++) {
                    //printf("%4c",' ');
                    
                    switch(flag){
                        case 'j':{
                            printf("%4c",' ');
                            break;
                        }
                        default:{
                            printf("%3c",' ');
                            break;
                        }
                    }
                    
                    
                }
                printf("%c",' ');
                Number[t][1] = 1;
                t++;
                if(flag == 'j'){
                    k = Number[t][2] + Number[t][3]-1;
                }else
                {
                    k = Number[t][2];
                }
                if (t==(num*iRow+1) || t == 13) {
                    t = num*(iRow-1)+1;
                    n++;
                    printf("\n");
                }
            }
        }//n
    }//end of iRow
}
}

void ComputeMonth(long month,long year)
{
    //    NSDate *nowDate = [NSDate date];
    //    NSLog(@"%@",nowDate);
    NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    //    NSDateComponents *d = [cal components:unitFlags fromDate:nowDate];
    //    long year = [d year];
    //    long month = [d month];
    
    //得到当前年、月第一天是星期几
    NSDateComponents *d1 = [[NSDateComponents alloc] init];
    [d1 setYear:year];
    [d1 setMonth:month];
    [d1 setDay:1];
    NSDate *date = [cal dateFromComponents:d1];
    NSDateComponents *d2 = [cal components:unitFlags fromDate:date];
    
    //long dayCount = [cal ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    NSRange range = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    long year1 = [d2 year];
    long month1 = [d2 month];
    //long day1 = [d2 day];
    long weekday1 = [d2 weekday];
    //NSLog(@"%lu %lu %lu %lu %lu %lu",year1,month1,day1,weekday1,dayCount,range.length);
    
    void printCal(long month,long year,long dayCount,long firstWeekday);
    printCal(month1, year1, range.length,weekday1);
    printf("\n");
}

void printCal(long month,long year,long dayCount,long firstWeekday)
{
    char *Month[12] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    
    printf("     %s %lu     \n",Month[month-1],year);
    printf("日 一 二 三 四 五 六\n");
    for (int j=0; j<(firstWeekday-1)*3; j++) {
        printf(" ");
    }
    for (int i = 1; i<=dayCount; i++) {
        printf("%2d",i);
        if (firstWeekday!=0) {
            printf(" ");
        }else
            printf("\n");
        firstWeekday++;
        firstWeekday = firstWeekday%7;
    }
}

//char *getSubStr(int)

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate *nowdate = [NSDate date];
        //int unitFlag = NSCalendarUnitYear;
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *dc = [cal components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:nowdate];
        long year = [dc year];
        long month = [dc month];
        
        
        NSMutableArray *arrStr = [NSMutableArray array];
        for (int i = 1; i<argc; i++) {
            NSString *s = [NSString stringWithCString:argv[i] encoding:NSUTF8StringEncoding];
            [arrStr addObject:s];
        }
        
        //一个参数
        if (arrStr.count == 1) {
            if (![arrStr[0] isEqualToString:@"cal"]) {
                printf("%s: command not found\n",[arrStr[0] UTF8String]);
                return 0;
            }
            if ([arrStr[0] isEqualToString:@"cal"]) {
                ComputeMonth(month, year);
                return 0;
            }
        }
        
        //两个参数
        if (arrStr.count == 2) {
            
            if (![arrStr[0] isEqualToString:@"cal"]) {
                printf("%s: command not found\n",[arrStr[0] UTF8String]);
                return 0;
            }
            
            NSString *s1 = arrStr[1];
            if([s1 characterAtIndex:0]>='0' && [s1 characterAtIndex:0]<='9')
            {
                int year = [s1 intValue];
                if (year >=1 && year <=9999) {
                    Calendar(3, year,'y');
                }else{
                    printf("cal: year %d not in range 1..9999\n",year);
                }
            }else if ([s1 characterAtIndex:0] == '-')
            {
                if (s1.length == 1) {
                    printf("cal: year 0 not in range 1..9999\n");
                }else{
                    //判断两个参数 第二个参数为 -?形式
                    if ([s1 isEqualToString:@"-y"]) {
                        Calendar(3, year,'y');
                    }
                    //输出在全年所在位置
                    if ([s1 isEqualToString:@"-j"]) {
                        //ComputeMonth(month,year);
                        Calendar(month, year,'j');
                    }
                    
                    if ([s1 isEqualToString:@"-m"]) {
                        printf("cal: option requires an argument -- m\n");
                    }
                    
                }
            }else{
                printf("cal: year 0 not in range 1..9999\n");
            }
        }//两个参数
        
        //三个参数
        if (arrStr.count == 3) {
            NSString *s1 = arrStr[1];
            NSString *s2 = arrStr[2];
            //            if([s1 characterAtIndex:0]>='0' && [s1 characterAtIndex:0]<='9' && [s2 characterAtIndex:0]>='0' && [s2 characterAtIndex:0]<='9' && [s1 intValue] >=1 && [s1 intValue] <=12 && [s2 intValue] >=1 && [s2 intValue]<=9999)
            //            {
            //                ComputeMonth([s1 intValue], [s2 intValue]);
            //            }
            
            if ([s1 characterAtIndex:0]>='0' && [s1 characterAtIndex:0]<='9') {
                if ([s2 characterAtIndex:0]>='0' && [s2 characterAtIndex:0]<='9')
                {
                    if ([s1 intValue]>=1 && [s1 intValue]<=12) {
                        if ([s2 intValue]>=1 && [s2 intValue]<=9999) {
                            ComputeMonth([s1 intValue], [s2 intValue]);
                        }else{
                            printf("cal: year %s not in range 1..9999\n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);
                        }
                    }else
                    {
                        printf("cal:%s is neither a month number (1..12) nor a name\n",[s1 cStringUsingEncoding:NSUTF8StringEncoding]);
                    }
                }else{
                    printf("cal: year 0 not in range 1..9999\n");
                }
            }else if([s1 characterAtIndex:0]=='-'){
                if ([s1 isEqualToString:@"-m"]) {
                    if([s2 intValue]>=1 && [s2 intValue]<=12){
                        ComputeMonth([s2 intValue], year);
                    }else{
                        printf("cal: %d is neither a month number (1..12) nor a name\n",[s2 intValue]);
                    }
                }
                if ([s1 isEqualToString:@"-j"]) {
                    if([s2 intValue]>=1 && [s2 intValue]<=9999){
                        Calendar(2, [s2 intValue],'j');
                    }else{
                        printf("cal: year %d not in range 1..9999\n",[s2 intValue]);
                    }
                }
                if ([s1 isEqualToString:@"-y"]) {
                    if([s2 intValue]>=1 && [s2 intValue]<=9999){
                        Calendar(3, [s2 intValue], 'y');
                    }else{
                        printf("cal: year %d not in range 1..9999\n",[s2 intValue]);
                    }
                }
            }else{//if s1 == '-'
                {
                    printf("cal:%s is neither a month number (1..12) nor a name\n",[s1 cStringUsingEncoding:NSUTF8StringEncoding]);
                }
            }
        }
        
    }
    return 0;
}
