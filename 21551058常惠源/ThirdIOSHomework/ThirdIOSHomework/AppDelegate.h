//
//  AppDelegate.h
//  ThirdIOSHomework
//
//  Created by 常惠源 on 10/28/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *task_table;
    UITextField *task_field;
    UIButton *insert_button;
    NSMutableArray *tasks;
}

-(void)AddTask:(id)sender;

@property (strong, nonatomic) UIWindow *window;

@end

