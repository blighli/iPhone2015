//
//  CheckInput.m
//  ios作业2
//
//  Created by 王林 on 15/10/20.
//  Copyright © 2015年 sjaiwl. All rights reserved.
//

#import "CheckInput.h"

@implementation CheckInput

//判断某个字符串都是纯数字
+ (BOOL) checkStringIsNumber:(NSString *) string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

@end
