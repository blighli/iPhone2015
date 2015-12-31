//
//  STScoreTimeViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STScoreTimeViewController.h"
#import "STSettingLabelItem.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"

@interface STScoreTimeViewController ()

@end

@implementation STScoreTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //0组
    STSettingItem *notice=[STSettingSwitchItem itemWithTitle:@"提醒我关注的比赛"];
    
    STSettingGroup *group0=[[STSettingGroup alloc]init];
    group0.items=@[notice];
    group0.footer=@"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    [self.data addObject:group0];
    
    //1组
    STSettingItem *startTime=[STSettingLabelItem itemWithTitle:@"起始时间"];
    
    STSettingGroup *group1=[[STSettingGroup alloc]init];
    group1.items=@[startTime];
    group1.header=@"只在以下时间接受比分直播";
    [self.data addObject:group1];
    
    //2组
    STSettingItem *endTime=[STSettingLabelItem itemWithTitle:@"结束时间"];
    
    STSettingGroup *group2=[[STSettingGroup alloc]init];
    group2.items=@[endTime];
    [self.data addObject:group2];
}



@end
