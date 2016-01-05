//
//  YCTableViewCell.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCTableViewCell.h"
#import "YCPostFrame.h"
#import "YCPost.h"
#import "UIImageView+WebCache.h"
#define NickNameFont [UIFont systemFontOfSize:12]
#define BodyFont [UIFont systemFontOfSize:14]

@interface YCTableViewCell ()
@property (nonatomic, weak) UIImageView *imgViewIcon;
@property (nonatomic, weak) UILabel *lblNickName;
@property (nonatomic, weak) UILabel *lblBody;
@property (nonatomic, weak) UILabel *lblTime;
@property (nonatomic, weak) UIButton *btnComments;
@end

@implementation YCTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (NSString *)getImageUrl:(NSString *)imgUrl
{
    return [imgUrl componentsSeparatedByString:@"app"][1];
}

- (void)setPostFrame:(YCPostFrame *)postFrame
{
    _postFrame = postFrame;
    YCPost *post = self.postFrame.Post;
    //设置数据
    NSURL *avatarUrl=[NSURL URLWithString:post.author_image_url];
    //原始加载图片方式
//    NSData *avatarData=[NSData dataWithContentsOfURL:avatarUrl];
//    UIImage *avatarImage= [UIImage imageWithData:avatarData];
//    self.imgViewIcon.image = avatarImage;
    
    //SDWebImage插件加载图片方式
    [self.imgViewIcon sd_setImageWithURL:avatarUrl];
    
    self.lblNickName.text = post.author_name;
    self.lblBody.text = post.body;
    self.lblTime.text = post.timestamp;
    [self.btnComments setTitle:[NSString stringWithFormat:@"%d条评论", post.comment_count] forState:UIControlStateNormal];
    [self.btnComments setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    //[self.btnComments addTarget:self action:@selector(showCommentPage) forControlEvents:UIControlEventTouchUpInside];
    //设置内容
    self.imgViewIcon.frame = self.postFrame.IconFrame;
    self.lblNickName.frame = self.postFrame.NickNameFrame;
    self.lblTime.frame = self.postFrame.TimeFrame;
    self.lblBody.frame = self.postFrame.BodyFrame;
    self.btnComments.frame = self.postFrame.CommentsFrame;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //头像
        UIImageView *imgViewIcon = [[UIImageView alloc] init];
        self.imgViewIcon = imgViewIcon;
        [self.contentView addSubview:imgViewIcon];
        //昵称
        UILabel *lblNickName = [[UILabel alloc] init];
        lblNickName.font = NickNameFont;
        self.lblNickName = lblNickName;
        [self.contentView addSubview:lblNickName];
        //正文
        UILabel *lblBody = [[UILabel alloc] init];
        lblBody.numberOfLines = 0;
        lblBody.font = BodyFont;
        self.lblBody = lblBody;
        [self.contentView addSubview:lblBody];
        //时间
        UILabel *lblTime = [[UILabel alloc] init];
        lblTime.font = NickNameFont;
        self.lblTime = lblTime;
        [self.contentView addSubview:lblTime];
        //评论数量
        UIButton *btnComments = [UIButton buttonWithType:UIButtonTypeSystem];
        [btnComments.titleLabel setFont:NickNameFont];
        btnComments.backgroundColor = [UIColor colorWithRed:220 green:190 blue:190 alpha:0.8];
        [btnComments addTarget:self action:@selector(showCommentPage) forControlEvents:UIControlEventTouchUpInside];
        self.btnComments = btnComments;
        [self.contentView addSubview:btnComments];
    }
    return self;
}

+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"post_cell";
    YCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[YCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (void)showCommentPage
{
    //观察者
    //把当前文章URL相关信息
    NSLog(@"%@", self.postFrame.Post.url);
    NSDictionary *userInfo = @{@"url": self.postFrame.Post.url, @"comment_url": self.postFrame.Post.comments, @"post_id": [NSString stringWithFormat:@"%d", self.postFrame.Post.id]};
    NSNotification *notification = [[NSNotification alloc] initWithName:@"showComment" object:nil userInfo:userInfo];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
