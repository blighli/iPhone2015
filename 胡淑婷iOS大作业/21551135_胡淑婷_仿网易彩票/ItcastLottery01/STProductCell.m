//
//  STProductCell.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/28.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STProductCell.h"
#import "STProduct.h"

@interface STProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation STProductCell

-(void)awakeFromNib
{
    self.iconView.layer.cornerRadius=8;
    //self.iconView.clipsToBounds=YES;
}
-(void)setProduct:(STProduct *)product
{
    _product=product;
    
    //1.设置头像
    self.iconView.image=[UIImage imageNamed:product.icon];
    
    //2.设置名称
    self.nameLable.text=product.title;
}
@end
