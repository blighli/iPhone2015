//
//  AppDelegate.h
//  21551135_STTaskList
//
//  Created by 123 on 15/10/31.
//  Copyright © 2015年 HST. All rights reserved.
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


@end

