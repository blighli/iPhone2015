//
//  ViewController.h
//  TaskList
//
//  Created by wp on 15/10/29.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITableView *taskListTable;

- (IBAction)addTask:(UIButton *)sender;

@end

