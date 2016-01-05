//
//  SXDetailController.h
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXNewsModel.h"

@interface SXDetailController : UIViewController

@property(nonatomic,strong) SXNewsModel *newsModel;

@property (nonatomic,assign) NSInteger index;


@end
