//
//  JYStatusToolbar.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/25.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYStatusToolbar.h"



@implementation JYStatusToolbar

//调用init方法就会调用initWithFrame方法
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.userInteractionEnabled=YES;
        //1.设置图片
        //self.image=[self resizedImageWithName:@"timeline_card_bottom_background"];
        //self.highlightedImage=[self resizedImageWithName:@"timeline_card_bottom_background_highlighted"];
        
        //2.添加按钮
        [self setupBtnWithTitle:@"转发" image:@"timeline_icon_retweet" bgImage:@"timeline_card_leftbottom_highlighted"];
        [self setupBtnWithTitle:@"评论" image:@"timeline_icon_comment" bgImage:@"timeline_card_middlebottom_highlighted"];
        [self setupBtnWithTitle:@"赞" image:@"timeline_icon_unlike" bgImage:@"timeline_card_rightbottom_highlighted"];
        
//        UIView *view=[[UIView alloc]init];
//        view.backgroundColor=[UIColor grayColor];
//        [self addSubview:view];
    }
    return self;
}

-(void)setupBtnWithTitle:(NSString *)title image:(NSString *)image bgImage:(NSString *)bgImage
{
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:[self resizedImageWithName:bgImage] forState:UIControlStateHighlighted];
    btn.titleLabel.font=[UIFont systemFontOfSize:13];
    btn.titleEdgeInsets=UIEdgeInsetsMake(0, 5, 0, 0);
    btn.adjustsImageWhenHighlighted=NO;
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:btn];
}

//在这里设置尺寸
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnY=0;
    CGFloat btnW=self.frame.size.width/self.subviews.count;
    CGFloat btnH=self.frame.size.height;
    for (int i=0; i<self.subviews.count; i++)
    {
        UIButton *btn=self.subviews[i];
        CGFloat btnX=btnW*i;
        btn.frame=CGRectMake(btnX, btnY, btnW, btnH);
    }
    
}
-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
