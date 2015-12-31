//
//  SXTableViewController.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface SXTableViewController : UITableViewController

/**
 *  url端口
 */
@property(nonatomic,copy) NSString *urlString;

@property (nonatomic,assign) NSInteger index;


@end
