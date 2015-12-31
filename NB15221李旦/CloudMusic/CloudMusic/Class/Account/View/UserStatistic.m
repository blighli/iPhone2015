//
//  UserStatistic.m
//  CloudMusic
//
//  Created by LiDan on 15/12/30.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "UserStatistic.h"
#import "UserButton.h"
#import "CloudMusic.pch"

@interface UserStatistic()

@property (nonatomic,weak) UserButton *activityBtn;
@property (nonatomic,weak) UserButton *foucesBtn;
@property (nonatomic,weak) UserButton *fansBtn;
@property (nonatomic,weak) UIButton *editionBtn;

@end

@implementation UserStatistic

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
    UserButton *activityBtn = [[UserButton alloc]init];
    activityBtn.title.text = @"动态";
    activityBtn.count.text = @"1";
    
    UserButton *foucesBtn = [[UserButton alloc]init];
    foucesBtn.title.text = @"关注";
    foucesBtn.count.text = @"32";
    
    UserButton *fansBtn = [[UserButton alloc]init];
    fansBtn.title.text = @"粉丝";
    fansBtn.count.text = @"7";
    

    
    
    UIButton *editionBtn = [[UIButton alloc]init];
    
    [self addSubview: activityBtn];
    [self addSubview: foucesBtn];
    [self addSubview: fansBtn];
    [self addSubview: editionBtn];
    
    self.activityBtn = activityBtn;
    self.foucesBtn = foucesBtn;
    self.fansBtn = fansBtn;
    self.editionBtn = editionBtn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat btnW = self.width / 4;
    
    for (int i = 0; i < count; i ++)
    {
        UserButton *btn = self.subviews[i];
        btn.x = i * btnW;
        btn.y = 0;
        btn.width = btnW;
        btn.height = self.height;
        if (i != count)
        {
            UIImageView * crossView = [[UIImageView alloc] init];
            crossView.height = btn.height - 2 * 10;
            crossView.width = 1;
            crossView.y = 10;
            crossView.x = i * btnW;
            [crossView setBackgroundColor:RGBColor(240, 240, 240)];
            [self addSubview:crossView];
        }
    }
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [imageView setImage:[UIImage imageNamed:@"cm2_set_icn_edit"]];
    imageView.width = 15;
    imageView.height = 15;
    imageView.x = (self.editionBtn.width - imageView.width) / 2;
    imageView.y = self.editionBtn.height * 0.25;
    
    UILabel *title = [[UILabel alloc]init];
    title.text = @"编辑资料";
    title.font = [UIFont systemFontOfSize:12];
    title.textColor = RGBColor(146, 146, 146);
    title.size = [self setViewSize:title.font Text:title.text];
    title.x = (self.editionBtn.width - title.width) / 2;
    title.y = imageView.height + imageView.y;
    
    [self.editionBtn addSubview:title];
    [self.editionBtn addSubview:imageView];
    
}


-(CGSize)setViewSize:(UIFont *)font Text:(NSString *)text
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}


@end
