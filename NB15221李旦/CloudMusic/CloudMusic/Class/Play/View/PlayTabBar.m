//
//  PlayTabBar.m
//  CloudMusic
//
//  Created by LiDan on 15/12/10.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "PlayTabBar.h"
#import "UIView+Extension.h"
#import "AutoScrollLabel.h"
#import "CloudMusic.pch"


@interface PlayTabBar()

@property (nonatomic,weak) AutoScrollLabel *title;
@property (nonatomic,weak) UILabel *singer;
@property (nonatomic,weak) UIButton* leftBtn;
@property (nonatomic,weak) UIButton* rightBtn;

@end

@implementation PlayTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setSongName:(NSString *)songName
{
    self.title.text = songName;
    _songName = songName;
}

-(void)setSingerName:(NSString *)singerName
{
    self.singer.text = singerName;
    self.singer.size = [self setViewSize:self.singer.font Text:singerName];
    self.singer.x = (ScreenWidth - self.singer.width) / 2;
    _singerName = singerName;
}

-(void)setup
{
    // 左边点击按钮
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"cm2_topbar_icn_back"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.leftBtn = leftBtn;
    
    //右边点击按钮
    UIButton *rightBtn = [[UIButton alloc]init];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"cm2_topbar_icn_share"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    
    //歌曲名
    AutoScrollLabel *title = [[AutoScrollLabel alloc]init];
    title.text = @"测试歌曲";
    self.title = title;
    
    // 演唱者
    UILabel *singer = [[UILabel alloc]init];
    singer.text = @"演唱者";
    singer.textColor = [UIColor whiteColor];
    singer.font = [UIFont systemFontOfSize:11];
    self.singer = singer;

    
    [self addSubview:leftBtn];
    [self addSubview:rightBtn];
    [self addSubview:title];
    [self addSubview:singer];

}

-(void)back
{
    [self superViewController].navigationController.navigationBarHidden = NO;
    [[self superViewController].navigationController popViewControllerAnimated:YES];
}

-(void)share
{
    NSLog(@"分享");
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.leftBtn.size = self.leftBtn.currentBackgroundImage.size;
    self.leftBtn.x = 10;
    self.leftBtn.y = 25;
    
    self.rightBtn.size = self.rightBtn.currentBackgroundImage.size;
    self.rightBtn.x = ScreenWidth - self.rightBtn.width - 10;
    self.rightBtn.y = self.leftBtn.y;
    
    self.title.size = CGSizeMake(200, 25);
    self.title.x = (ScreenWidth - self.title.width) / 2;
    self.title.y = self.rightBtn.y - 5;
    
    self.singer.size = [self setViewSize:self.singer.font Text:self.singer.text];
    self.singer.x = (ScreenWidth - self.singer.width) / 2;
    self.singer.y =  self.height * 0.7;

}

-(CGSize)setViewSize:(UIFont *)font Text:(NSString *)text
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

@end
