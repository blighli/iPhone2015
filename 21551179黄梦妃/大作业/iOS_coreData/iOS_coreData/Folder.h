//
//  Folder.h
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/27.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Folder : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSSet *incident;
@end

@interface Folder (CoreDataGeneratedAccessors)

- (void)addIncidentObject:(NSManagedObject *)value;
- (void)removeIncidentObject:(NSManagedObject *)value;
- (void)addIncident:(NSSet *)values;
- (void)removeIncident:(NSSet *)values;

@end
