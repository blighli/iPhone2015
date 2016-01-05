//
//  SecondViewController.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SecondViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UITableView *table;

@property (nonatomic, strong) NSMutableArray *array;
@end
