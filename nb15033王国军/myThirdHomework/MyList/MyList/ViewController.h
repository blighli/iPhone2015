//
//  ViewController.h
//  MyList
//
//  Created by 王国军 on 15/10/31.
//  Copyright © 2015年 王国军. All rights reserved.
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

