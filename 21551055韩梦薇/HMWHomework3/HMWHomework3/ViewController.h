//
//  ViewController.h
//  HMWHomework3
//
//  Created by zhuzhu on 15/10/31.
//  Copyright © 2015年 wequeen. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *SaveToPath(void);
@interface ViewController : UIViewController <UIApplicationDelegate,UITableViewDataSource>
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

