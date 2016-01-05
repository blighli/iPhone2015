//
//  YTBaseViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/25.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTBaseViewController.h"
#import "YTSettingGroup.h"
#import "YTSettingCell.h"
#import "YTSettingItem.h"
#import "YTSelfInfoViewController.h"
#import "YTShareViewController.h"
#import "YTAboutViewController.h"
#import "YTHelpViewController.h"
#import "YTOtherSettingViewController.h"
#import "YTDrawPicViewController.h"
#import "YTOtherViewController.h"
#import "YTLocateViewController.h"
@interface YTBaseViewController ()<YTBaseSelfInfoViewControllerDelegate>

@end

@implementation YTBaseViewController

- (NSArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 背景色
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    YTSettingGroup* group = self.data[section];
    return group.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 创建自定义cell
    YTSettingCell *cell = [YTSettingCell cellWithTableView:tableView];
    
    // 给cell传递模型数据
    YTSettingGroup *group = self.data[indexPath.section];
    cell.item = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 模型数据
    YTSettingGroup *group = self.data[indexPath.section];
    YTSettingItem *item = group.items[indexPath.row];
    
    if (item.option) {
        item.option();
    }else
    {
        if (item.destVcClass == nil) {
            return;
        }
        
        id vc = [[item.destVcClass alloc] init];
        
        // 取得选中那一行的数据
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        YTSettingGroup* group = self.data[path.section];
        
        if ([vc isKindOfClass:[YTSelfInfoViewController class]]) {
            YTSelfInfoViewController* selfInfoVC = vc;
            selfInfoVC.item = group.items[path.row];
            selfInfoVC.delegate = self;
            selfInfoVC.title = @"设置昵称";
            selfInfoVC.item.subtitle = item.subtitle;
            [self.navigationController pushViewController:selfInfoVC animated:YES];
        }else if ( [vc isKindOfClass: [YTShareViewController class]])
        {
            YTShareViewController* shareVC = vc;
            shareVC.title = item.title;
            [self.navigationController pushViewController:shareVC animated:YES];
        }
        else if ( [vc isKindOfClass: [YTHelpViewController class]])
        {
            YTHelpViewController* helpVC = vc;
            helpVC.title = item.title;
            [self.navigationController pushViewController:helpVC animated:YES];
        }else if ( [vc isKindOfClass: [YTAboutViewController class]])
        {
            YTAboutViewController* aboutVC = vc;
            aboutVC.title = item.title;
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
        else if ( [vc isKindOfClass: [YTOtherSettingViewController class]])
        {
            YTOtherSettingViewController* aboutVC = vc;
            aboutVC.title = item.title;
            [self.navigationController pushViewController:aboutVC animated:YES];
        }else if ([vc isKindOfClass:[YTDrawPicViewController class]])
        {
            YTDrawPicViewController* drawPicVC = vc;
            drawPicVC.title = item.title;
            [self.navigationController pushViewController:drawPicVC animated:YES];
        }else if ([vc isKindOfClass:[YTOtherViewController class]])
        {
            YTOtherViewController* otherVC = vc;
            otherVC.title = item.title;
            [self.navigationController pushViewController:otherVC animated:YES];
        }else if ([vc isKindOfClass:[YTLocateViewController class]])
        {
            YTLocateViewController* locVC = vc;
            locVC.title = item.title;
            [self.navigationController pushViewController:locVC animated:YES];
        }
    }
}

- (void)selfInfoViewController:(YTBaseSelfInfoViewController *)selfInfoVc didSaveInfo:(YTSettingItem *)selfInfo
{
    [self.tableView reloadData];
}
@end
