//
//  main.m
//  ALCal
//
//  Created by alezai on 15/10/16.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCal.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:argc];
        for (int i = 0; i < argc; i++) {
            NSString *str = [NSString stringWithUTF8String:argv[i]];
            [array addObject:str];
        }
        
        ALCal *cal = [[ALCal alloc] initWithArray:array];
        [cal execute];
        
    }
    return 0;
}
