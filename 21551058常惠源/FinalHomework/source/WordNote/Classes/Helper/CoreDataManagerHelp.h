//
//  CoreDataManagerHelp.h
//  WordNote
//
//  Created by 常惠源 on 12/26/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Content+CoreDataProperties.h"
#import "CustomFile+CoreDataProperties.h"

@interface CoreDataManagerHelp : NSObject
@property (nonatomic, strong)NSManagedObjectContext *managedObjectContext;
#pragma mark - 单例
+ (instancetype)defaultCoreDataManagerHelp;
#pragma mark - 添加文件夹
- (void)addCutomFileListName:(NSString *)name;
#pragma mark - 查询所有文件夹
- (NSArray *)demandCustomArray;
#pragma mark 删除customFile
- (void)removeCustomObject:(CustomFile *)custom;


- (NSString *)setDateToString:(NSDate *)date;

- (NSArray *)demandContentArrayCustomFile:(CustomFile *)customFile;

- (void)addCotentTitle:(NSString *)title contentString:(NSString *)content customFile:(CustomFile *)customFile;

- (void)removeContent:(Content *)content customFile:(CustomFile *)customFile;

- (void)recomposeContent:(Content *)content customFile:(CustomFile *)customFile;

@end
