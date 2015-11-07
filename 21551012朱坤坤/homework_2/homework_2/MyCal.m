//
//  MyCal.m
//  homework_2
//
//  Created by zhukun on 15/10/25.
//  Copyright (c) 2015年 zhukun. All rights reserved.
//

#import "MyCal.h"

@implementation MyCal

-(void) setMonthAndYearWithToday{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:[NSDate date]];
    int month1 = [components month];
    int year1 = [components year];
    self->year =  year1;
    self->month = month1;
}


+(int) getWeekdayOfMonthBeginWithMonth:(int) month AndYear:(int) year{
    NSUInteger unitFlags = NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay | NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal;
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *firstDayComponents = [[NSDateComponents alloc]init ];
    [firstDayComponents setYear:year];
    [firstDayComponents setMonth:month];
    [firstDayComponents setDay:1];
    NSDate *firstDateofMonth = [calendar dateFromComponents:firstDayComponents];
    NSDateComponents *weekComponents = [calendar components:NSCalendarUnitWeekday fromDate: firstDateofMonth];
    int weekdayofMonthBegin = [weekComponents weekday];
    return weekdayofMonthBegin;
}

+(int) getDaysInMonthWithMonth:(int)month AndYear:(int)year{
    if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
        return 31;
    else if(month==4||month==6||month==9||month==11)
        return 30;
    else if((year%4==0&&year%100!=0)||(year%400==0)) //闰年
        return 29;
    return 28;
            
}


+(void) printfMonthNameWithMonth:(int) month AndYear:(int)year{
   
    printf("%7d月 %-9d\n",month,year);
}

-(void) printfSingleMonthWithOutParams{
    [self setMonthAndYearWithToday];
    [MyCal printfSingleMonthDataWithMonth:self->month AndYear:self->year];
}

-(void) printfSingleMonthDataWithMonth:(int)month{
    [self setMonthAndYearWithToday];
    [MyCal printfSingleMonthDataWithMonth:month AndYear:self->year];
}

+(void) printfSingleMonthDataWithMonth:(int)month AndYear:(int)year {
    
    int weekdayofMonthBegin = [MyCal getWeekdayOfMonthBeginWithMonth:month AndYear:year];
    int daysInMonth = [MyCal getDaysInMonthWithMonth:month AndYear:year];
    [MyCal printfMonthNameWithMonth:month AndYear:year];
    printf("日 一 二 三 四 五 六\n");
    for(int i=0;i< weekdayofMonthBegin-1;i++){
        printf("   ");
    }
    
    int tmpWeek = weekdayofMonthBegin;
    
    for(int i =1; i<=daysInMonth ;i++){
        if(tmpWeek != 7) printf("%2d ",i);
        else printf("%2d\n",i);
        tmpWeek++;
        if(tmpWeek>7){
            tmpWeek = tmpWeek%7 ;
        }
    }
    printf("\n");

    
}
+ (void) printfDataWithYear:(int)year{
    
    int season = 0;
    int weekdayofMonthBegin[13]; //存放每月月初为周几
    int tmpWeek[13]; //存放正在打印的这天为周几
    int daysInMonth[13]; //一个月一共几天
    int tmpDay[13];  //已经打印到这个月的第几天了
    Boolean isFirst[13]; //是否为该月第一周
    Boolean isEnd[13]; //这个月的日期是否都打印完了。
    for(int i =1 ;i<=12;i++){
        weekdayofMonthBegin[i] = [MyCal getWeekdayOfMonthBeginWithMonth:i AndYear:year];
        tmpWeek[i] = weekdayofMonthBegin[i];
        daysInMonth[i] =[MyCal getDaysInMonthWithMonth:i AndYear:year];
        tmpDay[i]=1;
        isFirst[i]=true;
        isEnd[i]=false;
    }
    printf("%33d\n\n",year);
    for(int s=0;s<=3;s++){ //s 为季度
        for(int i=-1;i<=6;i++){ //i为日期的行数，一个月最多6行 ,-1行打印月份，0行打印周
            for(int j=1;j<=3;j++){ // 某一季度中的第j月份
                int month = s*3 + j;
                if(i==6&&isEnd[s*3+1]&&isEnd[s*3+2]&&isEnd[s*3+3]){ //三个月都已结束时，第6行不再打印，否则会出现一整行空格的情况
                    break;
                }
                if(i==-1){
                    printf("%9d月%9s",month," ");
                    if(j==3) printf("\n");
                    else printf("  ");
                    continue;
                }
                if(i==0){
                    printf("日 一 二 三 四 五 六");
                    if(j!=3){
                        printf("  ");
                        
                    }else{
                        printf("\n");
                    }
                    continue;
                }
                while(tmpWeek[month]<=7){
                    if(i==1&&isFirst[month]){//第一行
                        for(int k=0;k< weekdayofMonthBegin[month]-1;k++){
                            printf("   ");
                        }
                        isFirst[month]=false;
                    }
                    if(tmpDay[month]<=daysInMonth[month]){
                        if(tmpWeek[month] < 7){
                            printf("%2d ",tmpDay[month]++);
                        }
                        else if(tmpWeek[month]==7){
                            printf("%2d",tmpDay[month]++);
                        }
                    }else{
                        if(tmpWeek[month] < 7){
                            printf("   ");
                            
                        }
                        else if(tmpWeek[month]==7){
                            printf("  ");
                        }
                        isEnd[month]= true;
                    }
                    tmpWeek[month]++;
                    
                }
                tmpWeek[month] = 1;
                if(j!=3) printf("  ");
                else printf("\n");
            }
        }
        printf("\n\n");
    }

}



@end
