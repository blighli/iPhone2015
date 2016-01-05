//
//  CoreDataManagerHelp.m
//  WordNote
//
//  Created by 常惠源 on 12/26/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "CoreDataManagerHelp.h"
#import "AppDelegate.h"

@implementation CoreDataManagerHelp
+ (instancetype)defaultCoreDataManagerHelp{
    static CoreDataManagerHelp *help = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        help = [[CoreDataManagerHelp alloc]init];
    });
    return help;
}
- (NSManagedObjectContext *)managedObjectContext{
    if (!_managedObjectContext) {
        _managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    }
    return _managedObjectContext;
}
- (void)saveManagedObject{
    NSError *error = nil;
    [self.managedObjectContext save:&error];
}
- (void)addCutomFileListName:(NSString *)name{
    NSEntityDescription *custom = [NSEntityDescription entityForName:@"CustomFile" inManagedObjectContext:self.managedObjectContext];
    //根据实体描述创建实体（类）
    CustomFile *customFile = [[CustomFile alloc]initWithEntity:custom insertIntoManagedObjectContext:self.managedObjectContext];
    customFile.name = name;
    customFile.date = [NSDate date];
    [self saveManagedObject];
}
- (NSArray *)demandCustomArray{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"CustomFile"];
    //排序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return array;
}
- (void)removeCustomObject:(CustomFile *)custom{
    [custom removeContentSet:custom.contentSet];
    [self.managedObjectContext deleteObject:custom];
    [self saveManagedObject];
}


- (NSArray *)demandContentArrayCustomFile:(CustomFile *)customFile{
    //请求信息
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *contentED = [NSEntityDescription entityForName:@"Content" inManagedObjectContext:self.managedObjectContext];
    //查询请求
    fetchRequest.entity = contentED;
    NSPredicate *contentDict = [NSPredicate predicateWithFormat:@"customFile = %@",customFile];
    //添加到请求
    fetchRequest.predicate = contentDict;
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    //通过请求信息拿到查询到的数组
    NSArray *array = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    return array;
}
- (void)addCotentTitle:(NSString *)title contentString:(NSString *)content customFile:(CustomFile *)customFile{
    NSEntityDescription *contentED = [NSEntityDescription entityForName:@"Content" inManagedObjectContext:self.managedObjectContext];
    Content *cont = [[Content alloc]initWithEntity:contentED insertIntoManagedObjectContext:self.managedObjectContext];
    cont.customFile = customFile;
    cont.title = title;
    cont.content = content;
    cont.date = [NSDate date];
    NSMutableSet *ContentSet = [NSMutableSet set];
    [ContentSet addObject:cont];
    for (Content *contents in [self demandContentArrayCustomFile:customFile]) {
        [ContentSet addObject:contents];
    }
    customFile.contentSet = ContentSet;
    [self saveManagedObject];
}
- (void)removeContent:(Content *)content customFile:(CustomFile *)customFile{
    NSMutableSet *ContentSet = [NSMutableSet set];
    for (Content *contents in [self demandContentArrayCustomFile:customFile]) {
        [ContentSet addObject:contents];
    }
    [ContentSet removeObject:content];
    [self.managedObjectContext deleteObject:content];
    customFile.contentSet = ContentSet;
    [self saveManagedObject];
}

- (void)recomposeContent:(Content *)content customFile:(CustomFile *)customFile{
    content.customFile = customFile;
    content.date = [NSDate date];
    [self saveManagedObject];
}
- (NSString *)setDateToString:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat : @"yyyy-MM-dd HH:mm:ss"];
    return [formatter stringFromDate:date];
}


@end
