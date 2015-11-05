//
//  Schedule.m
//  iPhone-Homework03
//
//  Created by alezai on 15/10/31.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "Schedule.h"
#import "IP3ListInfo.h"

static NSString * const kRootKey = @"kRootKey";

@interface Schedule ()

@property (strong, nonatomic) NSMutableArray *listArray;

@end

@implementation Schedule

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSData *data = [NSData dataWithContentsOfFile:[self dataPath]];
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        IP3ListInfo *ip3List = [unArchiver decodeObjectForKey:kRootKey];
        [unArchiver finishDecoding];
        _listArray = [ip3List.listArray mutableCopy];
        if (_listArray == nil) {
            _listArray = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSArray *)getSchedules{
    return self.listArray;
}

- (NSUInteger)schedulesCount{
    return self.listArray.count;
}

- (NSString *)scheduleTextAtIndex:(NSUInteger)index{
    NSString *str = self.listArray[index];
    return str;
}

- (void)insertScheduleWithString:(NSString *)str{
    [self.listArray addObject:str];
    [self updateArchive];
}

- (void)deleteScheduleAtIndex:(NSUInteger)index{
    [self.listArray removeObjectAtIndex:index];
    [self updateArchive];
}

- (void)updateArchive{
    IP3ListInfo *ip3List = [[IP3ListInfo alloc] init];
    ip3List.listArray = [self.listArray copy];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:ip3List forKey:kRootKey];
    [archiver finishEncoding];
    [data writeToFile:[self dataPath] atomically:YES];
}

- (NSString *)dataPath{
    NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = array[0];
    return [path stringByAppendingPathComponent:@"data.archive"];
}

@end
