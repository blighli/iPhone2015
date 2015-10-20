//
//  Calendar.h
//  Calendar
//
//  Created by John on 15/10/18.
//  Copyright © 2015年 John. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject

-(void)showCurrentMonth;
-(void)showCurrentYearWithMonth:(NSInteger)month;
-(void)showAllTheYear:(NSInteger)year;
-(void)showMonth:(NSInteger)month andYear:(NSInteger)year;

@end
