//
//  STAwardCell.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STAwardCell.h"

@implementation STAwardCell

- (void)awakeFromNib {
    // Initialization code
}
+(instancetype)initWithAwardCell
{
    STAwardCell *awardCell=[[[NSBundle mainBundle]loadNibNamed:@"STAwardCell" owner:nil options:nil] lastObject];
    
    [awardCell setup];
    return awardCell;
}

-(void)setup
{
    self.ballView.image=[UIImage imageNamed:@"smallball"];
    self.title.text=@"大乐透";
    self.desc.text=@"第2015期 2015-01-01";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
