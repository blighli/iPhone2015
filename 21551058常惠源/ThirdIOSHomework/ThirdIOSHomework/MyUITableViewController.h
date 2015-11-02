//
//  MyUITableViewController.h
//  ThirdIOSHomework
//
//  Created by 常惠源 on 11/1/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyUITableViewController : UITableViewController

@property UIButton *button;
@property UITextField *inputTextField;
@property NSMutableArray *contentArray;

-(void)addRowToTableView:(id)sender;

@end
