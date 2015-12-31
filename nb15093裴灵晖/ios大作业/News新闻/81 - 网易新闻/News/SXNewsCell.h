//
//  SXNewsCell.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXNewsModel.h"

@interface SXNewsCell : UITableViewCell

@property(nonatomic,strong) SXNewsModel *NewsModel;



/**
 *  类方法返回可重用的id
 */
+ (NSString *)idForRow:(SXNewsModel *)NewsModel;

/**
 *  类方法返回行高
 */
+ (CGFloat)heightForRow:(SXNewsModel *)NewsModel;
@end
