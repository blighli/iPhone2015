//
//  DB.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "DB.h"
#import <sqlite3.h>

static sqlite3 *dbpoint = nil;

@implementation DB

+ (sqlite3 *)shareDataBase
{
    if (dbpoint) {
        return dbpoint;
    }
    
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [arr lastObject];
    path = [NSString stringWithFormat:@"%@/postcard.db", path];
    NSLog(@"DBPATH==%@", path);
    
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL judge = [manager fileExistsAtPath:path];
    if (!judge) {
        NSString *source = [[NSBundle mainBundle] pathForResource:@"postcarddb" ofType:@"rdb"];
        [manager copyItemAtPath:source toPath:path error:nil];
    }
    
    sqlite3_open([path UTF8String], &dbpoint);
    return dbpoint;
    
}

@end
