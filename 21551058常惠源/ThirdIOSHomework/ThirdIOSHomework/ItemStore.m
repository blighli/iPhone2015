//
//  ItemStore.m
//  ThirdIOSHomework
//
//  Created by 常惠源 on 11/1/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import "ItemStore.h"
#import "ItemCell.h"

@implementation ItemStore

+(instancetype)sharedStore{
    ItemStore *itemStore = nil;
    if (!itemStore) {
        itemStore = [[ItemStore alloc]initPrivate];
    }
    return itemStore;
}

-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"use sharedStore" userInfo:nil];
}

-(instancetype)initPrivate{
    self = [super init];
    if (self) {
        _privateItems = [NSMutableArray alloc];
    }
    return self;
}

-(NSArray *)allItems{
    return [self.privateItems copy];
}

-(ItemCell *)createItem{
    ItemCell *itemCell = [[ItemCell alloc]init];
    [self.privateItems addObject:itemCell];
    return itemCell;
}
@end
