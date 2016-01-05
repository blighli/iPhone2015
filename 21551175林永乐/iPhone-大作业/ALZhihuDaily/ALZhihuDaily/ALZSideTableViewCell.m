//
//  ALZSideTableViewCell.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZSideTableViewCell.h"

@implementation ALZSideTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:12/255.0 green:19/255.0 blue:25/255.0 alpha:1];
    UIView *selectedView = [[UIView alloc] initWithFrame:self.contentView.frame];
    selectedView.backgroundColor = [UIColor colorWithRed:12/255.0 green:19/255.0 blue:25/255.0 alpha:1];
    self.selectedBackgroundView = selectedView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
