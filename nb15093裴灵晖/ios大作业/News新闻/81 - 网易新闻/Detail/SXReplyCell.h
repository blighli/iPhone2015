//
//  SXReplyCell.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SXReplyModel.h"

@interface SXReplyCell : UITableViewCell

@property(nonatomic,strong) SXReplyModel *replyModel;
/** 用户的发言 */
@property (weak, nonatomic) IBOutlet UILabel *sayLabel;
@end
