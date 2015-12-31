//
//  MianCollectionViewCell.m
//  美团
//
//  Created by 陈受恩 on 15/12/14.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "MianCollectionViewCell.h"
#import "deal Model.h"
#import "UIImageView+WebCache.h"
@interface MianCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *salesNumLabel;

@end
@implementation MianCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dealcell"]];
}


-(void)showUIWithModel:(deal_Model*)model{
    self.titleLabel.text=model.title;
    self.detailLabel.text=model.Description;
    self.priceLabel.text=model.current_price;
    self.oldPriceLabel.text=model.list_price;
    self.salesNumLabel.text=model.purchase_count;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
}

@end
