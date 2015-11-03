//
//  Schedule.h
//  iPhone-Homework03
//
//  Created by 黄炳杰 on 15/10/31.
//  Copyright © 2015年 黄炳杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

- (NSString *)scheduleTextAtIndex:(NSUInteger)index;
- (NSUInteger)schedulesCount;
- (void)insertScheduleWithString:(NSString *)str;
- (void)deleteScheduleAtIndex:(NSUInteger)index;

@end
