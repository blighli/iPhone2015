//
//  STAwardPushViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STAwardPushViewController.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"

@interface STAwardPushViewController ()

@end

@implementation STAwardPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STSettingItem *ball=[STSettingSwitchItem itemWithTitle:@"双色球"];
    STSettingItem *letou=[STSettingSwitchItem itemWithTitle:@"大乐透"];
    
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[ball,letou];
    group.header=@"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    [self.data addObject:group];
}



@end
