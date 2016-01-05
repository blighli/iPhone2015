//
//  STPushNoticeViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//设置控制器

#import "STPushNoticeViewController.h"
#import "STSettingViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"
#import "MBProgressHUD+MJ.h"
#import "STProductViewController.h"
#import "STAwardPushViewController.h"
#import "STAwardAnimViewController.h"
#import "STScoreTimeViewController.h"
#import "STGouCaiViewController.h"

@interface STPushNoticeViewController()

@end
@implementation STPushNoticeViewController

/**
 第0组数据
 */
-(void)setupGroup0
{
    STSettingItem *pushNotice=[STSettingArrowItem itemWithTitle:@"开奖号码推送" destVcClass:[STAwardPushViewController class]];
    STSettingItem *pushNotice1=[STSettingArrowItem itemWithTitle:@"中奖动画" destVcClass:[STAwardAnimViewController class]];
    STSettingItem *pushNotice2=[STSettingArrowItem itemWithTitle:@"比分直播提醒" destVcClass:[STScoreTimeViewController class]];
    STSettingItem *pushNotice3=[STSettingArrowItem itemWithTitle:@"购彩定时提醒" destVcClass:[STGouCaiViewController class]];
    
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[pushNotice,pushNotice1,pushNotice2,pushNotice3];
    [self.data addObject:group];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGroup0];
}
@end
