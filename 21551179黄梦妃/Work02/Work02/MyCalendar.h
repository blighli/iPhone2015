//
//  MyCalender.h
//  Work02
//
//  Created by 黄梦妃 on 15/10/17.
//  Copyright © 2015年 黄梦妃. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCalendar : NSObject

-(void)calCurrentMonth;

-(void)calWithMonth:(NSInteger)month;

-(void)calWithYear:(NSInteger)year;

-(void)calWithMonth:(NSInteger)month andWithYear:(NSInteger)Year;

@end
