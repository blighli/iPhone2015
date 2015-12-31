//
//  ViewController.h
//  MyTaskList
//
//  Created by apanoo on 15/11/1.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *docPath(void);

@interface ViewController : UIViewController <UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void) addTask:(id)sender;

@end

