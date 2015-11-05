//
//  AppDelegate.h
//  TaskList
//
//  Created by Anglet on 15/11/1.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *controller;

@end

