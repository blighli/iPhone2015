//
//  UserInfoView.m
//  CloudMusic
//
//  Created by LiDan on 15/12/30.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "UserInfoView.h"
#import "CloudMusic.pch"

@interface UserInfoView()

@property (nonatomic,weak) UIImageView *avatarImage;
@property (nonatomic,weak) UILabel *userName;
@property (nonatomic,weak) UIImageView *sex;
@property (nonatomic,weak) UIButton *signBtn;
@property (nonatomic,weak) UIImageView *crossView;

@end

@implementation UserInfoView

-(instancetype)initWithFrame:(CGRect)frame
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
    UIImageView *avatarImage = [[UIImageView alloc]init];
    
    [avatarImage setImage:[UIImage imageNamed:@"cm2_default_head_90"]];
    
    UILabel *userName = [[UILabel alloc]init];
    userName.text = @"云音乐用户";
    
    UIImageView *sex = [[UIImageView alloc]init];
    [sex setImage:[UIImage imageNamed:@"cm2_icn_boy"]];
    
    UIButton *signBtn = [[UIButton alloc]init];
    UIImageView *btnImage = [[UIImageView alloc]init];
    [btnImage setImage:[UIImage imageNamed:@"cm2_set_btnicn_jifen"]];
    btnImage.width = 15;
    btnImage.height = 15;
    btnImage.x = 10;
    btnImage.y = 6;
    [signBtn setBackgroundImage:[UIImage resizeImageWihtImageName:@"cm2_btmlay_btn_red"] forState:UIControlStateNormal];
    [signBtn setTitle:@"签到" forState:UIControlStateNormal];
    signBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [signBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
    [signBtn setTitleColor:RGBColor(198, 72, 25) forState:UIControlStateNormal];
    [signBtn addSubview:btnImage];
    
    UIImageView *crossView = [[UIImageView alloc]init];
    [crossView setBackgroundColor:RGBColor(240, 240, 240)];
    
    self.sex = sex;
    self.signBtn = signBtn;
    self.avatarImage = avatarImage;
    self.userName = userName;
    self.crossView = crossView;
    
    [self addSubview: avatarImage];
    [self addSubview: userName];
    [self addSubview: sex];
    [self addSubview:signBtn];
    [self addSubview:crossView];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.avatarImage.x = 12.5;
    self.avatarImage.y = self.avatarImage.x;
    self.avatarImage.height = self.height - self.avatarImage.y * 2;
    self.avatarImage.width = self.avatarImage.height;
    self.avatarImage.layer.cornerRadius = self.avatarImage.width / 2;

    self.userName.size = [self setViewSize:self.userName.font Text:self.userName.text];
    self.userName.x = self.avatarImage.x + self.avatarImage.width + 10;
    self.userName.y = (self.height - self.userName.height) / 2;
    
    self.sex.size = self.sex.image.size;
    self.sex.x = self.userName.x + self.userName.width + 5;
    self.sex.y = (self.height - self.sex.height) / 2;
    
    self.signBtn.width = 65;
    self.signBtn.height = 28;
    self.signBtn.x = self.width - self.signBtn.width - 10;
    self.signBtn.y = (self.height - self.signBtn.height) / 2;
    
    self.crossView.x = 0;
    self.crossView.width = self.width;
    self.crossView.height = 1;
    self.crossView.y = self.height - self.crossView.height;
}

-(CGSize)setViewSize:(UIFont *)font Text:(NSString *)text
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

@end
