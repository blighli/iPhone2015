//
//  STBuyCell.h
//  ItcastLottery01
//
//  Created by 123 on 15/12/24.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STBuyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *personView;
@property (weak, nonatomic) IBOutlet UILabel *personDesc;
@property (weak, nonatomic) IBOutlet UILabel *price1;
@property (weak, nonatomic) IBOutlet UILabel *price2;
@property (weak, nonatomic) IBOutlet UILabel *price3;
@property (weak, nonatomic) IBOutlet UILabel *allPrice;
@property (weak, nonatomic) IBOutlet UILabel *p2;
@property (weak, nonatomic) IBOutlet UILabel *p3;

+(instancetype)initWithBuyCell;
@end
