//
//  main.m
//  mycal
//
//  Created by 陈受恩 on 15/11/4.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>


void printMonthCalender(NSInteger year,NSInteger month){
    char* monthName[12]={"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    
    //已知年份和月份，重设该月第一天，判断其是周几
    //声明时间组件，结合calendar
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSDateComponents *day1=[[NSDateComponents alloc]init];
    [day1 setYear:year];
    [day1 setMonth:month];
    [day1 setDay:1];
    NSDate *date1=[calendar dateFromComponents:day1];
    
    //计算重组时间后的日期月份的天数
    NSRange range=[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date1];
    NSUInteger monthCount=range.length;
   
    //确定每月第一周有几天，再计算每月第一周第一天在周几
    int firstWeekDayCount=0;
    
    for (int i=1; i<=7; i++) {
        
        NSDateComponents *day=[[NSDateComponents alloc]init];
        [day setYear:year];
        [day setMonth:month];
        [day setDay:i];
        NSDate *date=[calendar dateFromComponents:day];
        
        NSDateComponents *nowCalendar=[calendar components:NSCalendarUnitWeekOfMonth fromDate:date];
        //确定每月第一周有几天
        NSInteger week=[nowCalendar weekOfMonth];
        if (week==1) {
            firstWeekDayCount++;
        }
    }
    
    //假设第一周有3天，则第一天在7-3=4 第四个日子，下标为[7-firstweekDayCount-1],现在可以打印了
    int firstDayFlag=7-firstWeekDayCount;
    printf("    %s   %li\n",monthName[month-1],(long)year);
    printf("日 一 二 三 四 五 六\n");
    //打印第一天之前的空格
    int flag=0;
    for(int i=0; i<firstDayFlag;i++){
        printf("   ");
        flag=firstDayFlag;
    }
    
    for(int i=1; i<=monthCount;i++){
        if(i<10){
            printf(" ");
            printf("%d",i);
            printf(" ");
            flag++;
        }else{
            printf("%d",i);
            printf(" ");
            flag++;
        }
        if(flag%7==0){
            printf("\n");
            flag=0;
        }
  }
  printf("\n");

}
// 现在打印一季度的月历
void printQuarterCalender(int year,int month1,int month2,int month3){
    
    //现在我要知道 每个月的第一天在周几，确定后续的打印空格
    NSCalendar *calendar=[NSCalendar currentCalendar];
    //自己设置日期
    NSDateComponents *day1=[[NSDateComponents alloc]init];
    [day1 setYear:year];
    [day1 setMonth:month1];
    [day1 setDay:1];
    NSDate *date1=[calendar dateFromComponents:day1];
    
    NSDateComponents *day2=[[NSDateComponents alloc]init];
    [day2 setYear:year];
    [day2 setMonth:month2];
    [day2 setDay:1];
    NSDate *date2=[calendar dateFromComponents:day2];
    
    NSDateComponents *day3=[[NSDateComponents alloc]init];
    [day3 setYear:year];
    [day3 setMonth:month3];
    [day3 setDay:1];
    NSDate *date3=[calendar dateFromComponents:day3];
    
    //计算重组时间后的日期 月份的天数
    NSRange range1=[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date1];
    //int monthCount1=range1.length;
    NSRange range2=[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date2];
    //int monthCount2=range2.length;
    NSRange range3=[calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date3];
    //int monthCount3=range3.length;
    
    //确定每月第一周有几天，再计算每月第一周第一天在周几
    int firstWeekDayCount1=0;
    for (int i=1; i<=7; i++) {
        NSDateComponents *day=[[NSDateComponents alloc]init];
        [day setYear:year];
        [day setMonth:month1];
        [day setDay:i];
        NSDate *date=[calendar dateFromComponents:day];
        
        NSDateComponents *nowCalendar=[calendar components:NSCalendarUnitWeekOfMonth fromDate:date];
        //确定每月第一周有几天
        NSInteger week=[nowCalendar weekOfMonth];
        if (week==1) {
            firstWeekDayCount1++;
        }
    }
    //假设第一周有3天，则第一天在7-3=4 第四个日子，下标为[7-firstweekDayCount-1],现在可以打印了
    //int firstDayFlag1=7-firstWeekDayCount;
    
    int firstWeekDayCount2=0;
    for (int i=1; i<=7; i++) {
        NSDateComponents *day=[[NSDateComponents alloc]init];
        [day setYear:year];
        [day setMonth:month2];
        [day setDay:i];
        NSDate *date=[calendar dateFromComponents:day];
        
        NSDateComponents *nowCalendar=[calendar components:NSCalendarUnitWeekOfMonth fromDate:date];
        //确定每月第一周有几天
        NSInteger week=[nowCalendar weekOfMonth];
        if (week==1) {
            firstWeekDayCount2++;
        }
    }
    //假设第一周有3天，则第一天在7-3=4 第四个日子，下标为[7-firstweekDayCount-1],现在可以打印了
//    int firstDayFlag2=7-firstWeekDayCount;
    
    int firstWeekDayCount3=0;
    for (int i=1; i<=7; i++) {
        NSDateComponents *day=[[NSDateComponents alloc]init];
        [day setYear:year];
        [day setMonth:month3];
        [day setDay:i];
        NSDate *date=[calendar dateFromComponents:day];
        
        NSDateComponents *nowCalendar=[calendar components:NSCalendarUnitWeekOfMonth fromDate:date];
        //确定每月第一周有几天
        NSInteger week=[nowCalendar weekOfMonth];
        if (week==1) {
            firstWeekDayCount3++;
        }
    }
    //假设第一周有3天，则第一天在7-3=4 第四个日子，下标为[7-firstweekDayCount-1],现在可以打印了,
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    //每月第一行要打印的空格单位
    int firstDayFlag1=7-firstWeekDayCount1;
    int firstDayFlag2=7-firstWeekDayCount2;
    int firstDayFlag3=7-firstWeekDayCount3;
    //每月的天数
    NSInteger monthCount1=range1.length;
    NSInteger monthCount2=range2.length;
    NSInteger monthCount3=range3.length;
    
    char* monthName[12]={"一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"};
    
    printf("       %s                    %s                  %s\n",monthName[month1-1],monthName[month2-1],monthName[month3-1]);
    printf("日 一 二 三 四 五 六    日 一 二 三 四 五 六   日 一 二 三 四 五 六\n");
    
    //使用5个str字符串，按月遍历，动态增加字符,分别代表第一周～第六周
     NSMutableString *str1=[[NSMutableString alloc]init];
     NSMutableString *str2=[[NSMutableString alloc]init];
     NSMutableString *str3=[[NSMutableString alloc]init];
     NSMutableString *str4=[[NSMutableString alloc]init];
     NSMutableString *str5=[[NSMutableString alloc]init];
     NSMutableString *str6=[[NSMutableString alloc]init];
    
    
  /////////////////////////////////////////////////////////////////////////////////////////
    int flag=0;
    for(int i=1;i<=monthCount1;i++){
        //打印第一周 第一天之前的空格
        if (i==1) {
           for(int j=0; j<firstDayFlag1;j++){
            [str1 appendFormat:@"   "];
             flag=firstDayFlag1;
           }
        }
        if(flag<7)
        {
            
         if(i<10){
            [str1 appendFormat:@" "];
             //数字变str
             NSString *format=[NSString stringWithFormat:@"%d",i];
            //[str1 appendFormat:[NSString stringWithFormat:@"%i",i]];
             [str1 appendString:format];
             [str1 appendFormat:@" "];
              }
        else{
            //[str1 appendFormat:[NSString stringWithFormat:@"%i",i]];
            [str1 appendString:[NSString stringWithFormat:@"%i",i]];
            [str1 appendFormat:@" "];
            }
       }
        //第二周
        if(flag>=7&&flag<14){
            //NSLog(@"flag is %i",flag);
            if(i<10){
                [str2 appendFormat:@" "];
                //数字变str
                [str2 appendString:[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
              }
            else{
                [str2 appendString :[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
            }
            
        }
        //第三周
        if(flag>=14&&flag<21){
           // NSLog(@"flag is %i",flag);
            if(i<10){
                [str3 appendFormat:@" "];
                //数字变str
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
            }
            else{
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
            }
            
        }
        //第四周
        if(flag>=21&&flag<28){
            //NSLog(@"flag is %i",flag);
            if(i<10){
                [str4 appendFormat:@" "];
                //数字变str
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
            }
            else{
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
            }
            
        }
        //第五周会出现日期排满空格的问题
        if(flag>=28&&flag<35){
            //NSLog(@"flag is %i",flag);
            [str5 appendString :[NSString stringWithFormat:@"%i",i]];
            [str5 appendFormat:@" "];
        }
        //第六周会出现日期排满空格的问题
        if(flag>=35&&flag<42){
            //NSLog(@"flag is %i",flag);
            [str6 appendString :[NSString stringWithFormat:@"%i",i]];
            [str6 appendFormat:@" "];
        }
        flag++;
   }
   //NSLog(@"flag is %i",flag);
    while(flag<35){
        [str5 appendFormat:@"   "];
        flag++;
    }
    while (flag>=35&&flag<42) {
        [str6 appendFormat:@"   "];
        flag++;
    }
/////////////////////////////////////////////////////////////////////////////////////////
    flag=0;
    for(int i=1;i<=monthCount2;i++){
        
        //打印第一周 第一天之前的空格
        if (i==1) {
            [str1 appendFormat:@"   "];//间隔空
            for(int j=0; j<firstDayFlag2;j++){
                [str1 appendFormat:@"   "];
                flag=firstDayFlag2;
            }
        }
        if(flag<7){
        if(i<10){
            [str1 appendFormat:@" "];
            //数字变str
            [str1 appendString :[NSString stringWithFormat:@"%i",i]];
            [str1 appendFormat:@" "];
                    }
        else{
            [str1 appendString :[NSString stringWithFormat:@"%i",i]];
            [str1 appendFormat:@" "];
                  }
        }
        //第二周
        if(flag>=7&&flag<14){
            if (flag==7) {
                [str2 appendFormat:@"   "];//间隔空
            }
            if(i<10){
                [str2 appendFormat:@" "];
                //数字变str
                [str2 appendString :[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
                           }
            else{
                [str2 appendString :[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
            }
        }
        //第三周
        if(flag>=14&&flag<21){
            if (flag==14) {
                [str3 appendFormat:@"   "];//间隔空
            }
            if(i<10){
                [str3 appendFormat:@" "];
                //数字变str
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
                         }
            else{
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
           }
            
        }
        //第四周
        if(flag>=21&&flag<28){
            if (flag==21) {
                [str4 appendFormat:@"   "];//间隔空
            }
            if(i<10){
                [str4 appendFormat:@" "];
                //数字变str
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
            }
            else{
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
            }
            
        }
        //第五周会出现日期排满空格的问题
        if(flag>=28&&flag<35){
            if (flag==28) {
                [str5 appendFormat:@"   "];//间隔空
            }
            [str5 appendString :[NSString stringWithFormat:@"%i",i]];
            [str5 appendFormat:@" "];
        }
        //第六周会出现日期排满空格的问题
        if(flag>=35&&flag<42){
            //NSLog(@"flag is %i",flag);
            if (flag==35) {
                [str6 appendFormat:@"   "];//间隔空
            }
            [str6 appendString :[NSString stringWithFormat:@"%i",i]];
            [str6 appendFormat:@" "];
        }
        flag++;
    }
    //NSLog(@"flag is %i",flag);
     while(flag<35){
        if(flag==28)
        [str5 appendFormat:@"   "];//间隔空
        [str5 appendFormat:@"   "];
        flag++;
    }
    while (flag>=35&&flag<42) {
        if(flag==35)
            [str6 appendFormat:@"   "];//间隔空
        [str6 appendFormat:@"   "];
        flag++;
    }

    
    //NSLog(@"%i",flag);
   
 /////////////////////////////////////////////////////////////////////////////////////////
    flag=0;
    for(int i=1;i<=monthCount3;i++){
        
        //打印第一周 第一天之前的空格
        if (i==1) {
            [str1 appendFormat:@"  "];//间隔空
            for(int j=0; j<firstDayFlag3;j++){
                [str1 appendFormat:@"   "];
                flag=firstDayFlag3;
            }
        }
        if(flag<7){
            if(i<10){
                [str1 appendFormat:@" "];
                //数字变str
                [str1 appendString :[NSString stringWithFormat:@"%i",i]];
                [str1 appendFormat:@" "];
            
            }
            else{
                [str1 appendString :[NSString stringWithFormat:@"%i",i]];
                [str1 appendFormat:@" "];
                
            }
        }

        //第二周
        if(flag>=7&&flag<14){
            if (flag==7) {
                [str2 appendFormat:@"  "];//间隔空
            }
            if(i<10){
                [str2 appendFormat:@" "];
                //数字变str
                [str2 appendString :[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
               
            }
            else{
                [str2 appendString :[NSString stringWithFormat:@"%i",i]];
                [str2 appendFormat:@" "];
               
            }
            
        }
        //第三周
        if(flag>=14&&flag<21){
            if (flag==14) {
                [str3 appendFormat:@"  "];//间隔空
            }
            if(i<10){
                [str3 appendFormat:@" "];
                //数字变str
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
               
            }
            else{
                [str3 appendString :[NSString stringWithFormat:@"%i",i]];
                [str3 appendFormat:@" "];
               
            }
            
        }
        //第四周
        if(flag>=21&&flag<28){
            if (flag==21) {
                [str4 appendFormat:@"  "];//间隔空
            }
            if(i<10){
                [str4 appendFormat:@" "];
                //数字变str
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
               
            }
            else{
                [str4 appendString :[NSString stringWithFormat:@"%i",i]];
                [str4 appendFormat:@" "];
               
            }
            
        }
        //第五周会出现日期排满空格的问题
        if(flag>=28&&flag<35){
            if (flag==28) {
                [str5 appendFormat:@"  "];//间隔空
            }
            [str5 appendString :[NSString stringWithFormat:@"%i",i]];
            [str5 appendFormat:@" "];
            
        }
         //第六周会出现日期排满空格的问题
        if(flag>=35&&flag<42){
            //NSLog(@"flag is %i",flag);
            if (flag==35) {
                [str6 appendFormat:@"  "];//间隔空
            }
            [str6 appendString :[NSString stringWithFormat:@"%i",i]];
            [str6 appendFormat:@" "];
        }
        flag++;
    }
    
    //NSLog(@"flag is %i",flag);
    while(flag<35){
        if(flag==28)
            [str5 appendFormat:@"  "];//间隔空
        [str5 appendFormat:@"   "];
        flag++;
    }
    while (flag>=35&&flag<42) {
        if(flag==35)
            [str6 appendFormat:@"  "];//间隔空
        [str6 appendFormat:@"   "];
        flag++;
    }

   
////////////////////////////////////////////////////////
    const char *pConstChar1= [str1 UTF8String];
    printf("%s\n", pConstChar1 );
    const char *pConstChar2= [str2 UTF8String];
    printf("%s\n", pConstChar2 );
    const char *pConstChar3= [str3 UTF8String];
    printf("%s\n", pConstChar3 );
    const char *pConstChar4= [str4 UTF8String];
    printf("%s\n", pConstChar4 );
    const char *pConstChar5= [str5 UTF8String];
    printf("%s\n", pConstChar5 );
    const char *pConstChar6= [str6 UTF8String];
    printf("%s\n", pConstChar6 );
   
    
}
void printYear(int year){
    
    printQuarterCalender(year,1,2,3);
    printQuarterCalender(year,4,5,6);
    printQuarterCalender(year,7,8,9);
    printQuarterCalender(year,10,11,12);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //针对输出月历的情况，其实是一样的，就是知道年份和月份，可以是获取当前的，也可是命令行输入的，有了年份和月份后，我就需要知道该月第一天在周几，再根据这个月的总天数依次打印，而这些都可以用函数获得。 就是自己设定，重组日期，不过显示的日期是世界标准时，也就是我设的是2015-11-1，打印是2015-11-1减去时区差8小时，2015-10-31，不过这里不要紧，因为日历是取自系统的历法，所以计算月长时可以得到正确的答案。
        
        //拆分目前的calendar成datecomponents 获得当前的日历的年份和月份
       
        NSDate *now=[NSDate date];
        NSCalendar *calendar=[NSCalendar currentCalendar];
        NSDateComponents *nowCalendar=[calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:now];
        NSInteger year=[nowCalendar year];
        NSInteger month=[nowCalendar month];
        //printYear(2015);
//       printf("You can input like these: ./Mycal or ./Mycal -m month or ./Mycal year or ./Mycal month year\n");
        
        //下面使用命令行传参
        //将char * argv[]对象转化为NSString对象
        NSMutableArray *arrayString=[NSMutableArray arrayWithCapacity:argc];
        for (int i=0; i<argc; i++) {
            NSString *str=[NSString stringWithUTF8String:argv[i]];
            [arrayString addObject:str];
        }
        //从参数个数入手
        if (arrayString.count==1) {
            NSString *s1=arrayString[0];
            if ([s1 isEqualToString:@"./Mycal"]) {
                printMonthCalender(year, month);
            }
            else{
                printf("Your input is error!\n");
                printf("You can input like these: ./Mycal or ./Mycal -m month or ./Mycal year or ./Mycal month year\n");
            }
            
        }
        if(arrayString.count==2){
            NSString *s1=arrayString[0];
            NSString *s2=arrayString[1];
            if ([s1 isEqualToString:@"./Mycal"]) {
                 if ([s2 characterAtIndex:0]>='0' && [s2 characterAtIndex:0]<='9'){
                     if ([s2 intValue]>=1 && [s2 intValue]<=9999) {
                         printf("                              %li\n\n",(long)[s2 intValue])
                                                                        ;
                         printYear([s2 intValue]);}else{
                         printf("Mycal: year %s not in range 1..9999\n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);}
                }else{
                        printf("Mycal:%s year is illegal input \n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);}
            }else{
                printf("Your input is error!\n");
                printf("You can input like these: ./Mycal or ./Mycal -m month or ./Mycal year or ./Mycal month year\n");}
            }
        
        if(arrayString.count==3){
            NSString *s1=arrayString[0];
            NSString *s2=arrayString[1];
            NSString *s3=arrayString[2];
            if ([s1 isEqualToString:@"./Mycal"]) {
                if ([s2 characterAtIndex:0]>='0' && [s2 characterAtIndex:0]<='9') {
                    if ([s3 characterAtIndex:0]>='0' && [s3 characterAtIndex:0]<='9'){
                       if ([s2 intValue]>=1 && [s2 intValue]<=12) {
                            if ([s3 intValue]>=1 && [s3 intValue]<=9999) {
                                                printMonthCalender([s3 intValue],[s2 intValue]);
                                            }else{
                                                printf("Mycal: year %s not in range 1..9999\n",[s3 cStringUsingEncoding:NSUTF8StringEncoding]);}
                                        }else{
                                            printf("Mycal:%s is neither a month number (1..12) nor a name\n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);}
                                    }else{
                                        printf("Mycal:%s year is illegal input \n",[s3 cStringUsingEncoding:NSUTF8StringEncoding]);}
                                }else if([s2 characterAtIndex:0]=='-'){
                                    if ([s2 isEqualToString:@"-m"]) {
                                        if([s3 intValue]>=1 && [s3 intValue]<=12){
                                            printMonthCalender(year, [s3 intValue]);
                                        }else{
                                            printf("Mycal: %d is neither a month number (1..12) nor a name\n",[s3 intValue]);
                                        }
                                    }
                                }else{
                                    printf("Mycal:%s is neither a month number (1..12) nor a name\n",[s2 cStringUsingEncoding:NSUTF8StringEncoding]);
                                }
                            }
            else{
                printf("Your input is error!\n");
                printf("You can input like these: ./Mycal or ./Mycal -m month or ./Mycal year or ./Mycal month year\n");}
            }
        }
    return 0;
}

