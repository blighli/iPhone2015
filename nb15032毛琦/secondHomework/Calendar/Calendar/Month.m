//
//  Month.m
//  Calendar
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import "Month.h"
#import "Util.h"

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

@implementation MonthCal
@synthesize year;
@synthesize month;

-(id)initWithYear:(NSInteger)y AndMonth:(NSInteger)m {
    if(self=[super init]){
        self.year=y;
        self.month=m;
    }
    return self;
}

-(int)calDayNums{
    int daynums;
    NSArray *nums=[NSArray arrayWithObjects:@"31",@"28",@"31",@"30",@"31",@"30",@"31",@"31",@"30",@"31",@"30",@"31",nil];
    daynums=[[nums objectAtIndex:month-1] intValue];
    if(month==2){
        if(year>1752){
            if((year%4==0 &&(year%100)!=0)||year%400==0){
                daynums=29;
            }
        }else{
            if(year%4==0){
                daynums=29;
            }
        }
    }
    return daynums;
}

-(NSString *)printMonth {
    NSArray *mons=[NSArray arrayWithObjects:@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",nil];
    NSString *strm;
    strm=[mons objectAtIndex:month-1];
    return strm;
}

-(NSArray *) calOneMonth:(NSInteger)type {
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if(year==-1&&month!=-1){
        NSDateComponents *yearcomponents = [[NSCalendar currentCalendar] components: NSCalendarUnitYear fromDate:[NSDate date]];
        year=[yearcomponents year];
    }else if(year==-1&&month==-1){
        NSDateComponents *daycomponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
        month= [daycomponents month];
        year= [daycomponents year];
    }
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:1];
    [comps setMonth:month];
    [comps setYear:year];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [gregorian setFirstWeekday:1];
    
    NSDate *date = [gregorian dateFromComponents:comps];
    
    NSDateComponents *weekdayComponents =[gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [weekdayComponents weekday];
    
    //输出年月
    NSString *line1=[NSString string];
    NSInteger len;
    if(type==1){
        line1=[self printMonth];
        len=[line1 length]*2;
    }else if (type==2){
        NSString *mon=[self printMonth];
        line1=[NSString stringWithFormat:@"%@ %2ld",mon,(long)year];
        len=[mon length]*2+3;
    }
    [array addObject:[Utils addSpace:20 string:line1 len:len]];
    
    //输出周数
    [array addObject:@"日 一 二 三 四 五 六"];
    
    //输出月历第一行
    int daynums=[self calDayNums];
    long start=weekday;
    
    NSMutableString *line=[NSMutableString string];
    for (int j=1; j<start; j++) {
        [line appendString:@"   "];
    }
    int i=1;
    for(long j=start;j<7;j++,i++){
        [line appendFormat:@"%2d ",i];
    }
    [line appendFormat:@"%2d",i++];
    [array addObject:[NSString stringWithString:line]];
    
    //月历中间行
    int j=1;
    for (;i<=daynums;j++,i++) {
        if(j%7==1){
            [line setString:@""];
        }
        if(j%7==0){
            [line appendFormat:@"%2d",i];
            if([line length]<20){
                NSInteger n=[line length];
                for (int k=0;k<20-n;k++) {
                    [line appendString:@" "];
                }
            }
            [array addObject:[NSString stringWithString:line]];
        }else{
            [line appendFormat:@"%2d ",i];
        }
    }
    
    //月历最后一行
    if((j-1)%7!=0){
        if([line length]<20){
            NSInteger n=[line length];
            for (int k=0;k<20-n;k++) {
                [line appendString:@" "];
            }
        }
        [array addObject:[NSString stringWithString:line]];
    }
    
    if([array count]<8){
        [array addObject:@"                    "];
    }
    return array;
}


-(void) outputMonthByYM{
    NSArray *mon=[self calOneMonth:2];
    for (int i=0; i<8; i++) {
        NSLog(@"%@",[mon objectAtIndex:i]);
    }
}

@end

