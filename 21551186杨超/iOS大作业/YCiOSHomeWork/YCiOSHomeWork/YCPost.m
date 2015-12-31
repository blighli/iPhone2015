//
//  YCPost.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCPost.h"

@implementation YCPost

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    //头像地址转换成网络地址 部分image_url是空值，因此需要筛选
    if (dict[@"author_image_url"] != [NSNull null]) {
        NSString *imgUrl = [self getImageUrl:dict[@"author_image_url"]];
        
        NSLog(@"%@", imgUrl);
        NSString *urlStr = [NSString stringWithFormat:@"http://121.42.172.76%@",imgUrl];
        self.author_image_url = urlStr;
    }else{
        self.author_image_url = NULL;
    }

    //时间转换成中文
    NSString *timeStr = dict[@"timestamp"];
    NSRange range = NSMakeRange(4, 21);
    NSString *newTimeStr = [timeStr substringWithRange:range];
    self.timestamp = [self getLocalTime:newTimeStr];
    return self;
}

+ (instancetype)PostWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (NSString *)getImageUrl:(NSString *)imgUrl
{
    return [imgUrl componentsSeparatedByString:@"app"][1];
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
