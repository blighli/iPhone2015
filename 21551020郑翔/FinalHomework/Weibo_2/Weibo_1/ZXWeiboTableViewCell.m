//
//  ZXWeiboTableViewCell.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXWeiboTableViewCell.h"
#import "ZXWeibo.h"
#import "ZXWeiboFrame.h"

@interface ZXWeiboTableViewCell()

@property (nonatomic, weak) UIButton *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UILabel *lblText;
@property (nonatomic, weak) UIImageView *imgViewPicture;
@property (nonatomic, weak) UILabel *lblReportDate;

@end

@implementation ZXWeiboTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建5个子控件
        
        //1.头像
//        UIImageView *imgViewIcon = [[UIImageView alloc] init];
//        [self.contentView addSubview:imgViewIcon];
//        self.imgViewIcon = imgViewIcon;

        UIButton *imgViewIcon = [[UIButton alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        //2.昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        lblNickName.font = nameFont;
        [self.contentView addSubview:lblNickName];
        self.lblNickName = lblNickName;
        
        //2.日期
        UILabel *lblReportDate = [[UILabel alloc] init];
        lblReportDate.font = dateFont;
        lblReportDate.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        [self.contentView addSubview:lblReportDate];
        self.lblReportDate = lblReportDate;
        
        //3.会员
        UIImageView *imgViewVip = [[UIImageView alloc] init];
        imgViewVip.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:imgViewVip];
        self.imgViewVip = imgViewVip;
        
        //4.正文
        UILabel *lblText = [[UILabel alloc] init];
        lblText.font = textFont;
        lblText.numberOfLines = 0;
        [self.contentView addSubview:lblText];
        self.lblText = lblText;
        
        //5.配图
        UIImageView *imgViewPicture = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewPicture];
        self.imgViewPicture = imgViewPicture;
        
    }
    return self;
}

- (void)setWeiboFrame:(ZXWeiboFrame *)weiboFrame
{
    _weiboFrame = weiboFrame;
    //1.设置当前单元格中的子控件的数据
    [self settingData];
    //2.设置当前单元格中的子控件的frame
    [self settingFrame];
}


- (void)settingData
{
    ZXWeibo *model = self.weiboFrame.weibo;
    //1.头像
//    NSLog(@"icon: %@", model.icon);
    UIImage *img = [UIImage imageWithContentsOfFile:model.icon];
    CGSize imagesize = img.size;
    imagesize.height = 32;
    imagesize.width = 32;
    
    //对图片大小进行压缩--
    img = [self imageWithImage:img scaledToSize:imagesize];
//    self.imgViewIcon.image = img;
    [self.imgViewIcon setBackgroundImage:img forState:UIControlStateNormal];
    
    //2.昵称
    self.lblNickName.text = model.nickname;
    
    //2.日期
    self.lblReportDate.text = model.report_date;
    
    //3.会员
    if (model.isVip) {
        self.imgViewVip.hidden = NO;
    } else {
        self.imgViewVip.hidden = YES;
    }
    
    //4.正文
    self.lblText.text = model.text;
    
    //5.配图
    //    NSLog(@"picture:   %ld", model.picture.length);
    if (model.picture.length > 0) {
        //        NSLog(@"************x");
        self.imgViewPicture.image = [UIImage imageNamed:model.picture];
        self.imgViewPicture.hidden = NO;
    } else {
        //        NSLog(@"============");
        self.imgViewPicture.hidden = YES;
    }
    
    
}

- (void)settingFrame
{
    //1.头像
    self.imgViewIcon.frame = self.weiboFrame.iconFrame;
    
    //2.昵称
    
    self.lblNickName.frame = self.weiboFrame.nameFrame;
    
    //2.日期
    
    self.lblReportDate.frame = self.weiboFrame.dateFrame;
    
    //3.会员
    
    self.imgViewVip.frame = self.weiboFrame.vipFrame;
    
    //4.正文
    
    self.lblText.frame = self.weiboFrame.textFrame;
    
    //5.配图
    
    self.imgViewPicture.frame = self.weiboFrame.picFrame;
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//对图片尺寸进行压缩--
-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}

@end
