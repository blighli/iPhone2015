//
//  ViewController.h
//  Third_Homework
//
//  Created by zhuzhu on 15/11/3.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataModel;
@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *taskTitle;
@property (weak, nonatomic) IBOutlet UITableView *taskListTable;

- (IBAction)addTask:(UIButton *)sender;

@end

