//
//  STBaseSettingViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//设置控制器

#import "STBaseSettingViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"
#import "STSettingCell.h"


@interface STBaseSettingViewController()


@end
@implementation STBaseSettingViewController

-(instancetype)init
{
    return self=[super initWithStyle:UITableViewStyleGrouped];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景色
    //backgroundView的优先级>backgroundColor
    self.tableView.backgroundView=nil;
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
}

-(NSArray *)data
{
    if (_data==nil) {
        _data=[NSMutableArray array];
        
    }
    return _data;
}

#pragma mark-Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    STSettingGroup *group=self.data[section];
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    STSettingCell *cell=[STSettingCell cellWithTableView:tableView];
    
    //2.给cell传递模型的数据
    STSettingGroup *group=self.data[indexPath.section];
    cell.item=group.items[indexPath.row];
    
    //3.返回cell
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    //1.取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //2.模型数据
    STSettingGroup *group=self.data[indexPath.section];
    STSettingItem *item=group.items[indexPath.row];
    
    if (item.option) {//block有值（点击这个cell。有特定的操作需要执行）
        item.option();
    }else if ([item isMemberOfClass:[STSettingArrowItem class]]) {//箭头
        STSettingArrowItem *arrowItem=(STSettingArrowItem *)item;
        
        //如果没有需要跳转的控制器
        if (arrowItem.destVcClass==nil) return;
        
        UIViewController *vc=[[arrowItem.destVcClass alloc]init];
        vc.title=arrowItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STSettingGroup *group=self.data[section];
    return group.header;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    STSettingGroup *group=self.data[section];
    return group.footer;
}
@end
