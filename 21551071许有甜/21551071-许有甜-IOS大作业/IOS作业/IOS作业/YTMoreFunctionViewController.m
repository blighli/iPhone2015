//
//  YTMoreFunctionViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTMoreFunctionViewController.h"
#import "MBProgressHUD+YT.h"
#import "UIImage+Extension.h"
#import "YTSettingItem.h"
#import "YTSettingGroup.h"
#import "YTDrawPicViewController.h"
#import "YTOtherViewController.h"
#import "YTLocateViewController.h"
@interface YTMoreFunctionViewController ()

@end

@implementation YTMoreFunctionViewController


/**
 *  数据
 */

- (void)setupGroup1
{
    YTSettingItem *drawPic = [YTSettingItem itemWithIcon:@"画图板" title:@"画图板" destVcClass:[YTDrawPicViewController class]];
    YTSettingItem *loc = [YTSettingItem itemWithIcon:@"我的位置" title:@"我的位置" destVcClass:[YTLocateViewController class]];

    YTSettingGroup *group = [[YTSettingGroup alloc] init];
    group.items = @[drawPic, loc];
    [self.data addObject:group];
    
}

- (void)setupGroup2
{
    YTSettingItem *other = [YTSettingItem itemWithTitle:@"其他功能" destVcClass:[YTOtherViewController class]];
    YTSettingGroup *group = [[YTSettingGroup alloc] init];
    group.items = @[other];
    [self.data addObject:group];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup1];
    [self setupGroup2];
}


#pragma mark 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end
