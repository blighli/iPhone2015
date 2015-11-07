//
//  DataModel.h
//  TaskList
//
//  Created by wp on 15/10/29.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface DataModel : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *tasks;

-(void)saveData:(NSNotification *)notification;
@end
