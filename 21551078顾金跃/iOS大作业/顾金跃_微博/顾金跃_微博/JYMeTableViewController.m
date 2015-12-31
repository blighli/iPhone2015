//
//  JYMeTableViewController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYMeTableViewController.h"

@interface JYMeTableViewController ()

@end

@implementation JYMeTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:nil action:nil];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

@end
