//
//  STAwardAnimViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STAwardAnimViewController.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"

@interface STAwardAnimViewController ()

@end

@implementation STAwardAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    STSettingItem *anim=[STSettingSwitchItem itemWithTitle:@"中奖动画"];
    
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[anim];
    group.header=@"当您有新中奖订单，启动程序时通过动画提醒您，为避免过于频繁，高频彩不会提醒";
    [self.data addObject:group];
}


@end
