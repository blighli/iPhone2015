//
//  STHallController.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/23.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STHallController.h"
#import "STHallCell.h"

@interface STHallController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation STHallController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"hallcell";
    STHallCell *hallcell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (hallcell==nil) {
        hallcell=[STHallCell initHallCell];
        hallcell.selectionStyle=UITableViewCellSelectionStyleGray;
    }
    return hallcell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

@end
