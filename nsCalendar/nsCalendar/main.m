//
//  GPCalendar.h
//  nsCalendar
//
//  Created by wanghaobo on 15/10/20.
//  Copyright © 2015年 wanghaobo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "GPCalendar.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        char a[100];
        
        GPCalendar*cal=[[GPCalendar alloc]init];
        NSLog(@"请输入命令 cal year 或者 cal month year");
        while (gets(a)) {
            
            NSString*str=[NSString stringWithCString:a encoding:NSUTF8StringEncoding];
            [cal cal:str];
            
        }
        
    }
    return 0;
}
