//
//  STBuyCell.m
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STBuyCell.h"

@implementation STBuyCell

- (void)awakeFromNib {
    // Initialization code
}
+(instancetype)initWithBuyCell
{
    STBuyCell *buycell=[[[NSBundle mainBundle]loadNibNamed:@"STBuyCell" owner:nil options:nil]lastObject];
    
    [buycell setup];
    
    return buycell;
}

-(void)setup
{
    self.iconView.image=[UIImage imageNamed:@"icon"];
    self.personView.image=[UIImage imageNamed:@"person"];
    self.personDesc.text=@"无谓沉浮哈哈哈";
    self.title.text=@"竞彩足球";
    self.price1.text=@"12元";
    self.allPrice.text=@"总金额";
    self.price2.text=@"0.2元";
    self.p2.text=@"每份";
    self.price3.text=@"1份";
    self.p3.text=@"剩余";
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
