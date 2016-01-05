//
//  FileListTableViewController.m
//  WordNote
//
//  Created by 常惠源 on 12/23/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "FileListTableViewController.h"
#import "EditFileTableViewVC.h"
@interface FileListTableViewController ()
@property(nonatomic,strong)NSArray * allDataArray;
@end

@implementation FileListTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.allDataArray = [[DataBaseMananger shareManeger] getDataFromDB];
    
    [self.tableView reloadData];
    for (YTKKeyValueItem * itemss in self.allDataArray) {
        NSLog(@"%@",itemss);
    }
    [super viewWillAppear:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *rightBarView = [[UIView alloc]initWithFrame:CGRectMake(618, 0,60, 44)];
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [editBtn setFrame:CGRectMake(10, 10, 50, 25)];
    [editBtn addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setTitle:@"添加" forState:UIControlStateNormal];
     [rightBarView addSubview:editBtn];
     UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:rightBarView];
     self.navigationItem.rightBarButtonItem = rightBtn;
     self.tableView.backgroundColor = [UIColor k_InterfaceColor];
}

-(void)editAction:(UIButton *)sender
{
    EditFileTableViewVC * VC = [[EditFileTableViewVC alloc]init];
    VC.title = @"归档记事";
    [self.navigationController pushViewController:VC animated:YES];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
        cell.textLabel.font = [UIFont systemFontOfSize:16.0];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    }
    YTKKeyValueItem * items = self.allDataArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",items.itemId];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * str = [dateFormatter stringFromDate:items.createdTime];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",str];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:11];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditFileTableViewVC * vc = [[EditFileTableViewVC alloc]init];
    YTKKeyValueItem * item = self.allDataArray[indexPath.row];
    vc.itemsID = item.itemId;
    vc.title = item.itemId;
    [self.navigationController pushViewController:vc animated:YES];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        YTKKeyValueItem * item = self.allDataArray[indexPath.row];
        [[DataBaseMananger shareManeger]deleteDataWithID:item.itemId];
        
        NSArray * array1 =[[DataBaseMananger shareManeger]getDataFromDB];
        self.allDataArray = [NSArray arrayWithArray:array1];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
    }
}





@end
