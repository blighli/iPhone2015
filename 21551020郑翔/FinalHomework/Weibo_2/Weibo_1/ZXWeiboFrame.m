//
//  ZXWeiboFrame.m
//  Weibo_1
//
//  Created by zhengxiang on 15/12/16.
//  Copyright © 2015年 Zheng Xiang. All rights reserved.
//

#import "ZXWeiboFrame.h"
#import "ZXWeibo.h"


@implementation ZXWeiboFrame

- (void)setWeibo:(ZXWeibo *)weibo
{
    _weibo = weibo;
    
    //统一间距
    CGFloat margin = 10;
    //1.头像
    CGFloat iconW = 35;
    CGFloat iconH = 35;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2.昵称和日期
    NSString *nickName = weibo.nickname;
    NSString *reportdate = weibo.report_date;
    NSLog(@"%@", nickName);
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat dateX = CGRectGetMaxX(_iconFrame) + margin;
    
    CGSize nameSize = [self sizeWithText:nickName andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:nameFont];
    CGSize dateSize = [self sizeWithText:reportdate andMaxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) andFont:dateFont];
    
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    
    CGFloat dateW = dateSize.width;
    CGFloat dateH = dateSize.height;
    
    CGFloat nameY = iconY + (iconH - nameH - dateH) / 2;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    CGFloat dateY = CGRectGetMaxY(_nameFrame);
    _dateFrame = CGRectMake(dateX, dateY, dateW, dateH);
    
    
    NSLog(@"%@", reportdate);
    
    
    //3.会员
    CGFloat vipW = 10;
    CGFloat vipH = 10;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    CGFloat vipY = nameY;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    
    
    //4.正文
    NSLog(@"%@", weibo.text);
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    CGSize textSize = [self sizeWithText:weibo.text andMaxSize:CGSizeMake(355, MAXFLOAT) andFont:textFont];
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    //5.配图
    
    CGFloat picW = 100;
    CGFloat picH = 100;
    CGFloat picX = iconX;
    CGFloat picY = CGRectGetMaxY(_textFrame) + margin;
    //    NSLog(@"picY: %f", picY);
    
    _picFrame = CGRectMake(picX, picY, picW, picH);
    
    CGFloat rowHeight = 0;
    if (self.weibo.picture.length > 0) {
        //如果有配图，那么行高就等于配图的最大的Y值 + margin
        rowHeight = CGRectGetMaxY(_picFrame) + margin;
    } else {
        //如果没有，正文最大Y值 + margin
        rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
    //    NSLog(@"rowHeight: %f", rowHeight);
    _rowHeight = rowHeight;
    
}

- (CGSize)sizeWithText:(NSString *)text andMaxSize:(CGSize)maxSize andFont:(UIFont *)font
{
    NSLog(@"text: %@", text);
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}

@end
