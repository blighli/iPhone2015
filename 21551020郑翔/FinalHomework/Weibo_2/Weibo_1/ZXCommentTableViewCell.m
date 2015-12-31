//
//  ZXCommentTableViewCell.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/21.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXCommentTableViewCell.h"
#import "ZXComment.h"
#import "ZXCommentFrame.h"

@interface ZXCommentTableViewCell()

@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UIImageView *imgViewVip;
@property (nonatomic, weak) UILabel *lblText;
@property (nonatomic, weak) UIImageView *imgViewPicture;
@property (nonatomic, weak) UILabel *lblCommentDate;

@end

@implementation ZXCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //创建5个子控件
        
        //1.头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        [self.contentView addSubview:imgViewIcon];
        self.imgViewIcon = imgViewIcon;
        
        
        //2.昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        lblNickName.font = nameFont;
        [self.contentView addSubview:lblNickName];
        self.lblNickName = lblNickName;
        
        //2.日期
        UILabel *lblCommentDate = [[UILabel alloc] init];
        lblCommentDate.font = dateFont;
        lblCommentDate.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        [self.contentView addSubview:lblCommentDate];
        self.lblCommentDate = lblCommentDate;
        
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

- (void)setCommentFrame:(ZXCommentFrame *)commentFrame
{
    _commentFrame = commentFrame;
    //1.设置当前单元格中的子控件的数据
    [self settingData];
    //2.设置当前单元格中的子控件的frame
    [self settingFrame];
}


- (void)settingData
{
    ZXComment *model = self.commentFrame.comment;
    //1.头像
    //    NSLog(@"icon: %@", model.icon);
    UIImage *img = [UIImage imageWithContentsOfFile:model.icon];
    CGSize imagesize = img.size;
    imagesize.height = 32;
    imagesize.width = 32;
    
    //对图片大小进行压缩--
    img = [self imageWithImage:img scaledToSize:imagesize];
    self.imgViewIcon.image = img;
    
    //2.昵称
    self.lblNickName.text = model.nickname;
    
    //2.日期
    self.lblCommentDate.text = model.comment_date;
    
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
    self.imgViewIcon.frame = self.commentFrame.iconFrame;
    
    //2.昵称
    
    self.lblNickName.frame = self.commentFrame.nameFrame;
    
    //2.日期
    
    self.lblCommentDate.frame = self.commentFrame.dateFrame;
    
    //3.会员
    
    self.imgViewVip.frame = self.commentFrame.vipFrame;
    
    //4.正文
    
    self.lblText.frame = self.commentFrame.textFrame;
    
    //5.配图
    
    self.imgViewPicture.frame = self.commentFrame.picFrame;
    
    
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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
