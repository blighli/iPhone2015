//
//  JYTitleButton.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/20.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYTitleButton.h"
#define JYTitleButtonImageW 30
@implementation JYTitleButton

+(instancetype)titleButton
{
    return [[self alloc]init];
}
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        //当高亮的时候不要让图片变灰
        self.adjustsImageWhenHighlighted=NO;
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentRight;
        self.titleLabel.font=[UIFont systemFontOfSize:18];
        //背景
        [self setBackgroundImage:[UIImage imageNamed:@"navigationbar_filter_background_highlighted_os7"] forState:UIControlStateHighlighted];
        //文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY=0;
    CGFloat imageW=JYTitleButtonImageW;
    CGFloat imageX=contentRect.size.width-imageW;
    CGFloat imageH=contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleY=0;
    CGFloat titleW=contentRect.size.width-JYTitleButtonImageW;
    CGFloat titleH=contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
