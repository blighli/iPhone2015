//
//  ViewController.h
//  helloworld_zimhy
//
//  Created by menghaizhang on 15/11/1.
//  Copyright © 2015年 menghaizhang. All rights reserved.
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

