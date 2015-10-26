//
//  main.m
//  OCHomeWork02
//
//  Created by zhu on 15/10/18.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lynn_Cal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Lynn_Cal *cal = [[Lynn_Cal alloc]init];
        
        // 获取当前日期
        NSDate *now = [NSDate date];
        // 获取代表公历的 NSCalendar对象
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        // 定义一个时间字段的旗帜，指定将会获取的年月日和星期
        unsigned unitFlags =  NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
        // 获取不同时间字段的信息
        NSDateComponents* comp = [gregorian components:unitFlags fromDate:now];
        
        // 输入Lynn_Cal指令，执行输出当月的月历
        if(argc == 1)
        {
            [cal printMonth:comp];
        }
        // 输入Lynn_Cal ****指令，执行输出****年的月历
        else if (argc == 2)
        {
            int year = [[NSString stringWithFormat:@"%s", argv[1]] intValue];
            if (year>0 && year<9999)
            {
                // 创建NSDateComponents对象
                NSDateComponents* compN = [[NSDateComponents alloc]init];
                compN.year = year;

                // 通过NSDateComponents所包含的时间字段的数值来恢复NSDate对象
                NSDate *date = [gregorian dateFromComponents:compN];
                unsigned unitFlags =  NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
                NSDateComponents* compNew = [gregorian components:unitFlags fromDate:date];
                
                [cal printYear:compNew];
            }
            else
            {
                printf("无此命令\n");
            }
            
        }
        // 输入3个参数
        else if (argc == 3)
        {
            NSString *com = [NSString stringWithFormat:@"%s", argv[1]];
            int monthCom = [com intValue];
            // 输入Lynn_Cal -m **指令，输出当年**月的月历
            if ([com isEqualToString:@"-m"])
            {
                NSString *com2 = [NSString stringWithFormat:@"%s", argv[2]];
                
                int monthCom2 = [com2 intValue];
                
                if (monthCom2>0 && monthCom2<13)
                {
                    // 创建NSDateComponents对象
                    NSDateComponents* compN = [[NSDateComponents alloc]init];
                    compN.year = comp.year;
                    compN.month = monthCom2;
                    compN.day = 1;
                    // 通过NSDateComponents所包含的时间字段的数值来恢复NSDate对象
                    NSDate *date = [gregorian dateFromComponents:compN];
                    unsigned unitFlags =  NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
                    NSDateComponents* compNew = [gregorian components:unitFlags fromDate:date];
                    
                    [cal printMonth:compNew];
                }
                else
                {
                    printf("无此命令\n");
                }
            }
            // 输入Lynn_Cal ** ****指令，输出****年**月的月历
            else if(monthCom>0 && monthCom<13)
            {
                
                NSString *yearStr = [NSString stringWithFormat:@"%s", argv[2]];
                int year = [yearStr intValue];
                if (year>0 && year<9999)
                {
                    // 创建NSDateComponents对象
                    NSDateComponents* compN = [[NSDateComponents alloc]init];
                    compN.year = year;
                    compN.month = monthCom;
                    compN.day = 1;
                    // 通过NSDateComponents所包含的时间字段的数值来恢复NSDate对象
                    NSDate *date = [gregorian dateFromComponents:compN];
                    unsigned unitFlags =  NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
                    NSDateComponents* compNew = [gregorian components:unitFlags fromDate:date];
                
                    [cal printMonth:compNew];
                }
                else
                {
                    printf("无此命令\n");
                }

            }
            else
            {
                printf("无此命令\n");
            }
            
        }
        // 输入的指令不符合格式要求
        else
        {
            printf("无此命令\n");
        }
    }
    return 0;
}
