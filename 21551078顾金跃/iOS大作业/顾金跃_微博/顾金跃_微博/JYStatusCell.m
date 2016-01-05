//
//  JYStatusCell.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/23.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYStatusCell.h"
#import "JYStatus.h"
#import "JYStatusFrame.h"
#import "JYUser.h"
#import "UIImageView+WebCache.h"
#import "JYStatusToolbar.h"

@interface JYStatusCell()

//顶部的View
@property(nonatomic,weak)UIImageView *topView;

//头像
@property(nonatomic,weak)UIImageView *iconView;

//会员图标
@property(nonatomic,weak)UIImageView *vipView;

//配图
@property(nonatomic,weak)UIImageView *photoView;

//昵称
@property(nonatomic,weak)UILabel *nameLabel;

//时间
@property(nonatomic,weak)UILabel *timeLabel;

//来源
@property(nonatomic,weak)UILabel *sourceLabel;

//内容/正文
@property(nonatomic,weak)UILabel *contentLabel;


//************************************************
////被转发微博的view(父控件)
//@property(nonatomic,weak)UIImageView *retweetiew;
////被转发微博作者的名称
//@property(nonatomic,weak)UILabel *retweetNameLabel;
////被转发微博的正文/内容
//@property(nonatomic,weak)UILabel *retweetContentLabel;
////被转发微博的配图
//@property(nonatomic,weak)UIImageView *retweetPhotoView;
//
//
////*************************************************
//微博的工具条
@property(nonatomic,weak)JYStatusToolbar *statusToolBar;
@end

@implementation JYStatusCell

//添加所有需要的子控件,不需要数据和frame
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        //1.添加原创微博内部的子控件
        [self setupOriginalSubViews];
        
        //2.添加被转发微博内部的子控件
       // [self setupRetweetSubViews];
        
        //3.添加微博的工具条
        [self setupStatusToolBar];
    }
    return self;
}

//添加原创微博内部的子控件
-(void)setupOriginalSubViews
{
    //1.顶部的View/最外面的父控件
    UIImageView *topView=[[UIImageView alloc]init];
    [self.contentView addSubview:topView];
    self.topView=topView;

    //2.头像
    UIImageView *iconView=[[UIImageView alloc]init];
    [self.topView addSubview:iconView];
    self.iconView=iconView;
    
    //3.会员图标
    UIImageView *vipView=[[UIImageView alloc]init];
    vipView.contentMode=UIViewContentModeCenter;
    [self.topView addSubview:vipView];
    self.vipView=vipView;
    
    //4.配图
    UIImageView *photoView=[[UIImageView alloc]init];
    [self.topView addSubview:photoView];
    self.photoView=photoView;
    
    
    //5.昵称
    UILabel *nameLabel=[[UILabel alloc]init];
    [self.topView addSubview:nameLabel];
    nameLabel.font=JYStatusNameFont;
    self.nameLabel=nameLabel;
    
    //6.时间
    UILabel *timeLabel=[[UILabel alloc]init];
    [self.topView addSubview:timeLabel];
    timeLabel.font=JYStatusTimeFont;
    timeLabel.textColor=[UIColor colorWithRed:240/255.0 green:140/255.0 blue:19/255.0 alpha:1];
    self.timeLabel=timeLabel;
    
    //7.来源
    UILabel *sourceLabel=[[UILabel alloc]init];
    [self.topView addSubview:sourceLabel];
    sourceLabel.font=JYStatusSourceFont;
    self.sourceLabel=sourceLabel;
    
    //8.正文
    UILabel *contentLabel=[[UILabel alloc]init];
    [self.topView addSubview:contentLabel];
    contentLabel.font=JYStatusContentFont;
    contentLabel.numberOfLines=0;
    self.contentLabel=contentLabel;
    
}

//.添加被转发微博内部的子控件
//-(void)setupRetweetSubViews
//{
//    //1.被转发微博的view(父控件)
//    UIImageView *retweetiew=[[UIImageView alloc]init];
//    [self.topView addSubview:retweetiew];
//    self.retweetiew=retweetiew;
//    
//    //2.被转发微博作者的名称
//    UILabel *retweetNameLabel=[[UILabel alloc]init];
//    [self.retweetiew addSubview:retweetNameLabel];
//    self.retweetNameLabel=retweetNameLabel;
//    
//    //3.被转发微博的正文/内容
//    UILabel *retweetContentLabel=[[UILabel alloc]init];
//    [self.retweetiew addSubview:retweetContentLabel];
//    self.retweetContentLabel=retweetContentLabel;
//    
//    //4.被转发微博的配图
//    UIImageView *retweetPhotoView=[[UIImageView alloc]init];
//    [self.retweetiew addSubview:retweetPhotoView];
//    self.retweetPhotoView=retweetPhotoView;
//}
//
//添加微博的工具条
-(void)setupStatusToolBar
{
    JYStatusToolbar *statusToolBar=[[JYStatusToolbar alloc]init];
    [self.contentView addSubview:statusToolBar];
    self.statusToolBar=statusToolBar;
}

//传递模型数据
-(void)setStatusFrame:(JYStatusFrame *)statusFrame
{
     _statusFrame=statusFrame;

    //1.原创微博
    [self setupOriginalData];
    
    //2.被转发微博
    //[self setupRetweetData];
    
    //3.微博工具条
    [self setupStatusToolbar];
}

//微博工具条
-(void)setupStatusToolbar
{
    self.statusToolBar.frame=self.statusFrame.statusToolBarF;
}

//原创微博
-(void)setupOriginalData
{
    JYStatus *status=self.statusFrame.status;
    JYUser *user=status.user;
    //1.topView
    self.topView.frame=self.statusFrame.topViewF;
    
    //2.头像
   // [self.iconView setImageWithURL:[NSURL URLWithString:user.profile_image_url] placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:user.profile_image_url]
                     placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    //[self.iconView setImage:[UIImage imageNamed:@"icon"]];
    self.iconView.frame=self.statusFrame.iconViewF;
    
    //3.昵称
    self.nameLabel.text=user.name;
    self.nameLabel.frame=self.statusFrame.nameLabelF;
    
    //4.vip
    if(user.mbtype)
    {
        self.vipView.hidden=NO;
        self.vipView.image=[UIImage imageNamed:[NSString stringWithFormat:@"common_icon_membership_level%d",user.mbrank]];
        self.vipView.frame=self.statusFrame.vipViewF;
        
        self.nameLabel.textColor=[UIColor orangeColor];
    }
    else
    {
        self.vipView.hidden=YES;
    }
    
    //5.时间
    self.timeLabel.text=status.created_at;
    //self.timeLabel.frame=self.statusFrame.timeLabelF;
    CGFloat timeLabelX =self.statusFrame.nameLabelF.origin.x;
    CGFloat timeLabelY = CGRectGetMaxY(self.statusFrame.nameLabelF)+2;
    CGSize timeLabelSize = [status.created_at sizeWithFont:JYStatusTimeFont];
    self.timeLabel.frame=(CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    //6.来源
    self.sourceLabel.text=status.source;
   // self.sourceLabel.frame=self.statusFrame.sourceLabelF;
    CGFloat sourceLabelX =CGRectGetMaxX(self.timeLabel.frame)+8;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [status.source sizeWithFont:JYStatusSourceFont];
    self.sourceLabel.frame=(CGRect){{sourceLabelX,sourceLabelY},sourceLabelSize};

    
    //7.正文
    self.contentLabel.text=status.text;
    self.contentLabel.frame=self.statusFrame.contentLabelF;
    
    //8.配图
    if(status.thumbnail_pic)
    {
        //牵扯到循环利用
        self.photoView.hidden=NO;
        
        [self.photoView sd_setImageWithURL:[NSURL URLWithString:status.thumbnail_pic]
                         placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        [self.photoView setBackgroundColor:[UIColor grayColor]];
        self.photoView.frame=self.statusFrame.photoViewF;
    }
    else
    {
        self.photoView.hidden=YES;
    }
}

//被转发微博
-(void)setupRetweetData
{
    
}
-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}

//拦截frame的设置
-(void)setFrame:(CGRect)frame
{
    //frame.origin.x=10;
    frame.origin.y+=5;
    [super setFrame:frame];
}
@end
