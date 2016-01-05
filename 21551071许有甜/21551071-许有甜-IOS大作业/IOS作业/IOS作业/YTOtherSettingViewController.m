//
//  YTOtherSettingViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTOtherSettingViewController.h"
#import "YTOtherSettingCell.h"
#import "YTSettingItem.h"
#import "YTSettingGroup.h"
@interface YTOtherSettingViewController ()

@end

@implementation YTOtherSettingViewController

- (void)setupGroup
{
    YTSettingItem *a1 = [YTSettingItem itemWithTitle:@"声音" destVcClass:nil];
    YTSettingItem *a2 = [YTSettingItem itemWithTitle:@"消息" destVcClass:nil];
    YTSettingGroup *group = [[YTSettingGroup alloc] init];
    group.items = @[a1, a2];
    [self.data addObject:group];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupGroup];
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YTOtherSettingCell *cell = [YTOtherSettingCell cellWithTableView:tableView];
    YTSettingGroup *group = self.data[indexPath.section];
    YTSettingItem* item = group.items[indexPath.row];
    cell.item = item;

    return cell;
}

@end
