//
//  AppDelegate.h
//  TaskList
//
//  Created by Atlas on 15/11/2.
//  Copyright © 2015年 Atlas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

NSString *docPath(void);

@interface AppDelegate : UIResponder<UIApplicationDelegate,UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

- (void)addTask: (id)sender;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *vc;

@end

