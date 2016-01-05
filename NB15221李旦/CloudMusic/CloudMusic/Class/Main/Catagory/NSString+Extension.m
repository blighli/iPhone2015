//
//  NSString+Extension.m
//  CloudMusic
//
//  Created by LiDan on 15/12/14.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+(NSString *)getMinuteSecondFrom:(NSTimeInterval)time
{
    int minute = (int)time / 60;
    int second = (int)time % 60;
    
    NSString *min;
    NSString *sec;
    
    if (minute < 10)
    {
        min = [NSString stringWithFormat:@"0%d",minute];
    }
    else
    {
        min = [NSString stringWithFormat:@"%d",minute];
    }
    
    if (second < 10)
    {
        sec = [NSString stringWithFormat:@"0%d",second];
    }
    else
    {
        sec = [NSString stringWithFormat:@"%d",second];
    }
    return [NSString stringWithFormat:@"%@:%@",min,sec];
}

@end
