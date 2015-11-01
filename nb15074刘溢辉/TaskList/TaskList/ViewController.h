//
//  ViewController.h
//  TaskList
//
//  Created by LYH on 15/10/31.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *taskList;
    NSUserDefaults *user;
}


- (IBAction)showInputMethod:(id)sender;

@end

