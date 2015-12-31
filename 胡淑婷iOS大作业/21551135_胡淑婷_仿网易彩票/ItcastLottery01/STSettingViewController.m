//
//  STSettingViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/27.
//  Copyright © 2015年 HST. All rights reserved.
//设置控制器

#import "STSettingViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingSwitchItem.h"
#import "STSettingGroup.h"
#import "STSettingCell.h"
#import "MBProgressHUD+MJ.h"
#import "STProductViewController.h"
#import "STPushNoticeViewController.h"
#import "STHelpViewController.h"
#import "STShareViewController.h"
#import "STAboutViewController.h"

@interface STSettingViewController()

@end

@implementation STSettingViewController

/**
 第0组数据
 */
-(void)setupGroup0
{
    STSettingItem *pushNotice=[STSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" destVcClass:[STPushNoticeViewController class]];
    STSettingItem *handShake=[STSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇"];
    STSettingItem *soundEffect=[STSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"摇声音效果"];
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[pushNotice,handShake,soundEffect];
    [self.data addObject:group];
}
/**
 第1组数据
 */
-(void)setupGroup1
{
    STSettingItem *update=[STSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.option=^{
        //弹框提示
        [MBProgressHUD showMessage:@"正在拼命检查……"];
        
#warning 发送网络请求
        
        //几秒后消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //移除HUD
            [MBProgressHUD hideHUD];
            
            //提醒没有新版本
            [MBProgressHUD showError:@"没有新版本"];
        });
    };
    
    STSettingItem *help=[STSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" destVcClass:[STHelpViewController class]];
    STSettingItem *share=[STSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" destVcClass:[STShareViewController class]];
    STSettingItem *viewMsg=[STSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" destVcClass:[STPushNoticeViewController class]];
    
    __weak typeof(self)selfVc=self;
    viewMsg.option=^{
        NSLog(@"%@",selfVc.tableView.subviews);
    };
    
    STSettingItem *product=[STSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" destVcClass:[STProductViewController class]];
    STSettingItem *about=[STSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" destVcClass:[STAboutViewController class]];
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[update,help,share,viewMsg,product,about];
    [self.data addObject:group];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.标题
    self.title=@"设置";
    
    //2.添加数据
    [self setupGroup0];
    [self setupGroup1];
    
}
@end
