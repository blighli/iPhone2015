//
//  GPCalendar.m
//  nsCalendar
//
//  Created by wanghaobo on 15/10/20.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//
#import "GPCalendar.h"

#define kDaySec(se) (NSInteger)((se)/60/60/24)

#define kspace @" "

#define kFormatNum(i) i<10?[NSString stringWithFormat:@" %ld",(i)]:[@((i)) stringValue]

@interface GPCalendar ()
{
    NSString *_moth;
    
    NSString *_year;
}

@property(nonatomic,strong)NSCalendar*calendar;


@end
@implementation GPCalendar

- (instancetype)init
{
    
    
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(NSCalendar *)calendar{
    
    if (_calendar==nil) {
        
        _calendar=[NSCalendar currentCalendar];
        
    }
    return _calendar;
}


-(void)cal:(NSString *)com{
    NSArray*comArr=[com componentsSeparatedByString:@" "];
    
    if (![[comArr firstObject] isEqualToString:@"cal"]) {
        return;
    }
    
    
    
    if (comArr.count<3) {
        _year=comArr[1];
        
        
        for (int i=1; i<=12; i++) {
            
            [self calWithMoth:i Year:[_year integerValue]];
        }
    }else{
        
        
        _moth=comArr[1];
        
        _year=comArr[2];
        
        [self calMoth:[_moth integerValue] year:[_year integerValue]];
        
    }
}


-(void)calyear{
    
    
    
}


-(NSDateComponents*)componentsMoth:(NSInteger)moth year:(NSInteger)year{
    NSDateComponents *compt = [[NSDateComponents alloc] init];
    
    [compt setYear:year];
    
    [compt setMonth:moth];
    
    [compt setDay:10];
    
    [compt setHour:9];
    
    [compt setMinute:45];
    
    [compt setSecond:30];
    
    
    return compt;
}


-(NSString*)headStrFomatWithMoth:(NSString*)moth Year:(NSString*)year{
    
    NSString*str=@" 日 一 二  三 四 五 六 \n";
    
    return [NSString stringWithFormat:@"\n     %@月  %@  \n%@",moth,year,str];
}

-(void)calWithMoth:(NSInteger)moth Year:(NSInteger)year {
    
    NSLog(@"%@",[self calMoth:moth year:year]);
}

-(NSString*)calMoth:(NSInteger)moth year:(NSInteger)year{
    
    NSMutableString*des=[NSMutableString string];
    
    [des appendString:[self headStrFomatWithMoth:[@(moth) stringValue]  Year:[@(year)stringValue]]];
    
    NSDate*date=nil;
    
    NSTimeInterval count=0;
    
    [self.calendar rangeOfUnit:NSCalendarUnitMonth startDate:&date interval:&count forDate:[self.calendar dateFromComponents:[self componentsMoth:moth year:year]]];
    
    
    
    NSInteger daySum=kDaySec(count);
    NSInteger fristDayInWeek=[self dayDistanceWeekWith:date];
    
    // NSLog(@"weekday=%d",fristDayInWeek);
    
    for (int i=0; i<daySum+fristDayInWeek-1; i++) {
        
        if (i%7==0&&i!=0) {
            [des appendFormat:@"\n"];
        }
        
        
        if (i<fristDayInWeek-1) {
            
            [des appendFormat:@" %@ ",kspace];
        }
        else{
            
            [des appendFormat:@"%@%@",kFormatNum(i-fristDayInWeek+2),kspace];
        }
        
    }
    
    
    return des;
}




-(NSInteger)dayDistanceWeekWith:(NSDate*)day{
    
    
    
    
    NSDateComponents *weekDayCom=[self.calendar components:NSCalendarUnitWeekday fromDate:day];
    
    return weekDayCom.weekday;
}




@end
