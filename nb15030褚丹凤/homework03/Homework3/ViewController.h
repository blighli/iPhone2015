//
//  ViewController.h
//  Homework3
//
//  Created by cdf on 15/11/1.
//  Copyright © 2015年 cdf. All rights reserved.
//


#import <UIKit/UIKit.h>
NSString *path(void);


@interface ViewController : UIViewController <UITableViewDataSource> 
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
    
}
-(void)addTask:(id)sender;
@end
