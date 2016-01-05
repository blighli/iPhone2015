//
//  JYTabBarButton.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/17.
//  Copyright © 2015年 GJY. All rights reserved.
//

//重写button按钮
#import "JYTabBarButton.h"
#import "JYBadgeButton.h"
@interface JYTabBarButton()
//提醒数字
@property(nonatomic,weak)JYBadgeButton *badgeButton;
@end

@implementation JYTabBarButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.imageView.contentMode=UIViewContentModeCenter;
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.titleLabel.font=[UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
//       [self setBackgroundImage:[UIImage imageNamed:@"tabbar_slider"] forState:UIControlStateSelected];
        
        //添加提醒数字按钮
        JYBadgeButton *badgeButton=[[JYBadgeButton alloc]init];
        
        badgeButton.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton=badgeButton;
        
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*0.6;
    return CGRectMake(0, 0, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY=contentRect.size.height*0.6;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);

}

-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    //设置文字
    [self setTitle:item.title forState:UIControlStateNormal];
    //设置图片
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    //设置提醒数字
    self.badgeButton.badgeValue=self.item.badgeValue;
    //设置位置
    CGFloat badgeY=5;
    CGFloat badgeX=self.frame.size.width-self.badgeButton.frame.size.width-10;
    CGRect badgeF=self.badgeButton.frame;
    badgeF.origin.x=badgeX;
    badgeF.origin.y=badgeY;
    self.badgeButton.frame=badgeF;
//    if(item.badgeValue)
//    {
//        self.badgeButton.hidden=NO;
//        //设置数字
//        [self.badgeButton setTitle:item.badgeValue forState:UIControlStateNormal];
//        CGFloat badgeY=3;
//        CGFloat badgeH=self.badgeButton.currentBackgroundImage.size.height;
//        CGFloat badgeW=self.badgeButton.currentBackgroundImage.size.width;
//        if(item.badgeValue.length>1)
//        {
//            //文字的尺寸
//            CGSize badgeSize=[item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
//            badgeW=badgeSize.width+10;
//        }
//        CGFloat badgeX=self.frame.size.width-badgeW;
//        self.badgeButton.frame=CGRectMake(badgeX, badgeY, badgeW, badgeH);
//
//    }
//    else
//    {
//        self.badgeButton.hidden=YES;
//    }
    
    //KVO 监听属性改变,监听了badgeValue这个属性
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
}

/*
 监听到某个对象的属性改变了,就会调用
 @param keyPath 属性名
 @param keyPath 哪个对象的属性被改变
 @param change  属性发生的改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    //设置提醒数字
    if(self.item.badgeValue)
    {
        self.badgeButton.hidden=NO;
        //设置数字
        [self.badgeButton setTitle:self.item.badgeValue forState:UIControlStateNormal];
        CGFloat badgeY=3;
        CGFloat badgeH=self.badgeButton.currentBackgroundImage.size.height;
        CGFloat badgeW=self.badgeButton.currentBackgroundImage.size.width;
        if(self.item.badgeValue.length>1)
        {
            //文字的尺寸
            CGSize badgeSize=[self.item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
            badgeW=badgeSize.width+10;
        }
        CGFloat badgeX=self.frame.size.width-badgeW;
        self.badgeButton.frame=CGRectMake(badgeX, badgeY, badgeW, badgeH);
        
    }
    else
    {
        self.badgeButton.hidden=YES;
    }

}

-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue" ];
    [self.item removeObserver:self forKeyPath:@"title"];

}

//重写这个方法就可以没有高亮状态了
-(void)setHighlighted:(BOOL)highlighted
{
    
}


@end
