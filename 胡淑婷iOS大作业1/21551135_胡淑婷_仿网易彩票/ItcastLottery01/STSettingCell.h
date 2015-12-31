//
//  STSettingCell.h
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//

#import <UIKit/UIKit.h>

@class STSettingItem;

@interface STSettingCell : UITableViewCell

@property(nonatomic,strong)STSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
