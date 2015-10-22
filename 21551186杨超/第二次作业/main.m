//
//  main.m
//  MyCal
//
//  Created by YC－MacBookPro on 15/10/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

void ComputeYear(long col, long year,char flag)
{
    long yearInfo[13][4] = {0};
    yearInfo[0][3] = 1;
    for (int i=1; i<=12; i++) {
        NSDateComponents *d = [[NSDateComponents alloc] init];
        [d setYear:year];
        [d setDay:1];
        [d setMonth:i];
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *date = [cal dateFromComponents:d];
        int unitFlag = NSCalendarUnitWeekday;
        d = [cal components:unitFlag fromDate:date];
        NSRange range = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
        yearInfo[i][1] = [d weekday];//1 表示周几
        yearInfo[i][2] = range.length;//2 表示当月天数
        yearInfo[i][3] = yearInfo[i-1][2] + yearInfo[i-1][3];
    }
    
    //------------输出----------
    char *Month[12] = {"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    
    //输出‘年’
    if (flag == 'j') {
        for (int i=1; i<col/2.0*28; i++) {
            printf("%c",' ');
        }
    }else{
        for (int i=1; i<col/2.0*21; i++) {
            printf("%c",' ');
        }
    }
    printf("%lu",year);
    printf("\n");
    printf("\n");
    
    //每行输出col个,一共有row行
    long row = ceil(12.0/col);
    //第iRow行
    long iRow = 1;
    //下面代码可以实现输出单独一个月份的功能,col = 1
    if (flag == 'm') {
        row = col;
        iRow = row;
        col = 1;
    }
    //-----------
    
    //下面代码可以实现输出 -j 功能,col = 1
    if (flag == 'j') {
        col = 2;
        row = ceil(12.0/col);
    }
    //-----------
    
    for (; iRow<=row; iRow++) {
        //输出每行的各个月份
        for (int m=1; m<=col; m++) {
            if(((m-1)+col*(iRow-1)+1)<=10){
                flag == 'j'?printf("%12c",' '):printf("%8c",' ');
                printf("%s",Month[(m-1)+col*(iRow-1)]);
                flag == 'j'?printf("%13c",' '):printf("%10c",' ');
            }else if(((m-1)+col*(iRow-1)+1)<=12){
                flag == 'j'?printf("%11c",' '):printf("%7c",' ');
                printf("%s",Month[(m-1)+col*(iRow-1)]);
                flag == 'j'?printf("%12c",' '):printf("%9c",' ');
            }
            //8 12
        }
        printf("\n");
        
        //输出每行每个月份对应的“星期”
        for (int m=1; m<=col; m++) {
            if(((m-1)+col*(iRow-1)+1)<=12){
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
        
        //一共42个位置，有数字的用数字填充没有数字的用空格填充
        //记录每月已经输出的天数
        long sum[13];
        for (int i=1; i<=12; i++) {
            sum[i] = 1;
        }
        
        if (flag == 'j') {
            for (int i=1; i<=12; i++) {
                sum[i] = yearInfo[i][3];
            }
        }
        
        //得到每一行第一个月t
        long t = (iRow-1)*col+1;//t012
        
        //每一个iRow需要打印6行，用n记录
        int n = 1;
        for (; n<=6;) {
            //打印每月第一天前面的空格
            if (n == 1) {
                int s;
                flag == 'j'?(s = 4):(s = 3);
                for (int j=0; j<(yearInfo[t][1]-1)*s; j++) {
                    printf(" ");
                }
            }//if
            
            long k;
            if (t<=iRow*col && t<=12) {
                flag == 'j'?(k = yearInfo[t][2] + yearInfo[t][3]-1):(k = yearInfo[t][2]);
                
                for (; sum[t]<=k; ) {//+yearInfo[t][3]-1
                    
                    if(flag == 'j'){
                        printf("%3lu",sum[t]);sum[t]++;//输出一个数，位数不足用空格填充
                    }else{
                        printf("%2lu",sum[t]);sum[t]++;//输出一个数，位数不足用空格填充
                    }
                    
                    if (yearInfo[t][1]%7!=0) {
                        printf("%c",' ');
                        yearInfo[t][1]++;
                    //yearInfo[t][1] = yearInfo[t][1]%7;
                    }else
                    {
                        yearInfo[t][1] = 1;
                        t++;
                        flag == 'j'?(k = yearInfo[t][2] + yearInfo[t][3]-1):(k = yearInfo[t][2]);
                        printf("%2c",' ');
                        if (t==(col*iRow+1) || t == 13) {
                            t=(iRow-1)*col+1;
                            n++;
                            printf("\n");
                        }
                        break;
                    }
                }//for sum
            }
            
            if (sum[t] > k && n<=6)
            {
                for (; yearInfo[t][1]<=7; ) {
                    //printf("%4c",' ');
                    
                    flag == 'j'?printf("%4c",' '):printf("%3c",' ');
                    
                    yearInfo[t][1]++;
                }
                printf("%c",' ');
                yearInfo[t][1] = 1;
                t++;
                flag == 'j'?(k = yearInfo[t][2] + yearInfo[t][3]-1):(k = yearInfo[t][2]);
                if (t==(col*iRow+1) || t == 13) {
                    t = col*(iRow-1)+1;
                    n++;
                    printf("\n");
                }
            }
        }//n
    }//end of iRow
}


void ComputeMonth(long month,long year)
{
    //得到当前所在年、月
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
    
    //打印月日历
    void printCal(long month,long year,long dayCount,long firstWeekday);
    printCal(month1, year1, range.length,weekday1);
    printf("\n");
}

void printCal(long month,long year,long dayCount,long firstWeekday)//一个月一共有多少天，第一天是周几
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
                    ComputeYear(3, year,'y');
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
                        ComputeYear(3, year,'y');
                    }
                    //输出在全年所在位置
                    if ([s1 isEqualToString:@"-j"]) {
                        //ComputeMonth(month,year);
                        ComputeYear(month, year,'j');
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
                        ComputeYear(2, [s2 intValue],'j');
                    }else{
                        printf("cal: year %d not in range 1..9999\n",[s2 intValue]);
                    }
                }
                if ([s1 isEqualToString:@"-y"]) {
                    if([s2 intValue]>=1 && [s2 intValue]<=9999){
                        ComputeYear(3, [s2 intValue], 'y');
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
