//
//  NSDate+Util.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)

-(NSString *)getDateString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd"];
    return [formatter stringFromDate:self];
}

-(NSString *)getDateTimeString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    return [formatter stringFromDate:self];
}

@end
