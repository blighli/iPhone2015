//
//  Content+CoreDataProperties.h
//  WordNote
//
//  Created by 常惠源 on 12/23/15.
//  Copyright © 2015 ZJU. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Content.h"

NS_ASSUME_NONNULL_BEGIN

@interface Content (CoreDataProperties)
    
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *content;
@property (nullable, nonatomic, retain) NSManagedObject *customFile;

@end

NS_ASSUME_NONNULL_END
