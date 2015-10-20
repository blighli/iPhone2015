//
//  Cal.m
//  HomeWork
//
//  Created by linbo on 15/10/18.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import "Cal.h"
#import "PrefixHeader.pch"

@implementation Cal

-(void)setYear:(int)y{
    year=y;
}

-(void)setMonth:(int)m{
    month=m;
}

//输出单个月的日历
-(void)printSingleMonth{
    NSMutableString *str=[NSMutableString stringWithCapacity:42];
    switch (month) {
        case 1:
            NSLog(@"   January  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m1[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m1[j][o]>=10){
                            [str appendFormat:@"%d ",m1[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m1[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            
            break;
        case 2:
            NSLog(@"   February  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m2[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m2[j][o]>=10){
                            [str appendFormat:@"%d ",m2[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m2[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 3:
            NSLog(@"    March  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m3[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m3[j][o]>=10){
                            [str appendFormat:@"%d ",m3[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m3[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 4:
            NSLog(@"    April  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m4[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m4[j][o]>=10){
                            [str appendFormat:@"%d ",m4[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m4[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 5:
            NSLog(@"     May  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m5[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m5[j][o]>=10){
                            [str appendFormat:@"%d ",m5[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m5[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 6:
            NSLog(@"     June %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m6[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m2[j][o]>=10){
                            [str appendFormat:@"%d ",m6[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m6[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 7:
            NSLog(@"     July  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m7[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m7[j][o]>=10){
                            [str appendFormat:@"%d ",m7[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m7[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 8:
            NSLog(@"    Aaugust  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m8[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m8[j][o]>=10){
                            [str appendFormat:@"%d ",m8[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m8[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 9:
            NSLog(@"    September  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m9[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m9[j][o]>=10){
                            [str appendFormat:@"%d ",m9[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m9[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 10:
            NSLog(@"     October %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m10[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m10[j][o]>=10){
                            [str appendFormat:@"%d ",m10[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m10[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 11:
            NSLog(@"     November  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m11[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m11[j][o]>=10){
                            [str appendFormat:@"%d ",m11[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m11[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        case 12:
            NSLog(@"     December  %d",year);
            NSLog(@"%@ %@ %@ %@ %@ %@ %@",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");
            for(int j=0;j<6;j++){
                for(int o=0;o<7;o++){
                    if(m12[j][o]==0){
                        [str appendString:@"   "];
                    }else{
                        if(m12[j][o]>=10){
                            [str appendFormat:@"%d ",m12[j][o]];
                        }else{
                            [str appendFormat:@" %d ",m12[j][o]];
                        }
                    }
                }
                NSLog(@"%@",str);
                [str setString:@""];
            }
            break;
        default:
            break;
    }
}

//计算是不是闰年
-(BOOL)isRunYear:(int)y{
    if(y<=1700){
        if(y%4==0){
            return YES;
        }else{
            return NO;
        }
    }else{
        if((y%4==0&&y%100!=0)||y%400==0){
            return YES;
        }else{
            return NO;
        }
    }

}

//验证是不是1752年
-(bool)isSpecialYear:(int)y{
    if(year==1752){
        return YES;
    }else{
        return NO;
    }
}

//返回输入的年份的第一天是星期几
-(int)calculateWeek{
//    存储从公元1年开始，到现在的年份总共多少天
    long int days=0;
    for(int i=1;i<year;i++){
        if([self isRunYear:i]){
            days=days+366;
        }else{
            days=days+365;
        }
    }
//    如果输入的年份大于1752年，则需要减掉11天
    if(year>1752){
        days=days-11;
    }
 //   NSLog(@"%ld",(days+6)%7);
    return ((days+6)%7);
}

-(void)printYear{
    NSLog(@"                               %d",year);
    NSLog(@"");
}

-(void)printMonth:(int)quarter{
    switch (quarter) {
        case 1:
            NSLog(@"       %@               %@              %@",@"January",@"February",@"March");
            break;
        case 2:
            NSLog(@"       %@                  %@                   %@",@"April",@"May",@"June");
            break;
        case 3:
            NSLog(@"        %@                 %@               %@",@"July",@"August",@"September");
            break;
        case 4:
            NSLog(@"       %@              %@              %@",@"October",@"November",@"December");
            break;
        default:
            break;
    }
}

-(void)printWeek{
    NSLog(@"%@ %@ %@ %@ %@ %@ %@  %@ %@ %@ %@ %@ %@ %@  %@ %@ %@ %@ %@ %@ %@",

          @"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa",@"Su",@"Mo",@"Tu",@"We",@"Th",@"Fr",@"Sa");

}



//将一个月的每一天保存进一个7*6的数组，数组的列表示星期
-(void)everyMonth{
//     临时变量，存储二月份的天数
    int temp=0;
    int startWeek=[self calculateWeek];
//NSLog(@"%d",startWeek);
    for(int i=1;i<=12;i++){
        switch (i) {
            case 1:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
           //         NSLog(@"%d",j);
                    m1[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case  2:
                if([self isRunYear:year]){
                    temp=29;
                }else{
                    temp=28;
                }
                for(int j=1;j<=temp;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m2[row][col]=j;
                }
                startWeek=(startWeek+temp)%7;
                break;
            case 3:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m3[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case 4:
                for(int j=1;j<=30;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m4[row][col]=j;
                }
                startWeek=(startWeek+30)%7;
                break;
            case 5:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m5[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case 6:
                for(int j=1;j<=30;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m6[row][col]=j;
                }
                startWeek=(startWeek+30)%7;
                break;
            case 7:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m7[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case 8:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m8[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case 10:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m10[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
            case 11:
                for(int j=1;j<=30;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m11[row][col]=j;
                }
                startWeek=(startWeek+30)%7;
                break;
            case 12:
                for(int j=1;j<=31;j++){
                    int row=(startWeek+j-1)/7;
                    int col=(startWeek+j-1)%7;
                    m12[row][col]=j;
                }
                startWeek=(startWeek+31)%7;
                break;
        //因为1752年的九月份少了11天，所以这里九月份单独讨论
            case 9:
                if([self isSpecialYear:year]){
                    int row=0;
                    int col=0;
                    row=(startWeek)/7;
                    col=(startWeek)%7;
                    m9[row][col]=1;
                    row=(startWeek+1)/7;
                    col=(startWeek+1)%7;
                    m9[row][col]=2;
                    for(int j=3;j<=19;j++){
                        int row=(startWeek+j-1)/7;
                        int col=(startWeek+j-1)%7;
                        m9[row][col]=j+11;
                    }
                    startWeek=(startWeek+19)%7;
                    break;
                }else{
                    for(int j=1;j<=30;j++){
                        int row=(startWeek+j-1)/7;
                        int col=(startWeek+j-1)%7;
                        m9[row][col]=j;
                    }
                    startWeek=(startWeek+30)%7;
                    break;
                }
        }
    }
}

//-(void)test{
//    for(int i=0;i<6;i++){
//        for(int j=0;j<7;j++){
//            NSLog(@"%d",m12[i][j]);
//        }
//    }
//}

-(void)printDays{
    NSMutableString *str=[NSMutableString stringWithCapacity:100];
    for(int i=1;i<=4;i++){
        switch (i) {
            case 1:
                [self printMonth:1];
                [self printWeek];
                for(int j=0;j<6;j++){
                    for(int o=0;o<7;o++){
                        if(m1[j][o]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m1[j][o]>=10){
                                [str appendFormat:@"%d ",m1[j][o]];
                            }else{
                                [str appendFormat:@" %d ",m1[j][o]];
                            }
                        }
                    }
                    [str appendString:@" "];
                    for(int p=0;p<7;p++){
                        if(m2[j][p]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m2[j][p]>=10){
                                [str appendFormat:@"%d ",m2[j][p]];
                            }else{
                                [str appendFormat:@" %d ",m2[j][p]];
                            }
                        }
                    }
                    [str appendString:@" "];
                    for(int q=0;q<7;q++){
                        if(m3[j][q]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m3[j][q]>=10){
                                [str appendFormat:@"%d ",m3[j][q]];
                            }else{
                                [str appendFormat:@" %d ",m3[j][q]];
                            }
                        }                    }
                    NSLog(@"%@",str);
                    [str setString:@""];
                }
                break;
            case 2:
                [self printMonth:2];
                [self printWeek];
                for(int j=0;j<6;j++){
                    for(int o=0;o<7;o++){
                        if(m4[j][o]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m4[j][o]>=10){
                                [str appendFormat:@"%d ",m4[j][o]];
                            }else{
                                [str appendFormat:@" %d ",m4[j][o]];
                            }
                        }                    }
                    [str appendString:@" "];
                    for(int p=0;p<7;p++){
                        if(m5[j][p]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m5[j][p]>=10){
                                [str appendFormat:@"%d ",m5[j][p]];
                            }else{
                                [str appendFormat:@" %d ",m5[j][p]];
                            }
                        }
                    }
                    [str appendString:@" "];
                    for(int q=0;q<7;q++){
                        if(m6[j][q]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m6[j][q]>=10){
                                [str appendFormat:@"%d ",m6[j][q]];
                            }else{
                                [str appendFormat:@" %d ",m6[j][q]];
                            }
                        }
                    }
                    NSLog(@"%@",str);
                    [str setString:@""];
                }
                break;
            case 3:
                [self printMonth:3];
                [self printWeek];
                for(int j=0;j<6;j++){
                    for(int o=0;o<7;o++){
                        if(m7[j][o]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m7[j][o]>=10){
                                [str appendFormat:@"%d ",m7[j][o]];
                            }else{
                                [str appendFormat:@" %d ",m7[j][o]];
                            }
                       }
                    }
                    [str appendString:@" "];
                    for(int p=0;p<7;p++){
                        if(m8[j][p]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m8[j][p]>=10){
                                [str appendFormat:@"%d ",m8[j][p]];
                            }else{
                                [str appendFormat:@" %d ",m8[j][p]];
                            }
                        }
                    }
                    [str appendString:@" "];
                    for(int q=0;q<7;q++){
                        if(m9[j][q]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m9[j][q]>=10){
                                [str appendFormat:@"%d ",m9[j][q]];
                            }else{
                                [str appendFormat:@" %d ",m9[j][q]];
                            }
                        }
                    }
                    NSLog(@"%@",str);
                    [str setString:@""];
                }
                break;
            case 4:
                [self printMonth:4];
                [self printWeek];
                for(int j=0;j<6;j++){
                    for(int o=0;o<7;o++){
                        if(m10[j][o]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m10[j][o]>=10){
                                [str appendFormat:@"%d ",m10[j][o]];
                            }else{
                                [str appendFormat:@" %d ",m10[j][o]];
                            }
                        }

                    }
                    [str appendString:@" "];
                    for(int p=0;p<7;p++){
                        if(m11[j][p]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m11[j][p]>=10){
                                [str appendFormat:@"%d ",m11[j][p]];
                            }else{
                                [str appendFormat:@" %d ",m11[j][p]];
                            }
                        }
                    }
                    [str appendString:@" "];
                    for(int q=0;q<7;q++){
                        if(m12[j][q]==0){
                            [str appendString:@"   "];
                        }else{
                            if(m12[j][q]>=10){
                                [str appendFormat:@"%d ",m12[j][q]];
                            }else{
                                [str appendFormat:@" %d ",m12[j][q]];
                            }
                        }
                    }
                    NSLog(@"%@",str);
                    [str setString:@""];
                }
                break;
            default:
                break;
        }
    }
}

@end
