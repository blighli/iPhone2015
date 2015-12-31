//
//  Schedule.h
///  iPhone-Homework03
//
//  Created by 张焕 on 11/2/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

- (NSString *)scheduleTextAtIndex:(NSUInteger)index;
- (NSUInteger)count;
- (void)insertScheduleWithString:(NSString *)str;
- (void)deleteScheduleAtIndex:(NSUInteger)index;

@end
