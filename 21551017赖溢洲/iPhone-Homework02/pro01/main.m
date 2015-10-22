//
//  main.m
//  pro01
//
//  Created by 赖溢洲 on 15/10/17.
//  Copyright © 2015年 赖溢洲. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Cal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:argc];
        for (int i = 0; i < argc; i++) {
            NSString *str = [NSString stringWithUTF8String:argv[i]];
            [array addObject:str];
        }
        
        Cal *cal = [[Cal alloc] initWithArray:array];
        [cal Print];
        
    }
    return 0;
}


