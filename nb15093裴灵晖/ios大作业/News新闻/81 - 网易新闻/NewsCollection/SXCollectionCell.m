//
//  SXCollectionCell.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXCollectionCell.h"

@interface SXCollectionCell ()



@end

@implementation SXCollectionCell

- (void)awakeFromNib
{
    // 从sb里取控制器
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.nav = sb.instantiateInitialViewController;
    
    for (UIViewController *vc in self.nav.viewControllers) {
        if ([vc isKindOfClass:[SXTableViewController class]]) {
            self.TbVc = (SXTableViewController *)vc;
        }
    }
    
    [self addSubview:self.nav.view];
    
}

- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    
    self.TbVc.urlString = urlString;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.nav.view.frame = self.bounds;
}

@end
