//
//  main.m
//  intCompare
//
//  Created by paomer on 15/10/20.
//  Copyright (c) 2015年 zjumsexk. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
BOOL isLeapYear(int Year)
{
    if ((((Year % 4)==0) && ((Year % 100)!=0)) || ((Year % 400)==0)){
        return (YES);
    } else {
        return (NO);
    }
}

void printBlank(long blankCount)
{
    for(int i=0; i<blankCount; i++)
    {
        printf(" ");
    }
}


NSDateComponents *getNowDateComponents(){
    NSDate *dateNow = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *compNow = [cal components:unitFlags fromDate:dateNow];
    return compNow;
}


NSDateComponents *getFirstDayComponents(long year, long month){
    NSDateComponents *compTemp = [[NSDateComponents alloc]init];
    [compTemp setYear:year];
    [compTemp setMonth:month];
    [compTemp setDay:1];
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDate *firstDay = [cal dateFromComponents:compTemp];
    NSDateComponents *compRes = [cal components:unitFlags fromDate:firstDay];
    return compRes;
}
int main(int argc, const char * argv[]) {
    
    //日期的初始化
    int monthArray[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    NSString* m_n = @"一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月";
    NSString* w_n = @"日,一,二,三,四,五,六";
    NSArray* monthArray_n = [m_n componentsSeparatedByString:@","];
    NSArray* weekArray_n = [w_n componentsSeparatedByString:@","];
    
    if( argc==1 )
    {
        //获取当前日期
        NSDateComponents *compNow = getNowDateComponents();
        NSInteger yearNow  = [compNow year];
        NSInteger monNow   = [compNow month];

        //获取当前月份的第一天是一周的第几天
        NSDateComponents *compRes1 = getFirstDayComponents(yearNow,monNow);
        NSInteger week = [compRes1 weekday];
        
        //月份输出
        if(monNow>10)
        {
            printBlank(4);
        } else {
            printBlank(5);
        }
        NSLog(@"%@", monthArray_n[monNow-1]);
        
        //年份输出
        printBlank(1);
        NSLog(@"%ld\n",yearNow);
        
        //输出星期数组
        for(NSString* weekName in weekArray_n)
        {
            NSLog(@"%@ ",weekName);
        }
        NSLog(@"\n");
       
        //输出日历
        long blankCount = (week-1)*3;
        printBlank(blankCount);
        for(long i=1; i<monthArray[monNow-1]+1; i++){
            printf("%2ld ", i);
            blankCount+=3;
            if((blankCount/3)%7 == 0){
                printf("\n");
            }
        }
    }
    else if ( argc==2 )
    {
        int year;
        sscanf(argv[1], "%d", &year);
        if(year>9999 || year<1)
        {
            printf("当前年份输入有误［1～9999］");
        }
        else
        {
            printBlank(20);
            printf("%d\n\n", year);
            
            NSInteger yearNow = year;
            
            //获取当前月份的第一天是一周的第几天
            for (int monNow=1; monNow<13; monNow++)
            {
                NSDateComponents *compRes2 = getFirstDayComponents(yearNow,monNow);
                NSInteger week = [compRes2 weekday];
            
                //月份输出
                if(monNow>10)
                {
                    printBlank(7);
                } else {
                    printBlank(8);
                }
                NSLog(@"%@", monthArray_n[monNow-1]);
                printf("\n");
                //输出星期数组
                for(NSString* weekName in weekArray_n)
                {
                    NSLog(@"%@ ",weekName);
                }
                NSLog(@"\n");
                
                //输出日历
                BOOL leapYear = isLeapYear(year);
                if (leapYear == YES && monNow == 2) {
                    monthArray[1]++;
                }
                long blankCount = (week-1)*3;
                printBlank(blankCount);
                for(long i=1; i<monthArray[monNow-1]+1; i++){
                    printf("%2ld ", i);
                    blankCount+=3;
                    if((blankCount/3)%7 == 0){
                        printf("\n");
                    }
                }
            }
        }
    }
    else if ( argc==3 )
    {
       if(strcmp(argv[1], "-m")==0)
       {
           int month;
           sscanf(argv[2], "%d", &month);
           //printf("%d", month);
           if(month>12)
           {
               printf("当前输入月份有误［1～12］");
           }
           else
           {
               //获取当前日期
               NSDateComponents *compNow = getNowDateComponents();
               NSInteger yearNow  = [compNow year];
               NSInteger monNow   = month;
               
               //获取当前月份的第一天是一周的第几天
               NSDateComponents *compRes3 = getFirstDayComponents(yearNow,monNow);
               NSInteger week = [compRes3 weekday];
               
               //月份输出
               if(monNow>10)
               {
                   printBlank(4);
               } else {
                   printBlank(5);
               }
               NSLog(@"%@", monthArray_n[monNow-1]);
               
               //年份输出
               printBlank(1);
               NSLog(@"%ld\n",yearNow);
               
               //输出星期数组
               for(NSString* weekName in weekArray_n)
               {
                   NSLog(@"%@ ",weekName);
               }
               NSLog(@"\n");
               
               //输出日历
               long blankCount = (week-1)*3;
               printBlank(blankCount);
               for(long i=1; i<monthArray[monNow-1]+1; i++){
                   printf("%2ld ", i);
                   blankCount+=3;
                   if((blankCount/3)%7 == 0){
                       printf("\n");
                   }
               }
            }
        }
       else
       {
           int month;
           int year;
           sscanf(argv[1], "%d", &month);
           sscanf(argv[2], "%d", &year);
           
           if(month>12 || year>9999 || year<1)
           {
               printf("当前输入日期有误，月份：［1～12］，年份：［1～9999］");
           }
           else
           {

               NSInteger yearNow  = year;
               NSInteger monNow   = month;
               
               //获取当前月份的第一天是一周的第几天
               NSDateComponents *compRes3 = getFirstDayComponents(yearNow,monNow);
               NSInteger week = [compRes3 weekday];
               
               //月份输出
               if(monNow>10)
               {
                   printBlank(4);
               } else {
                   printBlank(5);
               }
               NSLog(@"%@", monthArray_n[monNow-1]);
               
               //年份输出
               printBlank(1);
               NSLog(@"%ld\n",yearNow);
               
               //输出星期数组
               for(NSString* weekName in weekArray_n)
               {
                   NSLog(@"%@ ",weekName);
               }
               NSLog(@"\n");
               
               //输出日历
               BOOL leapYear = isLeapYear(year);
               if (leapYear == YES && monNow == 2) {
                   monthArray[1]++;
               }
               long blankCount = (week-1)*3;
               printBlank(blankCount);
               for(long i=1; i<monthArray[monNow-1]+1; i++){
                   printf("%2ld ", i);
                   blankCount+=3;
                   if((blankCount/3)%7 == 0){
                       printf("\n");
                   }
               }
           }
       }
    }
    else
    {
        printf("参数个数输入有误\n");
    }
    return 0;
}
