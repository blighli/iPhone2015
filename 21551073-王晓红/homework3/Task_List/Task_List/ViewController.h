//
//  ViewController.h
//  Task_List
//
//  Created by apple on 15/11/2.
//  Copyright © 2015年 wxh. All rights reserved.
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
- (void)addTask: (id)sender;
@end

