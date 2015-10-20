//
//  main.m
//  zuoye
//
//  Created by cdf on 15-10-20.
//  Copyright (c) 2015年 cdf. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
NSInteger getWeekFirstDay(NSInteger month, NSInteger year);
NSInteger getWeekLastDay(NSInteger month, NSInteger year);
NSInteger getMonthDay(NSInteger month, NSInteger year);
NSString *getLine();
NSArray *readLine(NSString *input);
NSInteger readWord(NSArray *arr);
void showByMonthAndYear(NSInteger month, NSInteger year);
void showByYear(NSInteger year);
NSInteger getYear();
NSInteger getMonth();

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        {
            int m,d,monthmax = 0,y;
            while(1)
            {
                scanf("%d %d",&m,&y);
                
                
                if(y%4==0||(y%100==0&&y%400==0))
                {
                    if(m==1||m==3||m==5||m==7||m==8||m==10||m==12)
                        monthmax=31;
                    if(m==2)
                        monthmax=29;
                    if(m==4||m==6||m==9||m==11)
                        monthmax=30;
                }
                if(y%4!=0)
                {
                    if(m==1||m==3||m==5||m==7||m==8||m==10||m==12)
                        monthmax=31;
                    if(m==2)
                        monthmax=28;
                    if(m==4||m==6||m==9||m==11)
                        monthmax=30;
                }
                
                if(m==1||m==2)
                {
                    m+=12;
                    y--;
                }
                d=(2+2*m+3*(m+1)/5+y+y/4-y/100+y/400)%7;
                if(d==0)
                {
                    d=7;
                }
                
                {
                    
                    for(int i=1; i<=d-1; i++)
                    {
                        printf("    ");
                        
                    }
                    for(int j=1; j<=monthmax; j++)
                    {
                        if(j<10)
                        {
                            
                            printf("%2d  ",j);
                            
                        }
                        if(j>=10)
                        {
                            printf("%2d  ",j);
                        }
                        if((j+d-1)%7==0)
                        {
                            printf("\n");
                        }
                        if(j==monthmax)
                        {
                            printf("\n");
                        }
                    }
                    printf("\n");
                }
               
                NSString *input = getLine();
                NSArray *arr = readLine(input);
                
                readWord(arr);
            }
        }
        
    }
    
    return 0;
}

NSInteger getWeekFirstDay(NSInteger month, NSInteger year){
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
  
    [comps setYear:year];
   
    [comps setMonth:month];
 
    [comps setDay:1];
   
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [calendar dateFromComponents:comps];
    comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    return weekday -1;
}

NSInteger getWeekLastDay(NSInteger month, NSInteger year){
 
    NSDateComponents *comps = [[NSDateComponents alloc] init];
   
    [comps setYear:year];
  
    [comps setMonth:month+1];
 
    [comps setDay:-1];
  
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [calendar dateFromComponents:comps];
    comps = [calendar components:(NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    return weekday;
}

NSInteger getMonthDay(NSInteger month, NSInteger year){
 
    NSInteger day = 21;
 
    NSInteger first = getWeekFirstDay(month, year);
 
    NSInteger last = getWeekLastDay(month, year);
 
    if(first == 0)
        first = 7;
    if(last == 0)
        last = 7;

    day += 7-first+1;
    day += last;

    if(day < 28)
        day += 7;
    
    return day;
}



NSString *getLine(){
    
    NSMutableString *input = [NSMutableString stringWithCapacity:0];
    
    
    NSInteger flag = 0;
    
  
    char ch = getchar();
    
 
    while(ch != '\n'){
        
       
        if(ch != ' '){
            flag = 1;
           
            NSString *sch = [NSString stringWithFormat:@"%c",ch];
          
            [input appendString:sch];
        }
    
        else if(flag == 1){
            flag = 0;
            [input appendString:@" "];
        }
        
        ch = getchar();
    };
    return input;
    
}


NSArray *readLine(NSString *input){

    input = [input lowercaseString];
   
    NSArray *arr = [input componentsSeparatedByString:@" "];
    return arr;
    
   }

NSInteger readWord(NSArray *arr){
   
    NSInteger count = [arr count];
    
    if(count < 1){
        printf("没有输入命令\n");
        return 0;
    }
    else if(count > 4){
        printf("输入的命令无法识别\n");
        return 0;
    }
    
    NSInteger month = 0;
    NSInteger year = 0;
   
    if([arr[0] isEqualToString:@"cal"]){
     
        if(count == 1){
           
            month = getMonth();
            year = getYear();
         
            showByMonthAndYear(month, year);
            return 0;
            
        }
      
        else if(count == 2){
            
            year = [arr[1] integerValue];
            if(year >= 1 && year <= 9999){
               
                showByYear( year);
                return 0;
            }else {
                printf("输入的年份超过限制\n");
                return 0;
            }
        }
       
        else if(count == 3){
            if([arr[1] isEqualToString:@"-m"]){
                year = getYear();
                
                month = [arr[2] integerValue];
            }else{
                month = [arr[1] integerValue];
                year = [arr[2] integerValue];
            }
            
           
            if(month >= 1 && month <= 12 && year >= 1 && year <= 9999){
             
                showByMonthAndYear(month, year);
                return 0;
            }else{
                printf("输入的年月错误\n");
                return 0;
            }
        }
    
        else{
            printf("无法识别命令\n");
            return 0;
        }
    }else{
        printf("输入的命令无法识别\n");
    }
    return 0;
}


NSInteger getYear(){
   
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
  
    unsigned int unitYear = NSCalendarUnitYear;
    NSDateComponents *y = [cal components:unitYear fromDate:date];
    NSInteger year = [y year];
    return year;
}

NSInteger getMonth(){
   
    NSDate *date = [NSDate date];
    NSCalendar *cal = [NSCalendar currentCalendar];
 
    unsigned int unitMonth = NSCalendarUnitMonth;
    NSDateComponents *m = [cal components:unitMonth fromDate:date];
    NSInteger month =  [m month];
    return month;
}


void showByMonthAndYear(NSInteger month, NSInteger year){
  
    NSInteger firstWeekDay = getWeekFirstDay(month, year);
  
    NSInteger dayOfMonth = getMonthDay(month, year);
   
    NSInteger week = 0;
    printf("        %ld月 %ld年\n", month, year);
    printf("日  一   二  三  四   五  六\n");
    for(int i = 0; i < firstWeekDay; i++){
        printf("    ");
        week++;
    }
    for(int day=1; day <= dayOfMonth; day++){
        printf("%2d", day);
        printf("  ");
        week++;
        if(week % 7 == 0){
            printf("\n");
            week = 0;
        }
    }
}



void showByYear(NSInteger year){
    int t;int i;
    int d[100][100];
 
    int a, j, k, w;

    int m[14] = { 0,31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  


    
    if(year%4==0 && year%100!=0 || year%400==0)
        m[2] = 29;
    w = (year+(year-1)/4-(year-1)/100+(year-1)/400)%7;
    for(i=1; i<=12; i++)
    {
        a = 1;
        for(j=1; j<=6; j++)
        {
            for(k=0; k<=6; k++)
            {
                while(k<w) k=k+1;
                d[i][j*10+k] = a;
                a=a+1;
                w = k+1;
                if(w==7) w=0;
                if(a>m[i]) break;
            }
            if(a>m[i]) break;
        }
    }
    
    
    for(k=1; k<=16*3-3; k++)
        printf(" ");
    
    printf("%ld\n", year);
    for(int n=1; n<=12/3; n++)
    {
        t = 3*(n-1)+1;
        printf("\n");
        for(int z=1; z<=3; z++)
        {
            for(int k=1; k<=15; k++)
                printf(" ");
            printf("%2d月", t+z-1);
            for(int k=1; k<=14; k++)
                printf(" ");
        }
        printf("\n");
        for(int z=1; z<=3; z++)
            printf("     日  一   二  三  四   五  六");
        for(int j=1; j<=6; j++)
        {
            printf("\n ");
            for(i=t; i<=t+3-1; i++)
            {
              printf("  ");
                for(int k=0; k<=6; k++)
                    
                    if(d[i][j*10+k]==0)
                  
                    printf("    ");
                  else
                       printf("%4d", d[i][j*10+k]);
           }
        
        }

    }

}

