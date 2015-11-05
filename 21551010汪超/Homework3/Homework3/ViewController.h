//
//  ViewController.h
//  Homework3
//
//  Created by linbo on 15/11/1.
//  Copyright © 2015年 linbo. All rights reserved.
//

//#import <UIKit/UIKit.h>
//NSString *docPath(void);
//
//@interface ViewController : UIViewController<UITableViewDataSource> 
//{
//    UITableView *taskTable;
//    UITextField *taskField;
//    UIButton *insertButton;
//    NSMutableArray *tasks;
//}
//- (void)addTask: (id)sender;
//@property (strong, nonatomic) UIWindow *window;
//@end
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
