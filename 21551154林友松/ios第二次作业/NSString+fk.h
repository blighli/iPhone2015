//
//  NSString+fk.h
//  ios第二次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
	扩展NSString类
	1.增加判断字符串是否为整数
 */

@interface NSString (fk)
+ (BOOL) isPureInt: (NSString*) str;
@end
