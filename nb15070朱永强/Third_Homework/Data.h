//
//  Data.h
//  Third_Homework
//
//  Created by zhuzhu on 15/11/3.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface Data : NSObject <UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *tasks;

-(void)saveData:(NSNotification *)notification;
@end