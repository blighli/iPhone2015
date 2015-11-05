//
//  TaskList.m
//  MyTaskList
//
//  Created by apanoo on 15/11/1.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import "Task.h"

@implementation Task

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithTitle:(NSString*) title
{
    self = [super init];
    if (self) {
        _title = title;
        
        //将NSdate转变为表示时间的NSString
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        NSDate *date = [NSDate  date];
        
        //设置格式,表示方式：年yyyy 月：MM 日：dd  小时：hh 分钟：mm 秒：ss
        
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
        _time = [formatter stringFromDate:date];
        
        
    }
    return self;
}

-(NSString*) text
{
    return [[NSMutableString alloc] initWithFormat:@"%@ :%@", _title, _time];
}

@end
