//
//  YTSettingCell.h
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import <UIKit/UIKit.h>
@class YTSettingItem;
@interface YTSettingCell : UITableViewCell

@property (nonatomic, strong)  YTSettingItem* item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
