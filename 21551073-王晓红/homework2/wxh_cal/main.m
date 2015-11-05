//
//  main.m
//  wxh_cal
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 wxh. All rights reserved.
//

//#ifdef DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"%s",[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(...)
//#endif

#import <Foundation/Foundation.h>
 NSString *mon[12]={@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"};


int isRun(int year){
   if(year%400==0)
       return 1;
   else if(year%4==0&&year%100!=0)
       return 1;
    return 0;

}

void print(int weekday,int day,int remain){
       printf("日 一 二 三 四 五 六\n");
    int i;
    for(i=0;i<weekday-1;i++)
        printf("   ");
    for(i=0;i<day;i++){
        if(i+1<10)
            printf(" ");
        printf("%d ",i+1);
        if(i%7==remain)
            printf("\n");
    }
    
    printf("\n");

}

void printSpec(NSDateComponents *new1,NSDateComponents *new2,
               NSDateComponents *new3,int a[2][12])
{
    int i1,i2,i3,i,w;
    int day1=a[isRun(new1.year)][new1.month-1];
    int day2=a[isRun(new2.year)][new2.month-1];
    int day3=a[isRun(new3.year)][new3.month-1];
    i1=0;i2=0;i3=0;
    const char *s1 = [mon[new1.month-1] UTF8String];
    const char *s2 = [mon[new2.month-1] UTF8String];
    const char *s3 = [mon[new3.month-1] UTF8String];
   // NSLog(@"%s",s);
    printf("      %s                    %s                    %s     \n",s1,s2,s3);
    printf("日 一 二 三 四 五 六");
    printf("    ");
    printf("日 一 二 三 四 五 六");
    printf("    ");
    printf("日 一 二 三 四 五 六\n");
    
    for(i1=0;i1<new1.weekday-1;i1++)
        printf("   ");
    i1=0;
    while(i1<7-new1.weekday+1){
       if(i1+1<10)
         printf(" ");
      printf("%d ",i1+1);
        i1++;
    }
     printf("   ");
    
    for(i2=0;i2<new2.weekday-1;i2++)
        printf("   ");
    i2=0;
    while(i2<7-new2.weekday+1){
        if(i2+1<10)
            printf(" ");
        printf("%d ",i2+1);
        i2++;
    }
     printf("   ");
    
    
    for(i3=0;i3<new3.weekday-1;i3++)
        printf("   ");
    i3=0;
    while(i3<7-new3.weekday+1){
        if(i3+1<10)
            printf(" ");
        printf("%d ",i3+1);
        i3++;
    }
    
      printf("\n");
    for(i=0;i<5;i++){
       
            for(w=0;w<7;w++){
               if(i1<day1){
                 if(i1+1<10)
                   printf(" ");
                 printf("%d ",i1+1);
                i1++;
               }
               else
                printf("   ");
          
           }
        printf("   ");
       for(w=0;w<7;w++){
           if(i2<day2){
                if(i2+1<10)
                    printf(" ");
                printf("%d ",i2+1);
                i2++;
             }
           else
               printf("   ");
           
        }
        printf("   ");
       for(w=0;w<7;w++){
           if(i3<day3){
                if(i3+1<10)
                    printf(" ");
                printf("%d ",i3+1);
                i3++;
               
            }
           else
               printf("   ");
           
        }
        printf("\n");
    }
 
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i,w;
        int a[2][12]={{31,28,31,30,31,30,31,31,30,31,30,31},{31,29,31,30,31,30,31,31,30,31,30,31}};
        
       
        NSCalendar *calendar=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        
        unsigned  unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，
        // insert code here...
        NSDate *dt=[NSDate date];
        NSDateComponents *comp=[calendar components:unitFlags fromDate:dt];
       
        NSDateComponents *compNew=[[NSDateComponents alloc]init];
        
        switch (argc) {
            case 1:{
                compNew.year=comp.year;
                compNew.month=comp.month;
                compNew.day=1;
                NSDate *dat=[calendar dateFromComponents:compNew];
                NSDateComponents *compNew2=[calendar components:unitFlags fromDate:dat];
                int day=a[isRun(compNew2.year)][compNew2.month-1];
                const char *s1 = [mon[compNew2.month-1] UTF8String];
                 printf("     %s %d\n",s1,(int)compNew2.year);
                print(compNew2.weekday,day,7-compNew2.weekday);
                break;
            }
            case 2:{
                
                int year;
                sscanf(argv[1], "%d",&year);
                if(year>=1&&year<=9999){
                NSDateComponents *compNew1=[[NSDateComponents alloc]init];
                NSDateComponents *compNew2=[[NSDateComponents alloc]init];
                NSDateComponents *compNew3=[[NSDateComponents alloc]init];
                
                compNew1.year=year;
                compNew1.day=1;
                
                compNew2.year=year;
                compNew2.day=1;
                
                
                compNew3.year=year;
                compNew3.day=1;
                printf("                                   %d\n\n",(int)compNew1.year);
                for(i=1;i<=12;){
                    compNew1.month=i;
                    compNew2.month=i+1;
                    compNew3.month=i+2;
                    NSDate *dat=[calendar dateFromComponents:compNew1];
                    NSDateComponents *new1=[calendar components:unitFlags fromDate:dat];
                    NSDate *dat2=[calendar dateFromComponents:compNew2];
                    NSDateComponents *new2=[calendar components:unitFlags fromDate:dat2];
                    NSDate *dat3=[calendar dateFromComponents:compNew3];
                    NSDateComponents *new3=[calendar components:unitFlags fromDate:dat3];
                    //NSLog(@"\nweekday:%d\n",new1.weekday);
                   
                    printSpec(new1,new2,new3,a);
                    i=i+3;
                
                }
                }
                else
                    printf("cal: year 0 not in range 1..9999\n");
                break;
            
            }
            case 3:{
                int month;
                sscanf(argv[2],"%d",&month);
//                 int month;
//                 sscanf(argv[2],"%d",&month);
               // bool b=[Beijing isEqualToString:log];
               // bool b=[s isEqualToString:@"-m"];
                if(strcmp(argv[1],"-m")==0){
                    int month;
                    sscanf(argv[2],"%d",&month);
                    if(month>12||month<1){
                        printf("cal: %d is neither a month number (1..12) nor a name\n",month);
                        break;
                        
                    }
                   // NSInteger month=[argv[2] intValue];
                    compNew.year=comp.year;
                    compNew.month=month;
                    compNew.day=1;
                    NSDate *dat=[calendar dateFromComponents:compNew];
                    NSDateComponents *compNew2=[calendar components:unitFlags fromDate:dat];
                    int day=a[isRun(compNew2.year)][compNew2.month-1];
                    const char *s1 = [mon[compNew2.month-1] UTF8String];
                    printf("     %s %d\n",s1,(int)compNew2.year);
                    print(compNew2.weekday,day,7-compNew2.weekday);
                    break;
                }
                else {
                int month;
                int year;
                sscanf(argv[1], "%d",&month);
                sscanf(argv[2], "%d",&year);
                    if(!(month<=12&&month>=1)){
                        printf("cal: illegal option -%s\n",argv[1]);
                        printf("usage: cal [-jy] [[month] year]\n");
                        printf("       cal [-j] [-m month] [year]\n");
                        printf("       ncal [-Jjpwy] [-s country_code] [[month] year]\n");
                        printf("       ncal [-Jeo] [year]\n");
                        break;
                    
                    }
                compNew.year=year;
                compNew.month=month;
                compNew.day=1;
                NSDate *dat=[calendar dateFromComponents:compNew];
                NSDateComponents *compNew2=[calendar components:unitFlags fromDate:dat];
               
                int day=a[isRun(compNew2.year)][compNew2.month-1];
                  const char *s1 = [mon[compNew2.month-1] UTF8String];
                 printf("     %s %d\n",s1,(int)compNew2.year);
                 print(compNew2.weekday,day,7-compNew2.weekday);
                break;
                }
            
            }
                
            default:
                break;
        }
      
    }
    return 0;
}
