//
//  ViewController.h
//   Test list
//
//  Created by 天天 龚 on 15/11/3.
//  Copyright © 2015年 天天 龚. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *SaveToPath(void);
@interface ViewController : UIViewController
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
@end

