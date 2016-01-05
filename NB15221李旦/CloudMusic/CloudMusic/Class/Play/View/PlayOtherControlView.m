//
//  PlayOtherControlView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayOtherControlView.h"
#import "CloudMusic.pch"

@interface PlayOtherControlView()

@property (nonatomic,weak) UIButton *loveBtn;
@property (nonatomic,weak) UIButton *downloadBtn;
@property (nonatomic,weak) UIButton *commentBtn;
@property (nonatomic,weak) UIButton *moreBtn;
@property (nonatomic,assign,getter=isLoving) BOOL loving;

@end

@implementation PlayOtherControlView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    
    UIButton *loveBtn = [[UIButton alloc]init];
    [loveBtn setNormalName:@"cm2_play_icn_love" highlightName:@"cm2_play_icn_love_prs"];
    
    [loveBtn addTarget:self action:@selector(loveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *downloadBtn = [[UIButton alloc]init];
    [downloadBtn setNormalName:@"cm2_play_icn_dld" highlightName:@"cm2_play_icn_dld_prs"];
    
    
    UIButton *commentBtn = [[UIButton alloc]init];
    [commentBtn setNormalName:@"cm2_play_icn_cmt" highlightName:@"cm2_play_icn_cmt_prs"];
    
    UIButton *moreBtn = [[UIButton alloc]init];
    
    [moreBtn setNormalName:@"cm2_play_icn_more" highlightName:@"cm2_play_icn_more_prs"];
    
    self.loveBtn = loveBtn;
    self.downloadBtn = downloadBtn;
    self.commentBtn = commentBtn;
    self.moreBtn = moreBtn;
    
    [self addSubview:loveBtn];
    [self addSubview:downloadBtn];
    [self addSubview:commentBtn];
    [self addSubview:moreBtn];
    
}

-(void)loveBtnClick
{
    self.loving = !self.isLoving;
    
    if (!self.loving)
    {
        [self.loveBtn setNormalName:@"cm2_play_icn_love" highlightName:@"cm2_play_icn_love_prs"];
    }
    else
    {
        [self.loveBtn setNormalName:@"cm2_play_icn_loved" highlightName:@"cm2_play_icn_loved_prs"];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnX = 40;
    CGFloat btnY = 0;
    CGFloat margin = (ScreenWidth - 2 * btnX) / 4;
    for (int i = 0; i < 4 ; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.size = btn.currentBackgroundImage.size;
        btn.x = btnX + i * margin + (margin - btn.size.width) / 2;
        btn.y = btnY;
    }
}

@end
