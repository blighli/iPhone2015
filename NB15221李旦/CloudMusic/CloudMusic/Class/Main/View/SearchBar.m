//
//  SeachBar.m
//  CloudMusic
//
//  Created by LiDan on 15/12/30.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "SearchBar.h"
#import "CloudMusic.pch"

@implementation SearchBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.placeholder = @"请输入搜索条件";
        self.font = [UIFont systemFontOfSize:14];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageNamed:@"cm2_topbar_icn_search"];
        leftView.frame = CGRectMake(0, 0, 40, leftView.image.size.height);
        leftView.contentMode = UIViewContentModeCenter;
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        //设置右边清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.layer.cornerRadius = 4.0f;
        self.tintColor = RGBColor(198,72, 55);
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

@end
