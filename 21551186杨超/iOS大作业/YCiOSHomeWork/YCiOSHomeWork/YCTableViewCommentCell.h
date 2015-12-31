//
//  YCTableViewCommentCell.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/15.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YCCommentFrame;

@interface YCTableViewCommentCell : UITableViewCell
@property (nonatomic,strong) YCCommentFrame *commentFrame;
+ (instancetype)tableViewCommentCellWithTableView:(UITableView *)tableView;
@end
