//
//  JYSearchBar.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/19.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYSearchBar.h"

@implementation JYSearchBar
+(instancetype)searchBar
{
    return [[self alloc]init];
    
}
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        //背景
        self.background=[self resizedImageWithName:@"searchbar_textfield_background"];
        //尺寸
       //self.frame=CGRectMake(0, 0, 300, 30);
        
        //左边的放大镜图标
        UIImageView *iconView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        iconView.frame=CGRectMake(0, 0, 30, 30);
        iconView.contentMode=UIViewContentModeCenter;
        self.leftView=iconView;
        self.leftViewMode=UITextFieldViewModeAlways;
        
        //字体大小
        self.font=[UIFont systemFontOfSize:13];
        //右边的清除按钮
        self.clearButtonMode=UITextFieldViewModeAlways;
        
        //设置提醒文字
        NSMutableDictionary *attrs=[NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName]=[UIColor grayColor];
        //attrs[NSFontAttributeName]=[UIFont systemFontOfSize:16];
        self.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"搜索..." attributes:attrs];
        
        //设置虚拟键盘右下角按钮的样式
        self.returnKeyType=UIReturnKeySearch;
        //当什么内容都不输入的时候,右下角按钮不能用的
        self.enablesReturnKeyAutomatically=YES;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //设置左边图标的frame
    //在layoutSubViews这个方法里才能真正确定高度
    self.leftView.frame=CGRectMake(0, 0, 30, self.frame.size.height);
}
-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
