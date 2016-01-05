//
//  MyTableViewController.h
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/27.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Folder;

@interface MyTableViewController : UITableViewController
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property(strong,nonatomic)NSArray *arr;

-(instancetype)initWithFolder:(Folder *)folder;
@end
