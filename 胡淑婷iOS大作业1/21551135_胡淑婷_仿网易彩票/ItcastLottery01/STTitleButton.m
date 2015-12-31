//
//  STTitleButton.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/26.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STTitleButton.h"

#import <Availability.h>

@interface STTitleButton()

@property(nonatomic,strong)UIFont *titleFont;

@end
@implementation STTitleButton
/**
 当一个对象从xib或stroyboard中加载完毕后，就会调用一次
 */
//-(void)awakeFromNib
//{
//    [self setup];
//}

/**
 从文件中解析一个对象的时候就会调用这个方法
 */
-(id)initWithCoder:(NSCoder *)decoder
{
    if (self=[super initWithCoder:decoder]) {
        [self setup];
    }
    return self;
}
/**
 通过代码创建控件时会调用
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
/**
 初始化
 */
-(void)setup
{
    self.titleFont=[UIFont systemFontOfSize:14];
    self.titleLabel.font=self.titleFont;
    
    //图标居中
    self.imageView.contentMode=UIViewContentModeCenter;
}

/**
 控制器内部lable的frame
 */
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX=0;
    CGFloat titleY=0;
    NSDictionary *attrs=@{NSFontAttributeName:self.titleFont};
    CGFloat titleW;
    if([[UIDevice currentDevice].systemVersion doubleValue]>=7.0){
#ifdef __IPHONE_7_0
        titleW=[self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:
                NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
#else
        titleW=[self.currentTitle sizeWithFont:self.titleFont].width;
#endif
    }else{
        titleW=[self.currentTitle sizeWithFont:self.titleFont].width;
    }
    CGFloat titleH=contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
/**
 控制器内部imageView的frame
 */
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=30;
    CGFloat imageX=contentRect.size.width-imageW;
    CGFloat imageY=0;
    CGFloat imageH=contentRect.size.height;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}
@end
