//
//  AccountController.m
//  CloudMusic
//
//  Created by LiDan on 15/12/6.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "AccountController.h"
#import "CloudMusic.pch"
#import "UserInfoCell.h"
#import "SettingCell.h"


@implementation AccountController

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:RGBColor(240, 240, 240)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1)
    {
        return 3;
    }
    else if(section == 2)
    {
        return 6;
    }
    else if(section == 3)
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    if (indexPath.section == 0)
    {
        UserInfoCell* cell = [[UserInfoCell alloc]init];
        return cell;
    }
    else
    {
        SettingCell *cell = [[SettingCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        if (!(indexPath.section == 2 && indexPath.row == 3))
        {
            cell.switchBtn.hidden = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        else
        {
            cell.switchBtn.hidden = NO;
        }
        
        if (indexPath.section == 1 && indexPath.row == 0)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_mail"]];
            cell.textLabel.text = @"我的消息";
        }
        else if (indexPath.section == 1 && indexPath.row == 1)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_level"]];
            cell.textLabel.text = @"我的等级";
        }
        else if (indexPath.section == 1 && indexPath.row == 2)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_member"]];
            cell.textLabel.text = @"付费音乐包";
        }
        else if (indexPath.section == 2 && indexPath.row == 0)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_store"]];
            cell.textLabel.text = @"积分商城";
        }
        else if (indexPath.section == 2 && indexPath.row == 1)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_combo"]];
            cell.textLabel.text = @"在线听歌免流量";
        }
        else if (indexPath.section == 2 && indexPath.row == 2)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_skin"]];
            cell.textLabel.text = @"主题换肤";
        }
        else if (indexPath.section == 2 && indexPath.row == 3)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_night"]];
            cell.textLabel.text = @"夜间模式";
        }
        else if (indexPath.section == 2 && indexPath.row == 4)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_time"]];
            cell.textLabel.text = @"定时关闭";
        }
        else if (indexPath.section == 2 && indexPath.row == 5)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_set"]];
            cell.textLabel.text = @"设置";
        }
        else if (indexPath.section == 3 && indexPath.row == 0)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_share"]];
            cell.textLabel.text = @"分享网易云音乐";
        }
        else if (indexPath.section == 3 && indexPath.row == 1)
        {
            [cell.imageView setImage:[UIImage imageNamed:@"cm2_set_icn_about"]];
            cell.textLabel.text = @"关于";
        }
        else if (indexPath.section == 4 && indexPath.row == 0)
        {
            
            UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
            cell.textLabel.text = @"退出登陆";
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell.textLabel.textColor = RGBColor(198, 70, 53);
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        }
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section != 0)
    {
        return 10;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.width,10)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 155;
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
