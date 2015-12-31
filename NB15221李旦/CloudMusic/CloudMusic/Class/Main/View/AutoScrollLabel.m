//
//  AutoScrollLabel.m
//  AutoScrollLabel
//
//  Created by LiDan on 15/12/28.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "AutoScrollLabel.h"
#import "CloudMusic.pch"

@interface AutoScrollLabel()

@property (nonatomic,weak) UILabel *firstLabel;
@property (nonatomic,weak) UILabel *secondLabel;
@property (nonatomic,assign,getter=isOverFlow) BOOL overFlow;
@property (nonatomic,assign,getter=isSetted) BOOL setted;
@end

@implementation AutoScrollLabel

-(void)setText:(NSString *)text
{
    self.firstLabel.text = text;
    self.secondLabel.text = text;
    self.firstLabel.size = [self setViewSize:self.firstLabel.font Text:self.firstLabel.text];
    self.secondLabel.size = self.firstLabel.size;
    _text = text;
    self.setted = NO;
    self.overFlow = NO;
}

-(NSString *)text
{
    return self.firstLabel.text;
}

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self setup];
    }
    return self;
}

-(void)setup
{
    UILabel *firstLabel = [[UILabel alloc]init];
    UILabel *secondLabel = [[UILabel alloc]init];
    
    firstLabel.font = [UIFont systemFontOfSize:17];
    firstLabel.textColor = [UIColor whiteColor];
    secondLabel.font = firstLabel.font;
    secondLabel.textColor = [UIColor whiteColor];
    self.firstLabel = firstLabel;
    self.secondLabel = secondLabel;
    
    [self addSubview:firstLabel];
    [self addSubview:secondLabel];
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.userInteractionEnabled = NO;
}

-(CGSize)setViewSize:(UIFont *)font Text:(NSString *)text
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}

-(void)autoToScroll
{
    if (self.isOverFlow)
    {
        [UIView animateWithDuration:self.firstLabel.width / 20 delay:3.0f options:0 animations:^{
            [self setContentOffset:CGPointMake(self.firstLabel.width + 40, 0)];
        } completion:^(BOOL finished) {
            [self setContentOffset:CGPointMake(0, 0)];
            [self autoToScroll];
        }];
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];

    if (!self.isSetted)
    {
        self.firstLabel.x = 0;
        self.firstLabel.y = (self.height - self.firstLabel.height) / 2;
        if (self.firstLabel.width > self.width)
        {
            self.overFlow = YES;
            self.secondLabel.hidden = NO;
            self.secondLabel.x = self.firstLabel.width + 40;
            self.secondLabel.y = self.firstLabel.y;
            self.contentSize = CGSizeMake(self.firstLabel.width * 2 + 40, 0);
            [self setContentOffset:CGPointMake(0, 0)];
            [self autoToScroll];
        }
        else
        {
            self.firstLabel.x = (self.width - self.firstLabel.width) / 2;
            self.secondLabel.hidden = YES;
        }
        self.setted = YES;
    }
}


@end
