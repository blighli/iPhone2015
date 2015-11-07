//
//  MyCall.h
//  cal-test
//
//  Created by apanoo on 15/10/17.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCal : NSObject
{
    @private
        int _year;
        int _month;
        NSDictionary *_monthStr;
}

// 按年份输出日历
-(void) printWithYear:(int)year;

// 按年份月份输出日历
-(void) printWithYear:(int)year month:(int)month;

@end
