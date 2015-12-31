//
//  main.m
//  ios第二次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LYCalCommand.h"
#import "NSString+fk.h"

/**
 cal命令模仿。
 接受一下指令模式：
 $./cal [-j] [-m month] [year]
 */
int main(int argc, char * argv[])
{
    @autoreleasepool{
        //获取命令名
        NSString* command = [NSString stringWithUTF8String: argv[0]];
        //NSLog(@"命令：%s", argv[0]);
        //NSLog(@"参数个数：%d", argc);
        if ([command isEqualToString:@"./cal"])
        {
            LYCalCommand* cal = [[LYCalCommand alloc] init];
            
            //无可选参数输入
            if (argc == 1)
            {
                //cal
                [cal printMonth];
                return 0;
            }
            //一个参数输入
            else if(argc == 2)
            {
                //cal xxxx
                NSString* param = [NSString stringWithUTF8String:argv[1]];
                if ([NSString isPureInt:param])
                {
                    int year = [param intValue];
                    cal.year = year;
                    [cal printYear];
                }
                else
                {
                    printf("ERROR: Illegal param year shoul be a number");
                    [LYCalCommand printNoSuchCommand];
                }
            }
            //两个参数输入
            else if(argc == 3)
            {
                NSString* param_one = [NSString stringWithUTF8String: argv[1]];
                NSString* param_two = [NSString stringWithUTF8String: argv[2]];
                //cal -m xx
                if([param_one isEqualToString:@"-m"])
                {
                    if([NSString isPureInt:param_two])
                    {
                        int month = [param_two intValue];
                        if(month > 0 && month <= 12)
                        {
                            cal.month = month;
                            [cal printMonth];
                        }
                        else
                        {
                            printf("ERROR: Illegal param month is a number tween 1~12.");
                            [LYCalCommand printNoSuchCommand];
                        }
                    }
                    else
                    {
                        printf("ERROR: Illegal param month shoul be a number");
                        [LYCalCommand printNoSuchCommand];
                    }
                }
                //cal xx xxxx
                else if([NSString isPureInt:param_one] && [NSString isPureInt:param_two])
                {
                    int month = [param_one intValue];
                    int year = [param_two intValue];
                    cal.month = month;
                    cal.year = year;
                    [cal printMonth];
                }
                else
                {
                    [LYCalCommand printNoSuchCommand];
                }
            }
            //其他的都是错的，哈哈哈哈
            else
                [LYCalCommand printNoSuchCommand];
        }
        else
        {
            [LYCalCommand printNoSuchCommand];
        }
    }
    return 0;
}