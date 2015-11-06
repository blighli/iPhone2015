//
//  Calendar.h
//  Calendar_wgj
//
//  Created by 王国军 on 15/10/23.
//  Copyright © 2015年 王国军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calendar : NSObject

@property (nonatomic) NSUInteger day;
@property (nonatomic) NSUInteger month;
@property (nonatomic) NSUInteger year;
- (void) monthOfYearArray;
- (void) printCalendarForYear;
- (void) printCalendarForMonth;

@end
