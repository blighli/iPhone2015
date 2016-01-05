//
//  STAwardController.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STAwardController.h"
#import "STAwardCell.h"

@interface STAwardController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation STAwardController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
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
    static NSString *ID=@"awardcell";
    STAwardCell *awardcell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (awardcell==nil) {
        awardcell=[STAwardCell initWithAwardCell];
        awardcell.selectionStyle=UITableViewCellSelectionStyleGray;
    }
    return awardcell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

@end
