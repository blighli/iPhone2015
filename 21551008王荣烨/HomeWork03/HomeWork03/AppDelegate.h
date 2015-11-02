//
//  AppDelegate.h
//  HomeWork03
//
//  Created by apanoo on 15/11/2.
//  Copyright (c) 2015年 Wequeen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
} 
- (void)addTask: (id)sender;
@property (strong, nonatomic) UIWindow *window;

@end

