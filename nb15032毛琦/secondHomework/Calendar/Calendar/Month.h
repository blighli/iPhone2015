//
//  Month.h
//  Calendar
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthCal : NSObject
{
    NSInteger year;
    NSInteger month;
}
@property NSInteger year;
@property NSInteger month;

-(id)initWithYear:(NSInteger)y AndMonth:(NSInteger)m;

-(int)calDayNums;

-(NSString *)printMonth;

-(NSArray *) calOneMonth:(NSInteger)type;

-(void) outputMonthByYM;

@end

