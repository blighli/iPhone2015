//
//  YCCommentFrame.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCCommentFrame.h"
#import "YCComment.h"
#define NickNameFont [UIFont systemFontOfSize:12]
#define BodyFont [UIFont systemFontOfSize:14]

@implementation YCCommentFrame

- (void)setComment:(YCComment *)comment
{
    _comment = comment;
    //设置各个控件大小
    CGFloat margin = 10;
    NSString *nickName = self.comment.author_username;
    CGSize nickNameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:NickNameFont];
    CGFloat nickNameX = margin;
    CGFloat nickNameY = margin;
    CGFloat nickNameW = nickNameSize.width;
    CGFloat nickNameH = nickNameSize.height;
    _userNameFrame = CGRectMake(nickNameX, nickNameY, nickNameW, nickNameH);
    
    //时间
    NSString *timestamp = self.comment.timestamp;
    CGSize timestampSize = [self sizeWithText:timestamp andMaxSize:CGSizeMake(355, MAXFLOAT) andFont:NickNameFont];
    CGFloat timestampX = [[UIScreen mainScreen] bounds].size.width - timestampSize.width - margin;
    CGFloat timestampY = margin;
    CGFloat timestampW = timestampSize.width;
    CGFloat timestampH = timestampSize.height;
    _timeFrame = CGRectMake(timestampX, timestampY, timestampW, timestampH);
    
    //正文
    NSString *bodyText = self.comment.body;
    CGSize bodyTextSize = [self sizeWithText:bodyText andMaxSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, MAXFLOAT) andFont:BodyFont];
    CGFloat bodyX = CGRectGetMinX(_userNameFrame);
    CGFloat bodyY = CGRectGetMaxY(_userNameFrame) + margin;
    CGFloat bodyW = bodyTextSize.width;
    CGFloat bodyH = bodyTextSize.height;
    _commentFrame = CGRectMake(bodyX, bodyY, bodyW, bodyH);
    
    //行高
    _rowHeight = CGRectGetMaxY(_commentFrame) + margin;
}

- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)size andFont:(UIFont *)font
{
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
