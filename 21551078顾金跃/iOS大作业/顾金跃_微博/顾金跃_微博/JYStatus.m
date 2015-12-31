//
//  JYStatus.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/22.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYStatus.h"
#import "JYUser.h"

@implementation JYStatus

+(instancetype)statusWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self=[super init])
    {
        //self.ID=[dict[@"idstr"] longLongValue];
        //微博ID
        //self.idstr=dict[@"idstr"];
        //微博内容
        self.text=dict[@"text"];
        //微博来源
        self.source=dict[@"source"];
        //微博转发数
       // self.reposts_count=[dict[@"reposts_count"]intValue];
        //微博评论数
        //self.comments_count=[dict[@"comments_count"]intValue];
        //微博创建时间
        self.created_at=dict[@"created_at"];
        //微博表态数
       // self.attitudes_count=[dict[@"attitudes_count"]intValue];
        
        //微博的配图
        self.thumbnail_pic=dict[@"thumbnail_pic"];
        
        //这里是有问题的
        //self.retweeted_status=dict[@"retweeted_status"];
        
        //微博的作者
        self.user=[JYUser userWithDict:dict[@"user"]];
    }
    return self;
}

-(NSString *)created_at
{
    NSCalendar *calendar=[NSCalendar currentCalendar];
    
    //1.微博发送时间
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *createDate=[fmt dateFromString:_created_at];
    NSDateComponents *createDateCmps=[calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:createDate];
    
    //2.获得当前时间
    NSDate *now=[NSDate date];
    NSDateComponents *nowCmps=[calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    
    //3.判断微博发送时间和现在时间 的差距
    if(createDateCmps.year==nowCmps.year&&createDateCmps.month==nowCmps.month&&createDateCmps.day==nowCmps.day)
    {
        //是否是今天
        if([calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:createDate toDate:now options:0].hour>=1)
        {
            return [NSString stringWithFormat:@"%ld小时前",(long)[calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:createDate toDate:now options:0].hour];
        }
        else if([calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:createDate toDate:now options:0].minute>=1)
        {
            return [NSString stringWithFormat:@"%ld分钟前",(long)[calendar components:NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:createDate toDate:now options:0].minute];
        }
        else
        {
            return @"刚刚";
        }
    }
   // else if()
   // {
        //是否是昨天
    //}
    else if(createDateCmps.year==nowCmps.year)
    {
        //是否是今年
        fmt.dateFormat=@"MM-dd HH:mm";
        return [fmt stringFromDate:createDate];

    }
    else//非今年
    {
        fmt.dateFormat=@"yyyy-MM-dd HH:mm";
        return [fmt stringFromDate:createDate];
    }
}

//这样只调用一次就好了
-(void)setSource:(NSString *)source
{
     //source = "<a href=\"http://weibo.com/\" rel=\"nofollow\">\U5fae\U535a weibo.com</a>";
    long loc=[source rangeOfString:@">"].location+1;
    long length=[source rangeOfString:@"</"].location-loc;
    source=[source substringWithRange:NSMakeRange(loc, length)];
    _source=[NSString stringWithFormat:@"来自%@",source];
}
@end
