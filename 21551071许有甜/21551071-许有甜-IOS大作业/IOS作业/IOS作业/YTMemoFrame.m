//
//  YTMemoFrame.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//



#import "YTMemoFrame.h"
#import "YTMemo.h"

@implementation YTMemoFrame
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    YTMemo *memo = [[YTMemo alloc]init];
    memo = self.memo;
    
    [aCoder encodeObject:memo.title forKey:@"title"];
    [aCoder encodeObject:memo.substitle forKey:@"substitle"];
    [aCoder encodeObject:memo.time forKey:@"time"];
    [aCoder encodeCGRect:_timeF forKey:@"timeF"];
    [aCoder encodeCGRect:_subtitleF forKey:@"subtitleF"];
    [aCoder encodeCGRect:_titleF forKey:@"titleF"];
    [aCoder encodeFloat:_cellHeight forKey:@"cellHeight"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.substitle = [aDecoder decodeObjectForKey:@"substitle"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        _timeF = [aDecoder decodeCGRectForKey:@"timeF"];
        _subtitleF = [aDecoder decodeCGRectForKey:@"subtitleF"];
        _titleF = [aDecoder decodeCGRectForKey:@"titleF"];
        _cellHeight = [aDecoder decodeFloatForKey:@"cellHeight"];
    
        YTMemo *memo = [[YTMemo alloc]init];
        
        memo.title = self.title;
        memo.substitle = self.substitle;
        memo.time = self.time;
        self.memo = memo;
    }
    return self;
}
/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}


- (void)setMemo:(YTMemo *)memo
{
    _memo = memo;
    
    _title = _memo.title;
    _time = _memo.time;
    _substitle = _memo.substitle;
    
    // 子控件之间的间距
    CGFloat padding = 10;
    
    // 标题
    // 文字的字体
    CGSize titleSize = [self sizeWithText:self.memo.title font:YTTitleFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat titleX = padding;
    CGFloat titleY = padding;
    _titleF = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
    
    // 时间
    CGFloat timeX = titleX;
    CGFloat timeY = CGRectGetMaxY(_titleF) + padding;
    CGSize timeSize = [self sizeWithText:self.memo.time font:YTTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    _timeF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // 正文
    CGFloat substitleX = MAX(CGRectGetMaxX(_titleF), CGRectGetMaxX(_timeF)) + titleSize.width + padding;
    CGFloat substitleY = padding + padding;//CGRectGetMaxY(_titleF) +
    CGSize substitleSize = [self sizeWithText:self.memo.substitle font:YTTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    _subtitleF = CGRectMake(substitleX, substitleY, substitleSize.width, substitleSize.height);
    
    // 设置高度
    _cellHeight = MAX(CGRectGetMaxY(_subtitleF), CGRectGetMaxY(_timeF)) + padding;
}
@end
