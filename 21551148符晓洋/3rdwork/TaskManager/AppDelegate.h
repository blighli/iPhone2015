//
//  AppDelegate.h
//  TaskManager
//
//  Created by HacAdmin on 10/29/15.
//  Copyright (c) 2015 HacAdmin. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *SaveToPath(void);

//AppDelegate必须实现UITableViewDataSource
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDataSource>
{
    UITableView *task_table;
    UITextField *task_field;
    UIButton *insert_button;
    NSMutableArray *tasks;
}
-(void)AddTask:(id)sender;
//UITableViewDataSource必须实现两个方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath;
@property (strong, nonatomic) UIWindow *window;


@end

