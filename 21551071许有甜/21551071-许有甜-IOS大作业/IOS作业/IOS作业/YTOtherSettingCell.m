//
//  YTOtherSettingCell.m
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTOtherSettingCell.h"

@interface YTOtherSettingCell ()
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;
/**
 *  标签
 */
@property (nonatomic, strong) UILabel *labelView;
@end

@implementation YTOtherSettingCell

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _switchView.on = [defaults boolForKey:self.item.title];
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
/**
 *  监听开关状态改变
 */
- (void)switchStateChange
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];

}
- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 30);
        _labelView.backgroundColor = [UIColor redColor];
    }
    return _labelView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"OtherSetting";
    YTOtherSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YTOtherSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

-(void)setItem:(YTSettingItem *)item
{
    _item = item;
    self.textLabel.text = item.title;
    self.textLabel.backgroundColor = [UIColor redColor];
    self.accessoryView = self.switchView;
}
@end
