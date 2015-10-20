//
//  main.m
//  HMWHomework2
//
//  Created by zhuzhu on 15/10/18.
//  Copyright © 2015年 wequeen. All rights reserved.
//
//其中变量 i 代表行数，j代表列数

#import <Foundation/Foundation.h>
char *arrMonth[] = {"一", "二", "三", "四", "五", "六", "七", "八",
    "九", "十", "十一", "十二"};
//一个用于存放整年日历的二维数组，并初始化为每个元素值0
int totalYear[24][21]={{0,0}};
//获取当前年
NSUInteger year() {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *myDate = [NSDate date];

    NSDateComponents *components = [gregorian components:NSCalendarUnitYear fromDate:myDate];
    //NSUInteger currentYear = [components year];
    return [components year];
}
//获取当前的月
NSUInteger month() {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *myDate = [NSDate date];

    NSDateComponents *components = [gregorian components:NSCalendarUnitMonth fromDate:myDate];
    return [components month];
}


//用于实现日历在数组中的存放与读取显示
//参数1是要输出日历信息的年份，参数2是要输出日历的月份，参数3表示要输出的月的个数，即要输出几个月的日历信息
void showCal(NSUInteger targetYear, NSUInteger targettMonth,int numberOfMonth)
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    [compt setYear:targetYear];
    [compt setMonth:targettMonth];
    [compt setDay:1];//设置日期为传入年月的1号
    //根据NSCalendar对象和NSDateComponents对象，创建NSDate对象
    NSDate *myDate = [calendar dateFromComponents:compt];
    
    NSUInteger Flag = (NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday);
    
    compt = [calendar components:Flag fromDate:myDate];
    //获取所设置日期是星期几
    NSUInteger week = [compt weekday];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:myDate];
    //获取对应年月的当月天数
    NSUInteger dayCount = range.length;
    //用韵存放一个月的日历信息
    int result[6][7];
    int index = 0;
    for (int i =0; i<6;i++) {
        for(int j =0;j<7;j++){
            if(i<1 && j<week-1){
                result[i][j]=0;
                index = result[i][j];
            }else if(i<1 && j==week-1){
                result[i][j] = 1;
                index = result[i][j];
            }else if(index<dayCount){
                result[i][j] = ++index;
            }else{
                result[i][j]=0;
            }
        }
    }
    //如果要输出的日历为一个月的信息，则直接输出
    if (numberOfMonth == 1) {
        for(int i =0; i<6;i++){
            for(int j = 0;j<7;j++){
                if(result[i][j] == 0){
                    printf("   ");
                }else if(result[i][j]<10){
                    printf(" %i ",result[i][j]);
                }else{
                    printf("%i ",result[i][j]);
                }
            }
            printf("\n");
        }

    }else if(numberOfMonth >1){
        //如果输出地日历信息大于一个月，在这里就是指一年则先存入totalYear;
        int myYIndex = (targettMonth-1)%3;
        int myXIndex = (targettMonth-1)/3;
        
        for(int i =0;i<6;i++){
            for(int j=0;j<7;j++){
                
                totalYear[myXIndex*6+i][myYIndex*7+j]=result[i][j];
            }
        }

    }
    //输出一年的日历信息
        if(targettMonth == 12 && numberOfMonth >1){
            for (int i=0;i<24;i++) {
                if( i%6 == 0){
                    for(int controlPrint = 0;controlPrint < 3;controlPrint++){
                        printf("     %s月 %04lu      ", arrMonth[controlPrint+(i/2)], targetYear);
                        printf("    ");
                        //printf(" 日 一 二 三 四 五 六");
                    }
                    printf("\n");
                    for(int controlPrint = 0;controlPrint < 3;controlPrint++){
                        printf("日 一 二 三 四 五 六");
                        printf("   ");
                    }
                    printf("\n");
                }
                    for (int j=0; j<21; j++) {
                        if(j % 7 ==0 && j!=0){
                            printf("  ");
                        }
                        if(totalYear[i][j] == 0){
                            printf("   ");
                        }else if(totalYear[i][j]<10){
                            printf(" %i ",totalYear[i][j]);
                        }else{
                            printf("%i ",totalYear[i][j]);
                        }
                    }

                printf("\n");
            }
        }

    
    
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSUInteger currentMonth = month();
        NSUInteger currentYear = year();
       
        if (argc == 1) {
            printf("     %s月 %04lu\n", arrMonth[currentMonth-1], currentYear);
            printf(" 日 一 二 三 四 五 六 \n");
            showCal(currentYear, currentMonth,1);
      
            
        }else if (argc == 2){
            if (atoi(argv[1])>1752) {
                for(int i = 0;i<12;i++){
                   showCal(atoi(argv[1]), i+1,12);
                }
            }
        }else if (argc == 3){
            if(strcmp(argv[1],"-m") == 0 && atoi(argv[2]) >0 && atoi(argv[2])<13){
                printf("     %s月 %04lu\n", arrMonth[atoi(argv[2])-1], currentYear);
                printf(" 日 一 二 三 四 五 六 \n");
                showCal(currentYear, atoi(argv[2]),1);
            }else if(atoi(argv[1]) >0 && atoi(argv[1])<13 && atoi(argv[2]) >1752 ){
                printf("     %s月 %04d\n", arrMonth[atoi(argv[1])-1], atoi(argv[2]));
                printf(" 日 一 二 三 四 五 六 \n");
               showCal(atoi(argv[2]), atoi(argv[1]),1);
            }else{
                printf("输入不合法！");
            }
                
        }else{
                printf("输入不合法！\n");
        }
        
    }
    return 0;
}
