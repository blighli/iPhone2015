//
//  Incident.h
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/27.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Folder;

@interface Incident : NSManagedObject

@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) Folder *folder;

@end
