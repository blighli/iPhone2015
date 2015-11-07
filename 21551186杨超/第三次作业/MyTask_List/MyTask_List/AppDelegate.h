//
//  AppDelegate.h
//  MyTask_List
//
//  Created by YC－MacBookPro on 15/11/1.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,weak) UITableView *taskTable;
@property (nonatomic,weak) UIButton *taskButton;
@property (nonatomic,weak) UITextField *taskField;
@property (nonatomic,strong) NSMutableArray *tasks;

@end