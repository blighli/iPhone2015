//
//  myCal.h
//  calendar
//
//  Created by Anglet on 15/10/18.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myCal : NSObject{
    NSString* input;
}

//获取本月日历
-(void)cal_print;

//获取指定年／月的日历
-(void)cal_print_year:(int)y month:(int) m;

//获取本年指定月份的日历
-(void)cal_print_month:(int)m;

//获取指定年份日历
-(void)cal_print_all_year:(int)y;

//生成单月日历
-(NSMutableArray*)generateCalWithF_day:(int)f_day andDays:(int)days;

//打印单月日历
-(void)print_cal:(NSMutableArray*)myCal;

@end
