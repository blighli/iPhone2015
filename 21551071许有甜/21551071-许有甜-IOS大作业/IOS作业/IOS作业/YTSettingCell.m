//
//  YTSettingCell.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTSettingCell.h"
#import "YTSettingItem.h"

#import "YTSelfInfoViewController.h"

@interface YTSettingCell()

/**
 *  箭头
 */
@property(nonatomic, strong)UIImageView *arrowView;
/**
 *  标签
 */
@property (nonatomic, strong) UILabel *labelView;


@end

@implementation YTSettingCell

- (void)setItem:(YTSettingItem *)item
{
    _item = item;
    
    // 设置数据
    [self setupData];
    
    // 设置右边的内容
    [self setupRightContent];
}

- (void)setupData
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
    self.detailTextLabel.text = self.item.subtitle;
}

- (void)setupRightContent
{
    self.accessoryView = self.arrowView;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
 
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
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

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        // 初始化背景
        [self setupBg];
        
        // 初始化子控件
        [self setupSubviews];
    }
    return self;
}

/**
 *  初始化子控件
 */
- (void)setupSubviews
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.detailTextLabel.backgroundColor = [UIColor clearColor];
}

/**
 *  初始化背景
 */
- (void)setupBg
{
    // 设置普通背景
    UIView *bg = [[UIView alloc] init];
    bg.backgroundColor = [UIColor whiteColor];
    self.backgroundView = bg;
    
    // 设置选中时的背景
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = [UIColor colorWithRed:237/255 green:233/255 blue:218/255 alpha:1];
    self.selectedBackgroundView = selectedBg;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    YTSettingCell* cell = [[YTSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
