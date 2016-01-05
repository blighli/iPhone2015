//
//  YCPostFrame.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCPostFrame.h"
#import "YCPost.h"
#define NickNameFont [UIFont systemFontOfSize:12]
#define BodyFont [UIFont systemFontOfSize:14]

@implementation YCPostFrame

- (void)setPost:(YCPost *)Post
{
    _Post = Post;
    
    //设置各个控件大小
    CGFloat margin = 10;
    //头像
    CGFloat IconX = margin;
    CGFloat IconY = margin;
    CGFloat IconW = 35;
    CGFloat IconH = 35;
    _IconFrame = CGRectMake(IconX, IconY, IconW, IconH);
    
    //昵称
    NSString *nickName = self.Post.author_name;
    CGSize nickNameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:NickNameFont];
    CGFloat nickNameX = CGRectGetMaxX(_IconFrame) + margin;
    CGFloat nickNameY = margin + (IconH - nickNameSize.height)/2;
    CGFloat nickNameW = nickNameSize.width;
    CGFloat nickNameH = nickNameSize.height;
    _NickNameFrame = CGRectMake(nickNameX, nickNameY, nickNameW, nickNameH);
    
    //正文
    NSString *bodyText = self.Post.body;
    CGSize bodyTextSize = [self sizeWithText:bodyText andMaxSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, MAXFLOAT) andFont:BodyFont];
    CGFloat bodyX = CGRectGetMinX(_IconFrame);
    CGFloat bodyY = CGRectGetMaxY(_IconFrame) + margin;
    CGFloat bodyW = bodyTextSize.width;
    CGFloat bodyH = bodyTextSize.height;
    _BodyFrame = CGRectMake(bodyX, bodyY, bodyW, bodyH);
    
    //时间
    NSString *timestamp = self.Post.timestamp;
    CGSize timestampSize = [self sizeWithText:timestamp andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:NickNameFont];
    CGFloat timestampX = [[UIScreen mainScreen] bounds].size.width - timestampSize.width - margin;
    CGFloat timestampY = margin + (IconH - timestampSize.height)/2;
    CGFloat timestampW = timestampSize.width;
    CGFloat timestampH = timestampSize.height;
    _TimeFrame = CGRectMake(timestampX, timestampY, timestampW, timestampH);
    
    //评论数量
    NSString *commentCountText = [NSString stringWithFormat:@"%d条评论", self.Post.comment_count];
    //NSLog(@"%@", commentCountText);
    CGSize commentCountSize = [self sizeWithText:commentCountText andMaxSize:CGSizeMake(300, MAXFLOAT) andFont:NickNameFont];
    CGFloat commentCountX = [[UIScreen mainScreen] bounds].size.width - commentCountSize.width - margin;
    CGFloat commentCountY = CGRectGetMaxY(_BodyFrame) + margin;
    CGFloat commentCountW = commentCountSize.width;
    CGFloat commentCountH = commentCountSize.height;
    _CommentsFrame = CGRectMake(commentCountX, commentCountY, commentCountW, commentCountH);
    
    _rowHeight = CGRectGetMaxY(_CommentsFrame) + margin;
}

- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)size andFont:(UIFont *)font
{
    NSDictionary *attr = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
