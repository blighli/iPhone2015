//
//  main.m
//  Calendar
//
//  Created by LiDan on 15/10/18.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <Foundation/Foundation.h>


NSUInteger firstWeekDayInThisMonth(NSDate *date)
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:1];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    [comps setDay:1];
    NSDate *firstDayofMonthDate = [calendar dateFromComponents:comps];
    NSUInteger firstWeekday = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayofMonthDate];
    return firstWeekday - 1;
}

NSUInteger totalDays(NSDate *date)
{
    NSRange days = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return days.length;
}

NSUInteger totalWeek(NSUInteger firstday,NSUInteger totalDays)
{
    return (firstday + totalDays) % 7 == 0 ? (firstday + totalDays) / 7 : (firstday + totalDays) / 7 + 1;
}

NSDate * setMonthYear(NSString *month,NSString *year)
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM"];

    NSString *dateString = [NSString stringWithFormat:@"%@-%@",year,month];
    
    NSDate *dateTime = [formatter dateFromString:dateString];
    
    return dateTime;
}

NSString *getAllYear (NSString *year)
{
    NSArray *week = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    NSArray *monthChs = @[@[@"一月",@"二月",@"三月"],@[@"四月",@"五月",@"六月"],@[@"七月",@"八月",@"九月"],@[@"十月",@"十一月",@"十二月"]];
    NSString *str = [NSString stringWithFormat:@"\n\t\t\t\t%@\n\n",year];
    NSMutableString *result = [[NSMutableString alloc]init];
    [result appendString:str];
    for (int i = 1; i < 5 ; i ++)
    {
        for (int j = 0 ; j< 3; j ++)
        {
            if (j != 2)
            {
                str = [NSString stringWithFormat:@"\t%@\t\t",monthChs[i - 1][j]];
                [result appendString:str];
            }
            else
            {
                str = [NSString stringWithFormat:@"\t%@",monthChs[i - 1][j]];
                [result appendString:str];
            }

        }
        [result appendString:@"\n"];
        for (int j = 0; j < 3; j ++)
        {
            for (NSString *day in week)
            {
                str = [NSString stringWithFormat:@"%@ ",day];
                [result appendString:str];
            }
            [result appendString:@"  "];
        }
        [result appendString:@"\n"];
        
        NSMutableArray *firstday = [NSMutableArray array];
        NSMutableArray *monthlenth = [NSMutableArray array];
        NSMutableArray *weekline = [NSMutableArray array];
        NSUInteger maxline = 0;
        for (int j = 1; j < 4; j ++)
        {
            NSDate *date = setMonthYear([NSString stringWithFormat:@"%d",(i - 1) * 3 + j], year);
            NSUInteger day = firstWeekDayInThisMonth(date);
            [firstday addObject:[NSString stringWithFormat:@"%lu",(unsigned long)day]];
            NSUInteger lenth = totalDays(date);
            [monthlenth addObject:[NSString stringWithFormat:@"%lu",(unsigned long)lenth]];
            NSUInteger line = totalWeek(day, lenth);
            [weekline addObject:[NSString stringWithFormat:@"%lu",(unsigned long)line]];
            maxline = maxline < line ? line:maxline;
        }
        for (int l = 0; l < maxline;  l ++)
        {
            for (int m = 0; m < 3; m ++)
            {
                int k;
                if (l == 0)
                {
                    for (k = 0; k < [firstday[m] intValue]; k ++)
                    {
                        [result appendString:@"   "];
                    }
                    for (k = 1; k < 8; k++)
                    {
                        str = [NSString stringWithFormat:@"%2d ",k];
                        [result appendString:str];
                        if (([firstday[m] intValue] + k ) % 7 == 0)
                        {
                            break;
                        }
                    }
                    [result appendString:@"  "];
                    [firstday replaceObjectAtIndex:m withObject:[NSString stringWithFormat:@"%d",k + 1]];
                }
                else
                {
                    for (k = [firstday[m] intValue]; k <[firstday[m] intValue] + 7; k ++)
                    {
                        if (k > [monthlenth[m] intValue])
                        {
                            [result appendString:@"   "];
                        }
                        else
                        {
                            str = [NSString stringWithFormat:@"%2d ",k];
                            [result appendString:str];
                        }
                    }
                    [result appendString:@"  "];
                    [firstday replaceObjectAtIndex:m withObject:[NSString stringWithFormat:@"%d",k]];
                }
            }
            [result appendString:@"\n"];
        }
        [result appendString:@"\n"];
    }
    
    return result;
}

NSString* getResultMonth(NSUInteger weekday,NSUInteger monthLenth,NSString* month,NSString *Y)
{
    NSArray *week = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    NSArray *monthChs = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    NSUInteger year = [Y intValue];
    NSString *str = [NSString stringWithFormat:@"\n\t%@ %ld\n",monthChs[[month intValue] - 1],year];
    NSMutableString *result = [[NSMutableString alloc]init];
    [result appendString:str];
    for (NSString *day in week)
    {
        str = [NSString stringWithFormat:@"%@ ",day];
        [result appendString:str];
    }
    [result appendString:@"\n"];
    for (int i = 0 ;i < weekday ;i++)
    {
        [ result appendString:@"   "];
    }
    for (int i = 1; i<= monthLenth; i ++)
    {
        str = [NSString stringWithFormat:@"%2d ",i];
        [result appendString:str];
        if ((weekday + i)%7 == 0)
        {
            [result appendString:@"\n"];
        }
    }
    return result;
}

void input(char * cmd)
{
    NSString *command = [NSString stringWithUTF8String:cmd];
    NSArray * arr = [command componentsSeparatedByString:@" "];
    
    if (![arr[0] isEqualToString:@"cal"])
    {
        NSLog(@"illegal input");
        return;
    }
    if (arr.count == 1)
    {
        NSDate *date = [[NSDate alloc]init];
        
        NSCalendar* calendar = [NSCalendar currentCalendar];
        NSDateComponents* comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date];
        
        date = setMonthYear([NSString stringWithFormat:@"%ld",(long)[comps month]],[NSString stringWithFormat:@"%ld",(long)[comps year]]);
        
        NSUInteger weekday = firstWeekDayInThisMonth(date);
        NSInteger monthLenth =  totalDays(date);
        NSLog(@"%@",getResultMonth(weekday,monthLenth,[NSString stringWithFormat:@"%ld",(long)[comps month]],[NSString stringWithFormat:@"%ld",[comps year]]));
    }
    else if (arr.count == 2)
    {
        NSInteger year = [arr[1] intValue];
        if (1 <= year && year <= 9999)
        {
            NSLog(@"%@",getAllYear([NSString stringWithFormat:@"%lu",year]));
            return ;
        }
        else
        {
            NSLog(@"illegal input");
            return;
        }
    }
    else if(arr.count == 3)
    {
        NSInteger mory = [arr[2] intValue];//month or year
        if ([arr[1] isEqualToString:@"-m"] && 1<= mory && mory <= 12 )
        {
            NSString *month = arr[2];
            NSDate *date = [[NSDate alloc]init];
            
            NSCalendar* calendar = [NSCalendar currentCalendar];
            NSDateComponents* comps = [calendar components:NSCalendarUnitYear fromDate:date];
            
            date = setMonthYear(month,[NSString stringWithFormat:@"%ld",(long)[comps year]]);
            
            NSUInteger weekday = firstWeekDayInThisMonth(date);
            NSInteger monthLenth =  totalDays(date);
            NSLog(@"%@",getResultMonth(weekday,monthLenth,month,[NSString stringWithFormat:@"%ld",[comps year]]));
            return ;
        }
        else
        {
            NSInteger mm = [arr[1] intValue];
            if ( (1 <= mm && mm <= 12)  && ( 1 <= mory && mory <= 9999))
            {
                NSString *month = arr[1];
                NSString *year = arr[2];
                NSDate *date = [[NSDate alloc]init];
                
                date = setMonthYear(month,year);
                
                NSUInteger weekday = firstWeekDayInThisMonth(date);
                NSInteger monthLenth =  totalDays(date);
                NSLog(@"%@",getResultMonth(weekday,monthLenth,month,year));
                return ;
            }
            else
            {
                NSLog(@"illegal input");
                return;
            }
        }
    }
    else
    {
        NSLog(@"illegal input");
        return;
    }
}




int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        
        char cmd[64];
        while (gets(cmd))
        {
            input(cmd);
        }
    }
    return 0;
}

