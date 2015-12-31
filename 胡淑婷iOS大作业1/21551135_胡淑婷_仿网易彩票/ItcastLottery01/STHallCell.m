//
//  STHallCell.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STHallCell.h"

@implementation STHallCell

- (void)awakeFromNib {
    // Initialization code
}

+(instancetype)initHallCell
{
    STHallCell *hallcell=[[[NSBundle mainBundle]loadNibNamed:@"STHallCell" owner:nil options:nil]lastObject];
    [hallcell setup];
    
    return hallcell;
}

-(void)setup
{
    self.iconView.image=[UIImage imageNamed:@"shuang"];
    self.title.text=@"双色球";
    self.subtitle.text=@"奖池：180,069,774元";
    self.desc.text=@"距20150101期截止：7天7小时";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
