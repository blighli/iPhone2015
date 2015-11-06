//
//  AppDelegate.h
//  homework_3
//
//  Created by zhukun on 15/11/2.
//  Copyright (c) 2015年 zhukun. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate,
UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskFiled;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;


@end

