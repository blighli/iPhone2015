//
//  main.m
//  Cy calend
//
//  Created by zhengxiang on 15/10/18.
//  Copyright © 2015年 Big Nerd Banch. All rights reserved.
//

#include "String.h"
#import <Foundation/Foundation.h>
enum month{jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec};
bool isleapyear(NSUInteger year)
{
    if(year%4==0&&year%400!=0)
        return true;
    else return false;
}
bool ismonth(NSUInteger month)
{
    if(month<8&&month%2!=0)
        return true;
    if(month>=8&&month%2==0)
        return true;
    else return false;
}
void showcalendar(NSUInteger year,NSUInteger month,NSUInteger day)
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *date = [NSDate date];
    NSDateComponents *d = [NSDateComponents new];
    d.year=year;
    d.month=month;
    d.day=1;
    date = [cal dateFromComponents:d];
    unsigned int unitFlags = NSCalendarUnitWeekday;
    NSDateComponents *t = [cal components:unitFlags fromDate:date];
    NSUInteger Firstday=[t weekday];
    NSUInteger a[31];
    NSUInteger i,j,sum=0;
    if(month==2)
    {
        if(isleapyear(year))
            for ( i=0;i<=28 ;i++) {
                a[i]=i+1;
            }
        else
        {for(i=0;i<28;i++)
            a[i]=i+1;
        }
    }
    else if(ismonth(month))
    {
        for( i=0;i<=30;i++)
            a[i]=i+1;
        
    }
    else
    {
        for(i=0;i<30;i++)
            a[i]=i+1;
    }
    printf("SUN MON TUE WED THU FRI SAT\n");
    for(j=1;j<Firstday;j++)
        printf("%4c",' ');
    for(j=0;j<=7-Firstday;j++)
        printf("%2lu%2c",a[j],' ');
    printf("\n");
    for (j=7; j<i; j++)
    {
        if(sum==7)
        {
            printf("\n");
            sum=0;
        }
        sum++;
        printf("%2lu%2c",a[j],' ');
    }
    
        
    printf("\n");
    
    
}
void showall(NSUInteger year,NSUInteger month,NSUInteger day)
{
    printf("%30c%lu\n",' ',year);
    printf("\n");
    NSUInteger a[100][100];
    NSUInteger First[13];
    int i,j,k,totaldays[13];
    for(i=1;i<=12;i++)
    {
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDate *date = [[NSDate alloc] init];
        NSDateComponents *d = [[NSDateComponents alloc] init];
        d.year=year;
        d.month=i;
        d.day=1;
        date = [cal dateFromComponents:d];
        unsigned int unitFlags = NSCalendarUnitWeekday;
        d = [cal components:unitFlags fromDate:date];
        First[i]=[d weekday];
    }
    for(j=1;j<=12;j++)
    {
            if(j==2)
            {
                if(isleapyear(year))
                {for ( k=0;k<=28 ;i++)
                        a[j][k]=k+1;
                        totaldays[j]=29;
                }
                else
                {for(k=0;k<28;k++)
                    a[j][k]=k+1;
                    totaldays[j]=28;
                }
            }
            else if(ismonth(month))
            {
                for( k=0;k<=30;k++)
                    a[j][k]=k+1;
                totaldays[j]=31;
            }
            else
            {
                for(k=0;k<30;k++)
                    a[j][k]=k+1;
                totaldays[j]=30;
            }
    }
    for(int l=0;l<4;l++)
    {
        printf("%12c%d月%29c%d月%27c%d月\n",' ',3*l+1,' ',3*l+2,' ',3*l+3);
        for(int m=0;m<3;m++)
            printf("SUN MON TUE WED THU FRI SAT    ");
        printf("\n");
        for(int m=0;m<6;m++)
        {
            if(m==0)
            {
                for (i=1; i<First[3*l+1]; i++)
                    printf("%4c",' ');
                for(i=0;i<8-First[3*l+1];i++)
                    printf("%2lu  ",a[l+1][i]);
                printf("%3c",' ');
                for (i=1; i<First[3*l+2]; i++)
                    printf("%4c",' ');
                for(i=0;i<8-First[3*l+2];i++)
                    printf("%2lu  ",a[3*l+2][i]);
                printf("%3c",' ');
                for (i=1; i<First[3*l+3]; i++)
                    printf("%4c",' ');
                for(i=0;i<8-First[3*l+3];i++)
                    printf("%2lu  ",a[3*l+3][i]);
                printf("\n");
            }
            else if(m>=1&&m<=3)
            {
                for(i=0;i<7;i++)
                    printf("%2lu  ",a[3*l+1][(7*(m-1)+8-First[3*l+1]+i)]);
                printf("%3c",' ');
                for(i=0;i<7;i++)
                    printf("%2lu  ",a[3*l+2][(7*(m-1)+8-First[3*l+2]+i)]);
                printf("%3c",' ');
                for(i=0;i<7;i++)
                    printf("%2lu  ",a[3*l+3][(7*(m-1)+8-First[3*l+3]+i)]);
                printf("\n");
                
            }
        else if (m==4)
        {  //加入一个判断，末尾是结束还是补空格；
            if(29-First[3*l+1]==totaldays[3*l+1])
                printf("%28c",' ');
            if(29-First[3*l+1]<totaldays[3*l+1])
            {
                if(36-First[3*l+1]>totaldays[3*l+1])
                {
                for(NSUInteger d=29-First[3*l+1];d<totaldays[3*l+1];d++)
                        printf("%2lu  ",a[3*l+1][d]);
                    for(NSUInteger d=0;d<36-totaldays[3*l+1]-First[3*l+1];d++)
                        printf("%4c",' ');
                }
                else for(NSUInteger d=29-First[3*l+1];d<36-First[3*l+1];d++)
                    printf("%2lu  ",a[3*l+1][d]);
                
            }
            printf("%3c",' ');
        if(29-First[3*l+2]==totaldays[3*l+2])
            printf("%28c",' ');
        if(29-First[3*l+2]<totaldays[3*l+2])
        {
            if(36-First[3*l+2]>totaldays[3*l+2])
            {
            for(NSUInteger d=29-First[3*l+2];d<totaldays[3*l+2];d++)
                printf("%2lu  ",a[3*l+2][d]);
            for(NSUInteger d=0;d<36-totaldays[3*l+2]-First[3*l+2];d++)
                printf("%4c",' ');}
            else for(NSUInteger d=29-First[3*l+2];d<36-First[3*l+2];d++)
                printf("%2lu  ",a[3*l+2][d]);
            
        }
        printf("%3c",' ');
        if(29-First[3*l+3]==totaldays[3*l+3])
            printf("%28c",' ');
        if(29-First[3*l+3]<totaldays[3*l+3])
        {
            if(36-First[3*l+3]>totaldays[3*l+3])
            {
            for(NSUInteger d=29-First[3*l+3];d<totaldays[3*l+3];d++)
                printf("%2lu  ",a[3*l+3][d]);
            for(NSUInteger d=0;d<36-totaldays[3*l+3]-First[3*l+3];d++)
                printf("%4c",' ');}
            else for(NSUInteger d=29-First[3*l+3];d<36-First[3*l+3];d++)
                printf("%2lu  ",a[3*l+3][d]);
            
        }
        printf("\n");
    }
            if(m==5)
            {
                if(36-First[3*l+1]>totaldays[3*l+1])
                    printf("%28c",' ');
                else for(NSUInteger d=36-First[3*l+1];d<totaldays[3*l+1];d++)
                    printf("%2lu  ",a[3*l+1][d]);
                printf("%3c",' ');
                if(36-First[3*l+2]>totaldays[3*l+2])
                    printf("%28c",' ');
                else for(NSUInteger d=36-First[3*l+2];d<totaldays[3*l+2];d++)
                    printf("%2lu  ",a[3*l+2][d]);
                printf("%3c",' ');
                if(36-First[3*l+3]>totaldays[3*l+3])
                    printf("%28c",' ');
                else for(NSUInteger d=36-First[3*l+3];d<totaldays[3*l+3];d++)
                    printf("%2lu  ",a[3*l+3][d]);
                printf("\n");
                
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDate *date = [NSDate date];  //Nsdate的数据类型，存放获取的年月日
        unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
        //所需获取时间的具体信息，NSCalendarUnitHour 获取xiaos
        NSDateComponents *d = [cal components:unitFlags fromDate:date];
        //将date的数据交付给NSDateComponents类型的d
        NSInteger year = [d year];
        NSInteger month = [d month];
        NSInteger day  =  [d day];
        for (int i = 0; i < argc; i++)
            printf("%s ", argv[i]);
            printf("\n");
        if(!strcmp(argv[0],"./Cycalendar"))
        {
        if (argc==1)
        {
            showcalendar(year,month,day);
        }
        else if (argc==2)
        {
            if(atoi(argv[1])>9999||atoi(argv[1])<1)
               printf("year %s not in range 1..9999",argv[1]);
            else {
                year=atoi(argv[1]);
                showall(year, month, day);
            }
        }
        else if(argc==3)
        {
            if(!strcmp(argv[1],"-m"))
            {
                if((atoi(argv[2])>=1)&&(atoi(argv[2])<=12))
            {
                month=atoi(argv[2]);
                showcalendar(year,month,day);
            }
            else printf("%s is neither a month number(1..12)nor a name\n",argv[2]);
            }
            
            else if(atoi(argv[1])>=1&&atoi(argv[1])<=12)
            {
                if(atoi(argv[2])>=1&&atoi(argv[2])<=9999)
                {    year=atoi(argv[2]);
                    month=atoi(argv[1]);
                showcalendar(year, month, day);
                }
                else printf("year %s is not range 1..9999\n",argv[2]);
            }
            else if(atoi(argv[1])<1||atoi(argv[1])>12)
                printf("%s is neither a month number(1..12)nor a name\n",argv[1]);
          
            
        }
        }
        else printf("-bath :%s command not found\n",argv[0]);
        
        
    }
    return 0;
}
