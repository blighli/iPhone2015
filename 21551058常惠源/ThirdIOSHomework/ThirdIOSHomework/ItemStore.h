//
//  ItemStore.h
//  ThirdIOSHomework
//
//  Created by 常惠源 on 11/1/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ItemCell;

@interface ItemStore : NSObject

@property(nonatomic)NSArray *allItems;
@property(nonatomic)NSMutableArray *privateItems;

+(instancetype)sharedStore;
-(ItemCell *)createItem;

@end
