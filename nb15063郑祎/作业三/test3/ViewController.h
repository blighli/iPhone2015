//
//  ViewController.h
//  test3
//
//  Created by Bor on 15/11/3.
//  Copyright © 2015年 Apres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

NSString *docPath(void);

- (void)addTask : (id)sender;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void) saveData:(NSNotification *)notification;

@end

