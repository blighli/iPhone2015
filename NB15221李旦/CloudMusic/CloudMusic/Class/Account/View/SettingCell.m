//
//  SettingCell.m
//  CloudMusic
//
//  Created by LiDan on 15/12/31.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "SettingCell.h"
#import "CloudMusic.pch"

@interface SettingCell()

@property (nonatomic,weak) UIView *btmSeparator;

@end

@implementation SettingCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        UIView *btmSpearator = [[UIView alloc]init];
        [btmSpearator setBackgroundColor:RGBColor(240, 240, 240)];
        
        UISwitch *switchBtn = [[UISwitch alloc]init];
        
        [self.contentView addSubview:switchBtn];
        [self.contentView addSubview:btmSpearator];
        
        self.btmSeparator = btmSpearator;
        self.switchBtn = switchBtn;
    }
    
    return self;
}

-(void)moreInfoBtnClick
{
    NSLog(@"点我点我");
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.switchBtn.width = 100;
    self.switchBtn.height = 28;
    self.switchBtn.x = self.width - self.switchBtn.width - 10;
    self.switchBtn.y = (self.height - self.switchBtn.height) / 2;
    
    
    self.btmSeparator.height = 0.5;
    self.btmSeparator.x = 50;
    self.btmSeparator.y = 0;
    self.btmSeparator.width = ScreenWidth - self.btmSeparator.x;
    
    self.textLabel.x = self.btmSeparator.x;
}


@end
