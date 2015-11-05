//
//  ViewController.h
//  homework3
//
//  Created by cstlab on 15/11/3.
//  Copyright (c) 2015年 Apress. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *path(void);


@interface ViewController : UIViewController <UITableViewDataSource>
{
    UITableView *task_table;
    UITextField *task_field;
    UIButton *insert_button;
    NSMutableArray *tasks;
    
}
-(void)addTask:(id)sender;
@end

