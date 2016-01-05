//
//  YCTableViewCell.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/10.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YCPostFrame;

@interface YCTableViewCell : UITableViewCell
@property (nonatomic,strong) YCPostFrame *postFrame;
+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView;
@end
