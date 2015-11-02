//
//  ViewController.h
//  Work3
//
//  Created by YXQ on 15/11/2.
//  Copyright (c) 2015年 YXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *insertButton;
@property (strong, nonatomic) IBOutlet UITableView *taskTable;
@property NSMutableArray *tasks;
//-(void)addTask;
@end

