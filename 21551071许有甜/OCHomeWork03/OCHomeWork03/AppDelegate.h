//
//  AppDelegate.h
//  OCHomeWork03
//
//  Created by zhu on 15/10/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *docPath(void);

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

-(void)addTask:(id)sender;

@property (nonatomic,strong) UIWindow *window;
@property (nonatomic,strong) UIViewController *rootViewController;

@end

