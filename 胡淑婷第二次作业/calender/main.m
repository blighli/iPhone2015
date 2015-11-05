//
//  main.m
//  hushuting
//
//  Created by HacAdmin on 15/10/17.
//  Copyright (c) 2015ƒÍ HacAdmin. All rights reserved.
//

#import <Foundation/Foundation.h>


//判断是否是闰年
BOOL isLeapYear(int year)
{
    BOOL flag;
    if ((year%4==0&&year%100!=0)||(year%100==0&&year%400==0)) {
        flag=true;
    }
    else{
        flag=false;
    }
    return flag;
}
//返回每个月的天数
int month_Count(int year,int month)
{
    int count=0;
    if (month==2) {
        if (isLeapYear(year)) {
            count=29;
        }
        else
            count=28;
    }
    else{
        switch (month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                count=31;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                count=30;
                break;
        }
    }
    return count;
}
//输出函数
void printCalender(int year,int month,int weekDay,int mCount)
{
    int temp=1;
    //输出年份和月份
    printf("%10d%5d\n",month,year);
    //输出星期
    printf("%3s%3s%3s%3s%3s%3s%3s\n","Su","Mo","Tu","We","Th","Fr","Sa");
    for (int i=0; i<7&&temp<=mCount; i++) {
        if (temp==1&&i<weekDay) {
            printf("%3s"," ");
        }
        else{
            printf("%3d",temp++);
        }
        if (i==6) {
            printf("\n");
            i=-1;
        }
    }
    printf("\n");
}
//获得日历对象
int getCanlenderComp(int year,int month)
{
    NSCalendar *calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *tempComp=[[NSDateComponents alloc]init];
    tempComp.year=year;
    tempComp.month=month;
    tempComp.day=1;
    NSDate *date=[calendar dateFromComponents:tempComp];
    tempComp=[calendar components:NSCalendarUnitWeekday fromDate:date];
    return (int)tempComp.weekday;
}
//输出一年的月历
void printMonth(int year)
{
    int day_temp[12];
    for (int i=0; i<12; i++) {
        day_temp[i]=1;
    }
    for (int i=0; i<4; i++) {
        for (int j=0; j<3; j++) {//输出头部信息：年、月
            printf("%10d%5d",3*i+j+1,year);
            printf("%10s"," ");
        }
        printf("\n");
        //输出星期
        for (int j=0; j<3; j++) {
            printf("%3s%3s%3s%3s%3s%3s%3s","Su","Mo","Tu","We","Th","Fr","Sa");
            printf("%4s"," ");
        }
        printf("\n");
        for (int k=0; k<6; k++) {
            for (int j=0; j<3; j++) {
                int days=month_Count(year, 3*i+j+1);//该月的天数
                int weekDay=getCanlenderComp(year, 3*i+j+1);//该月的第一天对应的星期几
                if (k==0) {//如果是第一行，则输出weekDay个空格
                    for (int t=0; t<weekDay-1; t++) {
                        printf("%3s"," ");
                    }
                }
                int day=day_temp[3*i+j];
                for (int r=day; r<42; r++) {
                    if (day<=days) {
                        printf("%3d",day);
                    }else{
                        printf("%3s"," ");
                    }
                    day_temp[3*i+j]++;
                    day++;
                    if ((day+weekDay-2)%7==0) {
                        printf("%4s"," ");
                        break;
                    }
                }
            }
            printf("\n");
        }
    }
}

/**run:
  * ./hushuting
 */
int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSString *string=[NSString stringWithFormat:@"%s",argv[1]];
        //如果第一个字符串不是cal则提示错误
        if (strcmp(argv[1], "cal")!=0||argc>5) {
            printf("错误命令！\n");
        }
        else{
            if(argc==2)
            {//cal
                
                NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
                //获得当前日期
                NSDate *dt=[NSDate date];
                unsigned unitFlags=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
                //获取各时间字段的信息
                NSDateComponents *tempComp=[calender components:unitFlags fromDate:dt];
                int tempY=(int)tempComp.year;//年份
                int tempM=(int)tempComp.month;//月份
                int weekDay=getCanlenderComp(tempY, tempM);
                int mCount=month_Count(tempComp.year,tempComp.month);//取得当前月的天数
                printCalender(tempY,tempM,weekDay-1, mCount);
            }
            if (argc==3) {//cal month
                NSString *stringY=[NSString stringWithFormat:@"%s",argv[2]];
                int year=[stringY intValue];
                if (year>0&&year<9999) {
                    printMonth(year);
                }else{
                    printf("请输入正确的年份！\n");
                }
            }
            if (argc==4) {
                if (strcmp(argv[2],"-m")==0) {//cal -m month
                    NSString *string=[NSString stringWithFormat:@"%s",argv[3]];
                    int month=[string intValue];
                    if (month>0&&month<13) {
                        NSCalendar *calender=[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
                        NSDate *dt=[NSDate date];
                        NSDateComponents *tempComp=[calender components:NSCalendarUnitYear fromDate:dt];
                        int tempY=(int)tempComp.year;//年份
                        int weekDay=getCanlenderComp(tempY, month);
                        int mCount=month_Count(tempComp.year,month);//取得当前月的天数
                        printCalender(tempY,month,weekDay-1, mCount);
                    }else{
                        printf("请输入正确的月份！\n");
                    }
                    
                }
                else{//cal month year
                    NSString *stringM=[NSString stringWithFormat:@"%s",argv[2]];
                    NSString *stringY=[NSString stringWithFormat:@"%s",argv[3]];
                    int month=[stringM intValue];
                    int year=[stringY intValue];
                    if (month>0&&month<13&&year>0&&year<9999) {
                        int weekDay=getCanlenderComp(year, month);
                        int mCount=month_Count(year,month);//取得当前月的天数
                        printCalender(year,month,weekDay-1, mCount);
                    }else{
                        printf("请输入正确的月份/年份！\n");
                    }
                    
                    
                }
                
            }

        }
        
    }
    return 0;
}