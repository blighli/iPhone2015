//
//  FolderTableController.h
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/30.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Folder.h"
#import "Incident.h"


@interface FolderTableController : UITableViewController
//- (instancetype)initWithFetch:(NSFetchedResultsController *)fetchedResultsController;
@property(strong,nonatomic)Folder *folder;
@property(strong,nonatomic)Incident *incident;

- (instancetype)initWithArray:(NSArray *)folderArr;
@end
