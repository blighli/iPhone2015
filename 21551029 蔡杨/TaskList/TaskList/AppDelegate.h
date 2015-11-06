//
//  AppDelegate.h
//  TaskList
//
//  Created by zhengxiang on 15/11/3.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);
@interface AppDelegate : UIResponder<UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

- (void)addTask: (id)sender;
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@property (strong, nonatomic) UIWindow *window;
@end