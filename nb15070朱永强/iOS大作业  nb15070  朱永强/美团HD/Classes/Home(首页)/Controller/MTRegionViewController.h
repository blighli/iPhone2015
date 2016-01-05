//
//  MTRegionViewController.h
//  美团HD
//
//  Created by zhuzhu on 15/11/24.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTRegionViewController : UIViewController
@property (nonatomic, strong) NSArray *regions;
@property (nonatomic, weak) UIPopoverController *popover;
@end
