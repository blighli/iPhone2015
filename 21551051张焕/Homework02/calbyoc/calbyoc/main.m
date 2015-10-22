//
//  main.m
//  calbyoc
//
//  Created by 张焕 on 10/16/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cal.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //将输入的字符串序列化进可变数组中
        NSMutableArray* array = [NSMutableArray arrayWithCapacity:argc];
        for (int i = 0; i < argc; i++) {
            NSString *str = [NSString stringWithUTF8String:argv[i]];
            [array addObject:str];
        }
        
        Cal *cal = [[Cal alloc] initWithArray:array];
        [cal execute];
    }
    return 0;
}
