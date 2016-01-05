//
//  MusicCell.m
//  CloudMusic
//
//  Created by LiDan on 15/12/13.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MusicCell.h"
#import "CloudMusic.pch"

@interface MusicCell()

@property (nonatomic,weak) UILabel *numOfList;
@property (nonatomic,weak) UIButton *moreInfoBtn;
@property (nonatomic,weak) UIView *btmSeparator;

@end

@implementation MusicCell

+(instancetype)musicCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MusicCell";
    
    MusicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if  (cell == nil)
    {
        cell =[[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(void)setMusic:(MusicModel *)music
{
    _music = music;
    
    self.textLabel.text = music.songName;
    self.detailTextLabel.text = music.singer;
}

-(void)setNum:(NSString *)num
{
    self.numOfList.text = num;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self setBackgroundColor:RGBColor(251, 252, 253)];
        UIButton *moreInfoBtn = [[UIButton alloc]init];
        [moreInfoBtn setNormalName:@"cm2_list_btn_more" highlightName:@"cm2_list_btn_more_prs"];
        [moreInfoBtn addTarget:self action:@selector(moreInfoBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *numOfList = [[UILabel alloc]init];
        numOfList.textColor = RGBColor(160, 160, 160);
        
        UIView *btmSpearator = [[UIView alloc]init];
        [btmSpearator setBackgroundColor:RGBColor(220, 220, 220)];
        
        [self.contentView addSubview:moreInfoBtn];
        [self.contentView addSubview:numOfList];
        [self.contentView addSubview:btmSpearator];
        
        self.moreInfoBtn = moreInfoBtn;
        self.numOfList = numOfList;
        self.btmSeparator = btmSpearator;
        
        self.detailTextLabel.textColor = RGBColor(160, 160, 160);
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
    
    self.numOfList.height = 20;
    self.numOfList.width = 20;
    self.numOfList.x = 20;
    self.numOfList.y = (self.height - self.numOfList.height) / 2;
    
    self.moreInfoBtn.size = self.moreInfoBtn.currentBackgroundImage.size;
    self.moreInfoBtn.y = self.numOfList.y;
    self.moreInfoBtn.x = ScreenWidth - self.moreInfoBtn.width - 10;
    
    self.btmSeparator.height = 0.5;
    self.btmSeparator.x = self.numOfList.width + self.numOfList.x + 10;
    self.btmSeparator.y = 0;
    self.btmSeparator.width = ScreenWidth - self.btmSeparator.x;
    
    self.textLabel.x = self.btmSeparator.x;
    self.detailTextLabel.x = self.textLabel.x;
}

@end
