//
//  ZMHStatusCell.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZMHStatusFrame.h"
@class ZMHStatusFrame;

@interface ZMHStatusCell : UITableViewCell
@property (nonatomic, strong) ZMHStatusFrame *statusF;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
