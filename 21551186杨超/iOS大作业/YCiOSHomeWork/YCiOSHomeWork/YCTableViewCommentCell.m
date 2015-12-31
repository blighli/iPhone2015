//
//  YCTableViewCommentCell.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCTableViewCommentCell.h"
#import "YCCommentFrame.h"
#import "YCComment.h"
#define NickNameFont [UIFont systemFontOfSize:12]
#define BodyFont [UIFont systemFontOfSize:14]

@interface YCTableViewCommentCell ()
@property (nonatomic,weak) UILabel *lblNickName;
@property (nonatomic,weak) UILabel *lblTime;
@property (nonatomic,weak) UILabel *lblBody;
@end

@implementation YCTableViewCommentCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setCommentFrame:(YCCommentFrame *)commentFrame
{
    _commentFrame = commentFrame;
    YCComment *comment = self.commentFrame.comment;
    //设置数据
    self.lblNickName.text = comment.author_username;
    self.lblTime.text = comment.timestamp;
    if (comment.disabled == true) {
        self.lblBody.text = @"该评论已被屏蔽";
    }else{
        self.lblBody.text = comment.body;
    }
    //设置frame
    self.lblNickName.frame = self.commentFrame.userNameFrame;
    self.lblTime.frame = self.commentFrame.timeFrame;
    self.lblBody.frame = self.commentFrame.commentFrame;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //statements
        //创建UI
        UILabel *lblNickName = [[UILabel alloc] init];
        lblNickName.font = NickNameFont;
        self.lblNickName = lblNickName;
        [self.contentView addSubview:lblNickName];
        UILabel *lblTime = [[UILabel alloc] init];
        lblTime.font = NickNameFont;
        self.lblTime = lblTime;
        [self.contentView addSubview:lblTime];
        UILabel *lblBody = [[UILabel alloc] init];
        lblBody.font = BodyFont;
        lblBody.numberOfLines = 0;//允许换行
        self.lblBody = lblBody;
        [self.contentView addSubview:lblBody];
    }
    return self;
}

+ (instancetype)tableViewCommentCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"comment_cell";
    YCTableViewCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[YCTableViewCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
