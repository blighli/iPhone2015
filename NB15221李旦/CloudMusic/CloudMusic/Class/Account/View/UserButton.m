//
//  UserButton.m
//  CloudMusic
//
//  Created by LiDan on 15/12/30.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "UserButton.h"
#import "CloudMusic.pch"

@implementation UserButton
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
    UILabel * title = [[UILabel alloc]init];
    title.font = [UIFont systemFontOfSize:12];
    title.textColor = RGBColor(157, 157, 157);
    
    UILabel * count = [[UILabel alloc]init];
    count.font = [UIFont boldSystemFontOfSize:15];
    
    
    [self addSubview:title];
    [self addSubview:count];
    
    self.title = title;
    self.count = count;
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.title.y = self.height * 0.2;
    self.title.size = [self setViewSize:self.title.font Text:self.title.text];
    self.title.x = (self.width - self.title.width) / 2;
    
    self.count.y = self.title.y + self.title.height;
    self.count.size = [self setViewSize:self.count.font Text:self.count.text];
    self.count.x = (self.width - self.count.width) / 2;

}


-(CGSize)setViewSize:(UIFont *)font Text:(NSString *)text
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}
@end
