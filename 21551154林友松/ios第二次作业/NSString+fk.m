//
//  NSString+fk.m
//  ios第二次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import "NSString+fk.h"

@implementation NSString (fk)

+ (BOOL) isPureInt: (NSString*) str
{
    NSScanner* scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end