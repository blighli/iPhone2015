//
//  STBuyViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STBuyViewController.h"
#import "STBuyCell.h"

@interface STBuyViewController()<UITableViewDataSource,UITableViewDelegate>

- (IBAction)titleClick:(UIButton *)sender;

@end

@implementation STBuyViewController

-(void)viewDidLoad
{
    UITableView * tableView=[[UITableView alloc]init];
    tableView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
}

- (IBAction)titleClick:(UIButton *)sender
{
    //1.按钮旋转
    [UIView animateWithDuration:0.25 animations:^{
        sender.imageView.transform=CGAffineTransformMakeRotation(M_PI);
    }];
    
    //2.添加UIView
    UIView *temp=[[UIView alloc]init];
    temp.frame=CGRectMake(10, 100, 100, 30);
    temp.backgroundColor=[UIColor redColor];
    [self.view addSubview:temp];
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
    static NSString *ID=@"buycell";
    STBuyCell *buycell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (buycell==nil) {
        buycell=[STBuyCell initWithBuyCell];
        buycell.selectionStyle=UITableViewCellSelectionStyleGray;
    }
    return buycell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}
@end
