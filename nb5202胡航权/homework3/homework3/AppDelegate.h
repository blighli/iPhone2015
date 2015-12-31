//
//  AppDelegate.h
//  homework3
//
//  Created by hucker on 15/11/8.
//  Copyright (c) 2015年 hucker. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ViewController;

NSString *docPath(void);
@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
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

