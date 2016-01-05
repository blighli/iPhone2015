//
//  STSettingCell.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STSettingCell.h"
#import "STSettingItem.h"
#import "STSettingSwitchItem.h"
#import "STSettingArrowItem.h"
#import "STSettingLabelItem.h"

@interface STSettingCell()
/**
 箭头
 */
@property(nonatomic,strong)UIImageView *arrowView;
/**
 开关
 */
@property(nonatomic,strong)UISwitch *switchView;
/**
 标签
 */
@property(nonatomic,strong)UILabel *labelView;

@end
@implementation STSettingCell

-(UIImageView *)arrowView
{
    if (_arrowView==nil) {
        _arrowView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}

-(UISwitch *)switchView
{
    if (_switchView==nil) {
        _switchView=[[UISwitch alloc]init];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化操作
        //设置选中时的背景
        UIView *selectedBg=[[UIView alloc]init];
        selectedBg.backgroundColor=[UIColor colorWithRed:241/255.0 green:240/255.0 blue:236/255.0 alpha:1.0];
        self.selectedBackgroundView=selectedBg;
        
    }
    return self;
}
/**
 监听开关状态改变
 */
-(void)switchStateChange
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
}

-(UISwitch *)labelView
{
    if (_labelView==nil) {
        _labelView=[[UILabel alloc]init];
        _labelView.bounds=CGRectMake(0, 0, 100, 30);
        _labelView.backgroundColor=[UIColor redColor];
    }
    return _labelView;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID=@"setting";
    STSettingCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[STSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

-(void)setItem:(STSettingItem *)item
{
    _item=item;
    
    //1.设置数据
    [self setupData];
    
    //2.设置右边的内容
    [self setupRightContent];
    
}
/**
 设置右边的内容
 */
-(void)setupRightContent
{
    if ([self.item isKindOfClass:[STSettingArrowItem class]]) {//箭头
        self.accessoryView=self.arrowView;
    }else if ([self.item isKindOfClass:[STSettingSwitchItem class]]){//开关
        self.accessoryView=self.switchView;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //设置开关的状态
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        self.switchView.on=[defaults boolForKey:self.item.title];
    }else if ([self.item isKindOfClass:[STSettingLabelItem class]]){//标签
        self.accessoryView=self.labelView;
        
    }else{
        self.accessoryView=nil;
    }
}
/**
 设置数据
 */
-(void)setupData
{
    if (self.item.icon)
    {
        self.imageView.image=[UIImage imageNamed:self.item.icon];
    }
    
    self.textLabel.text=self.item.title;
    self.detailTextLabel.text=self.item.subtitle;
    
}
@end
