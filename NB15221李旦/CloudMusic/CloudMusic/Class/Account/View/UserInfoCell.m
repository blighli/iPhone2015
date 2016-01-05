//
//  UserInfoCell.m
//  CloudMusic
//
//  Created by LiDan on 15/12/30.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "UserInfoCell.h"
#import "UserInfoView.h"
#import "UserStatistic.h"
#import "CloudMusic.pch"

@interface UserInfoCell()

@property (nonatomic,weak) UserInfoView *topView;
@property (nonatomic,weak) UserStatistic *btmView;

@end

@implementation UserInfoCell

-(instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    UserInfoView * topView = [[UserInfoView alloc]init];
    UserStatistic *btmView = [[UserStatistic alloc]init];
    
    [self.contentView addSubview:topView];
    [self.contentView addSubview:btmView];
    
    self.topView = topView;
    self.btmView = btmView;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.topView.width = self.width;
    self.topView.height = self.height - 50;
    self.topView.x = 0;
    self.topView.y = 0;

    self.btmView.x = 0;
    self.btmView.y = self.topView.height + self.topView.x;
    self.btmView.width = self.width;
    self.btmView.height = self.height - self.topView.height;
}

@end
