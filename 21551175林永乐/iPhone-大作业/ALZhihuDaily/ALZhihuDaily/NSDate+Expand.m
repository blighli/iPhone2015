//
//  NSDate+Expand.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "NSDate+Expand.h"

@implementation NSDate (Expand)

- (NSDate *)preDate{
    NSDate *preDate = [[NSDate alloc] initWithTimeInterval:(-24 * 3600) sinceDate:self];
    return preDate;
}

@end
