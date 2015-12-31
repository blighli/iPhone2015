//
//  STGouCaiViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STGouCaiViewController.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"

@interface STGouCaiViewController ()

@end

@implementation STGouCaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"定时提醒";
    
    STSettingItem *remind=[STSettingSwitchItem itemWithTitle:@"打开提醒"];
    
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[remind];
    group.header=@"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [self.data addObject:group];
}



@end
