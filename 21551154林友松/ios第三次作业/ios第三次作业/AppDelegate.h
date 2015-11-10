//
//  AppDelegate.h
//  ios第三次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//




#import <UIKit/UIKit.h>

//声明辅助函数,返回特定文件路径,用于保存用户的任务列表信息
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *tableTask;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;

- (void) addTask: (id)sender;

@end

