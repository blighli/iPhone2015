//
//  main.m
//  zh_kk_cal
//
//  Created by 5hen on 15/10/20.
//  Copyright (c) 2015年 5hen. All rights reserved.
//


#import <Foundation/Foundation.h>

int daysOfMonth(int year,int month){
    int days[2][13]={{0,31,28,31,30,31,30,31,31,30,31,30,31},
        {0,31,29,31,30,31,30,31,31,30,31,30,31}};
    int flag=0;
    if((year%4==0&&year%100!=0)||year%400==0)
        flag=1;
    return days[flag][month];
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSArray *monthsCH = [NSArray arrayWithObjects:@"一月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月", @"九月", @"十月", @"十一月", @"十二月"];
        int currentDay[13] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
        int wrong=1;
        
        NSCalendar *gregorian =[[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate* dt=[NSDate date];
        unsigned unitFlags=NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit|NSWeekdayCalendarUnit;
        
        NSDateComponents* comp=[gregorian components:unitFlags fromDate:dt];
        
        NSDateComponents* comp2=[[NSDateComponents alloc]init];
        if(argc==1||argc==3){
            
            if(argc==1){
                comp2.year=comp.year;
                comp2.month=comp.month;
            }
            else if(argc==3){
                if(strcmp(argv[1], "-m")==0){
                    comp2.year=comp.year;
                    int temp;
                    sscanf(argv[2], "%d",&temp);
                    comp2.month=temp;
                }
                else{
                    int tempyear,tempmonth;
                    sscanf(argv[1], "%d",&tempmonth);
                    sscanf(argv[2], "%d",&tempyear);
                    comp2.year=tempyear;
                    comp2.month=tempmonth;
                    
                }
            }
            comp2.day=1;
            
            dt=[gregorian dateFromComponents:comp2];
            comp=[gregorian components:unitFlags fromDate:dt];
            const char *ch = [[monthsCH objectAtIndex:comp.month-1] UTF8String];
            printf("        %s\n",ch);
            printf("日 一 二 三 四 五 六\n");
            int k=1;
            for(int i=1;i<=42;i++){
                if(i<comp.weekday){
                    printf("   ");
                }
                else if(k<=daysOfMonth(comp.year, comp.month)){
                    printf("%2d ",k++);
                }
                else{
                    printf("   ");
                }
                if(i%7==0)
                    printf("\n");
            }
            
        }
        else if(argc==2){
            
            int year_temp=-1;
            sscanf(argv[1], "%d",&year_temp);
            if(year_temp==-1){
                wrong=-1;
            }
            else{
                comp2.year=year_temp;
                
                printf("                           %d\n\n",year_temp);
                for(int i=0;i<4;i++){
                    char *ch1 = [[monthsCH objectAtIndex:(i*3+0)] UTF8String];
                    char *ch2 = [[monthsCH objectAtIndex:(i*3+1)] UTF8String];
                    char *ch3 = [[monthsCH objectAtIndex:(i*3+2)] UTF8String];
                    printf("        %s                  %s                  %s\n",ch1,ch2,ch3);
                    printf("日 一 二 三 四 五 六   日 一 二 三 四 五 六   日 一 二 三 四 五 六\n");
                    for(int row=0;row<6;row++){
                        for(int j=1;j<=3;j++){
                            
                            comp2.month=i*3+j;
                            dt=[gregorian dateFromComponents:comp2];
                            comp=[gregorian components:unitFlags fromDate:dt];
                            
                            if(row==0){
                                for(int ii=1;ii<comp.weekday;ii++){
                                    printf("   ");
                                }
                            }
                            for(int k=currentDay[comp.month];k<=42;k++){
                                if(k<=daysOfMonth(year_temp, i*3+j)){
                                    printf("%2d ",k);
                                }
                                else{
                                    printf("   ");
                                }
                                currentDay[comp.month]++;
                                if((currentDay[comp.month]+comp.weekday-2)%7==0){
                                    printf("  ");
                                    break;
                                }
                            }
                        }
                        printf("\n");
                    }
                }
            }
        }
        else{
            //            printf("there are more than 1 args : %d \n",argc);
            //            for(int i=0;i<argc;i++){
            //                printf("the %d item id :%s\n",i+1,argv[i]);
            //            }
            printf("could not find this command\n");
        }
        
    }
    
    return 0;
}











