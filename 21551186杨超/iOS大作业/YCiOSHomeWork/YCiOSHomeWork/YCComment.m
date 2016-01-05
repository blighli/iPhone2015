//
//  YCComment.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCComment.h"

@implementation YCComment

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.body = dict[@"body"];
        self.body_html = dict[@"body_html"];
        self.author = dict[@"author"];
        self.author_username = dict[@"author_username"];
        self.post_id = [dict[@"post_id"] intValue];
        if ([dict[@"disabled"] boolValue]) {
            self.disabled = true;
        }else{
            self.disabled = false;
        }
        
        NSString *timeStr = dict[@"timestamp"];
        NSRange range = NSMakeRange(4, 21);
        NSString *newTimeStr = [timeStr substringWithRange:range];
        self.timestamp = [self getLocalTime:newTimeStr];
    }
    return self;
}

+ (instancetype)commentWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}


//将GMT时间转换为当前系统时间
- (NSString *)getLocalTime:(NSString *)timeStr
{
    //NSString* timeStr = @"14 Dec 2015 13:55:13";
    //创建并初始化formatter，设置formatter时区与timeStr相同
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"GMT"];//设置时区
    [formatter setTimeZone:timeZone];
    
    //设置源日期时区
    [formatter setDateFormat:@"dd MMMM yyyy HH:mm:ss"];
    NSDate *anyDate = [formatter dateFromString:timeStr];
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate *destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    //再次设置formatter输出格式
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [formatter stringFromDate:destinationDateNow];
    //NSLog(@"%@",dateString);
    return dateString;
}

@end
