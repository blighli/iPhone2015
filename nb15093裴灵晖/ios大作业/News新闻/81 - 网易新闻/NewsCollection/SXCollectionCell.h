//
//  SXCollectionCell.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXTableViewController.h"

@interface SXCollectionCell : UICollectionViewCell

@property(nonatomic,copy) NSString *urlString;
@property(nonatomic,strong) UINavigationController *nav;
@property(nonatomic,strong) SXTableViewController *TbVc;
@end
