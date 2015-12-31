//
//  AppDelegate.h
//   Test list
//
//  Created by 天天 龚 on 15/11/3.
//  Copyright © 2015年 天天 龚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}

//- (void)AddTask:(id)sender;
//- (NSUInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@property (strong, nonatomic) UIWindow *window;


@end

