//
//  main.m
//  calCommannd
//
//  Created by doubi on 15/10/20.
//  Copyright (c) 2015年 cstlab. All rights reserved.
//

#import <Foundation/Foundation.h>
#ifdef DEBUG
#define NSLog(FORMAT,...) fprintf(stderr,"%s",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(...)
#endif
long getDays(int month,int year){
    long days[] = {31,28,31,30,31,30,31,31,30,31,30,31};
    
    if ((year%400==0)||((year%4==0)&&(year%100!=0))){
        days[1]=29;
    }
    return days[month-1];
}

int transToInt(char *a){
    char tmp = a[0];
    int ans =0;
    if (tmp<'0' && tmp>'9'){
        return 0;
    }
    int i=1;
    ans += tmp-'0';
    tmp = a[i];
    while(tmp!='\0' && tmp !=' '){
//        printf("i:%d,",i);
//        printf("tmp:%d",tmp-'0');
//        printf("ans:%d\n",ans);
        if (tmp<'0' && tmp>'9'){
            return 0;
        }//if
        ans = ans*10+(tmp-'0');
        tmp = a[++i];
    }//while
    return ans;
}
void printBlank(int a){
    while(a--){
        printf(" ");
    }
}

int main(int argc, const char * argv[]) {
    char month[13][10]={"\0","January","February","March","April","May","June","July","August","September","Octover","Novemver","December"};
    @autoreleasepool {
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
        [dateComponents setDay:01];
        [dateComponents setMonth:10];
        [dateComponents setYear:2015];
        NSDate *date = [greCalendar dateFromComponents:dateComponents];
        NSDateComponents *today = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:date];
        int weekday;
        while(1){
            //获取输入
            int i =0;
            int days=0;
            char cmd[10],option1[10],option2[10],tmp;
            cmd[0]=option1[0]=option2[0]='\0';
            tmp=getchar();
            int flag1=0,flag2=0;
            while (tmp!= '\n'){
                if(tmp==' '){
                    tmp=getchar();
                    continue;
                }
                if(flag1==0){
                    cmd[i++]=tmp;
                    tmp=getchar();
                    if(tmp == ' '){
                        flag1=1;
                        i=0;
                    }
                    else if(tmp=='\n'){
                        cmd[i]='\0';
                        flag1=1;
                    }
                }
                else if(flag2==0){
                    option1[i++]=tmp;
                    tmp=getchar();
                    if(tmp == ' '){
                        flag2=1;
                        i=0;
                    }
                    else if(tmp=='\n'){
                        option1[i]='\0';
                        flag2=1;
                    }
                }
                else{
                    option2[i++]=tmp;
                    tmp=getchar();
                    if(tmp == ' '){
                        continue;
                    }
                    else if(tmp=='\n'){
                        option2[i]='\0';
                    }
                }
            }
            if(cmd[0]=='\0')continue;
            if(option1[0]=='\0'){
                [dateComponents setDay:01];
//                NSLog(@"weekday(星期):%i\n", today.weekday);
                printBlank((15-strlen(month[today.month]))/2);
                printf("%s %4li\n",month[today.month],today.year);
                printf("Su Mo Tu We Th Fr Sa\n");
                days = getDays(today.month, today.year);
                weekday=today.weekday-1;
                int full=0;
                for(i=1;i<=days;){
                    if(weekday-->0){
                        printf("   ");
                        full++;
                    }
                    else{
                        if(full!=0 && i!=1)printf(" ");
                        printf("%2d",i);
                        full++;
                        i++;
                    }
                    if(full==7 || i==days+1){
                        full=0;
                        printf("\n");
                    }//if
                }//for
            }//if
            int m=0,y=0;
            m=transToInt(option1);
            y=transToInt(option2);
            if(option2[0]=='\0' && option1[0]!='\0'){
                typedef struct{
                    int weekday;
                    int date;
                    int printTag;
                } dayinfo;//用于记录日历中每个位置的信息
                dayinfo calendarblank[12][43];
                if(!transToInt(option1)){
                    printf("usage: cal [-jy] [[month] year]\ncal [-j] [-m month] [year]\nncal [-Jjpwy] [-s country_code] [[month] year]\nncal [-Jeo] [year]");
                    continue;
                }
                else{
                    y=transToInt(option1);
                }
                NSDateComponents *Components = [[NSDateComponents alloc]init];
                [Components setDay:01];
                [Components setMonth:m];
                [Components setYear:y];
                NSDate *newdate = [greCalendar dateFromComponents:Components];
                NSDateComponents *day = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:newdate];
                for(int i =1;i<=12;i++){
                    int j=0;
                    [Components setMonth:i];
                    newdate = [greCalendar dateFromComponents:Components];
                    day = [greCalendar components:NSCalendarUnitWeekday fromDate:newdate];
                    int firstDaysWeek = day.weekday;
                    for (;j<firstDaysWeek-1;j++){
                        calendarblank[i-1][j].weekday=j%7+1;
                        calendarblank[i-1][j].date=0;
                        calendarblank[i-1][j].printTag=0;
                    }
                    for(;j<firstDaysWeek+getDays(i, y)-1;j++){
                        calendarblank[i-1][j].weekday=j%7+1;
                        calendarblank[i-1][j].date=j+2-firstDaysWeek;
                        calendarblank[i-1][j].printTag=0;
                    }
                    while(j<42){
                        calendarblank[i-1][j].weekday=j%7+1;
                        calendarblank[i-1][j].date=0;
                        calendarblank[i-1][j].printTag=0;
                        j++;
                    }
                }
//                for(int i=0;i<12;i++){
//                    printf("here is a new month\n");
//                    for(int k =0;k<42;k++){
//                        if (calendarblank[i][k].date==0){
//                            printf("   ");
////                            printf("  (weekday-%d)",calendarblank[i][k].weekday);
//                        }else{
//                            printf("%2d ",calendarblank[i][k].date);
////                            printf("(weekday-%d)",calendarblank[i][k].weekday);
//                        }
//                        if (calendarblank[i][k].weekday==7){
//                            printf("\n");
//                        }
//                    }
//                    printf("\n");
//                }
                printBlank(28);
                printf("%4d\n\n",y);
                int printweek=0;
                int blank1,blank2,blank3;
                int line=0;
                for(int i=1;i<=4;i++,line=0){
                    if(line==0){
                        blank1=(20-strlen(month[(i-1)*3+1]))/2;
                        blank2=(20-strlen(month[(i-1)*3+2]))/2;
                        blank3=(20-strlen(month[(i-1)*3+3]))/2;
                        printBlank(blank1);
                        printf("%s",month[(i-1)*3+1]);
                        printBlank(blank1+blank2+2);
                        printf("%s",month[(i-1)*3+2]);
                        printBlank(blank2+blank3+2);
                        printf("%s\n",month[(i-1)*3+3]);
                        for(int j=0;j<3;j++){
                            printf("Su Mo Tu We Th Fr Sa  ");
                        }
                        printf("\n");
                        line=1;
                    }
                    while(line<=6){
                        for(int j=0;j<3;j++){
                            int M=(i-1)*3+j;
                            int l=6;
                            for (int k=0;k<7;k++)
                            {
                            if (calendarblank[M][7*(line-1)+k].date==0){
                                printf("  ");
                                if (j==2&&k==6){//当前行结束
                                        printf("\n");
                                        line++;
                                    }
                                    else if(k ==6){
                                        printf("  ");//当前行当前月结束
                                    }
                                    else{
                                        printf(" ");//月份内每天之间空格
                                    }
                                }
                                else{
                                    printf("%2d",calendarblank[M][7*(line-1)+k].date);
                                    if (j==2&&k==6){//当前行结束
                                        printf("\n");
                                        line++;
                                    }
                                    else if(k ==6){//当前行当前月结束
                                        printf("  ");
                                    }
                                    else{//月份内每天之间空格
                                        printf(" ");
                                    }
                                }//else
                            }//if
                        }//for
                    }//while
                    printf("\n");
                    line++;
                }//for
            }
            if(option1[0]!='\0' && option2[0]!='\0'){
                if (!strcmp(option1,"-m")){
                    m=transToInt(option2);
                    if(m<1||m>12){
                        printf("%s is neither a month number (1..12) nor a name\n", option2);
                        continue;
                    }
                    y=2015;
                }
                NSDateComponents *Components = [[NSDateComponents alloc]init];
                [Components setDay:01];
                [Components setMonth:m];
                [Components setYear:y];
                NSDate *newdate = [greCalendar dateFromComponents:Components];
                NSDateComponents *day = [greCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfYear | NSCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:newdate];
                printBlank((15-strlen(month[day.month]))/2);
                printf("%s %4i\n",month[day.month], day.year);
                printf("Su Mo Tu We Th Fr Sa\n");
                days = getDays(day.month, day.year);
                weekday=day.weekday-1;
                int full=0;
                for(i=1;i<=days;){
                    if(weekday-->0){
                        printf("   ");
                        full++;
                    }
                    else{
                        if(full!=0 && i!=1)printf(" ");
                        printf("%2d",i);
                        full++;
                        i++;
                    }
                    if(full==7 || i == days+1){
                        full=0;
                        printf("\n");
                    }//if
                }//for

            }
        }
//        
//        NSLog(@"year(年份): %i", dateComponents.year);
//        NSLog(@"quarter(季度):%i", dateComponents.quarter);
//        NSLog(@"month(月份):%i", dateComponents.month);
//        NSLog(@"day(日期):%i", dateComponents.day);
//        NSLog(@"hour(小时):%i", dateComponents.hour);
//        NSLog(@"minute(分钟):%i", dateComponents.minute);
//        NSLog(@"second(秒):%i", dateComponents.second);//  Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Friday:5, Saturday:6
//        NSLog(@"weekday(星期):%i", dateComponents.weekday);
//        
//        //  苹果官方不推荐使用week
//        NSLog(@"week(该年第几周):%i", dateComponents.week);
//        NSLog(@"weekOfYear(该年第几周):%i", dateComponents.weekOfYear);
//        NSLog(@"weekOfMonth(该月第几周):%i", dateComponents.weekOfMonth);
    }
    return 0;
}
