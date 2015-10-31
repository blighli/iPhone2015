//
//  main.m
//  HomeWork
//
//  Created by linbo on 15/10/18.
//  Copyright © 2015年 linbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrefixHeader.pch"
#import "Cal.h"

void threeMore(NSArray *array){
//    多于3个参数时，看第一个参数是否为cal，
    if([[array objectAtIndex:0] isEqualToString:@"cal"]){
        NSLog(@"usage: cal [-jy] [[month] year]");
        NSLog(@"       cal [-j] [-m month] [year]");
        NSLog(@"       ncal [-Jjpwy] [-s country_code] [[month] year]");
        NSLog(@"       ncal [-Jeo] [year]");
    }else{
        NSLog(@"-bash: %@: command not found",[array objectAtIndex:0]);
    }
}

void three(NSArray *array){
    if(![[array objectAtIndex:0] isEqualToString:@"cal"]){
        NSLog(@"-bash: %@: command not found",[array objectAtIndex:0]);
        return;
    }else{
        int year=0,month=0;
//        当三个参数的时候，先分析第二个参数，若为－m,则是输出当年某月的日历，
        if([[array objectAtIndex:1] isEqualToString:@"-m"]){
            
            NSDateFormatter *dateFormatter =[NSDateFormatter new];
            // 设置日期格式
            [dateFormatter setDateFormat:@"YYYY-MM-dd"];
            NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
            NSArray *arr=[dateString componentsSeparatedByString:@"-"];
            year=[[arr objectAtIndex:0] intValue];
            @try {
                month=[[array objectAtIndex:2] intValue];
                //            NSLog(@"%d",month);
            }
            @catch (NSException *exception) {
                NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                return;
            }
            @finally {
                if(month<1||month>12){
                    NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                    return;
                }
            }
          
         }else{
            // 这里先获取年份，并判断年份的输入是否异常，若年份输入异常，即使月份正常的话，也输出年份异常信息
            @try {
                year=[[array objectAtIndex:2] intValue];
            }
            @catch (NSException *exception) {
                NSLog(@"cal: year 0 not in range 1..9999");
                return;
            }
            @finally {
                if(year<1||year>9999){
                    NSLog(@"cal: year 0 not in range 1..9999");
                    return;
                }
            }
            @try {
                month=[[array objectAtIndex:1] intValue];
    //            NSLog(@"%d",month);
            }
            @catch (NSException *exception) {
                NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                return;
            }
            @finally {
                if(month<1||month>12){
                    NSLog(@"cal: %@ is neither a month number (1..12) nor a name",[array objectAtIndex:1]);
                    return;
                }
            }
        }
        //得到了年份和月份，可以输出日历了
        Cal *cal=[Cal new];
        [cal setYear:year];
        [cal setMonth:month];
        [cal calculateWeek];
        [cal everyMonth];
        [cal printSingleMonth];
    }
}

void two(NSArray *array){
    if(![[array objectAtIndex:0] isEqualToString:@"cal"]){
        NSLog(@"-bash: %@: command not found",[array objectAtIndex:0]);
        return;
    }else{
        
        int year;
        @try {
            year=[[array objectAtIndex:1] intValue];
        }
        @catch (NSException *exception) {
            NSLog(@"cal: year 0 not in range 1..9999");
            return;
        }
        @finally {
            if(year<1||year>9999){
                NSLog(@"cal: year 0 not in range 1..9999");
                return;
            }
        }
        Cal *cal=[Cal new];
        [cal setYear:year];
        [cal calculateWeek];
        [cal printYear];
        [cal everyMonth];
        [cal printDays];
    }
}

void one(NSArray *array){
    if(![[array objectAtIndex:0] isEqualToString:@"cal"]){
        NSLog(@"-bash: %@: command not found",[array objectAtIndex:0]);
        return;
    }else{
        NSDateFormatter *dateFormatter =[NSDateFormatter new];
        // 设置日期格式
        [dateFormatter setDateFormat:@"YYYY-MM-dd"];
        NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
        NSArray *arr=[dateString componentsSeparatedByString:@"-"];
        int year=[[arr objectAtIndex:0] intValue];
        int month=[[arr objectAtIndex:1] intValue];
        Cal *cal=[Cal new];
        [cal setYear:year];
        [cal setMonth:month];
        [cal calculateWeek];
        [cal everyMonth];
        [cal printSingleMonth];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //设置一个死循环
        while (YES) {
            NSMutableString *string=[NSMutableString stringWithCapacity:42];
            NSMutableArray *array=[NSMutableArray arrayWithCapacity:42];
            printf("localhost:~ linbo$ ");
//          获取从控制台的输入
            char c;
            while((c=getc(stdin))!='\n'){
                [string appendFormat:@"%c",c];
            }
            //去掉前后的空格
            NSString *str=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//            按照空格切分数组
            //遍历切分后的数组，将数组中的空格去掉
            for(NSString *judge in [str componentsSeparatedByString:@" "]){
                //            这里有点奇怪，我本想将切分后得到的数组中的空格去掉，
                //            但是判定条件竟然是“”，而不是“ ”，真的有点莫名其妙
                //现在知道了，就应该是““，因为两个空格间的就是”“。
                if(![judge isEqualToString:@""]){
                    [array addObject:judge];
 //                   NSLog(@"%@",judge);
                }
            }
//            当控制台输入参数大于三个时如何处置
            if([array count]>3){
                threeMore(array);
//            当控制台输入参数为3个的时候
            }else if([array count]==3){
                three(array);
//                当控制台输入参数为两个的时候
            }else if([array count]==2){
                two(array);
//                当控制台输入参数为一个的时候
            }else{
                one(array);
            }
            
        }
//        [cal test];
    }
    return 0;
}
