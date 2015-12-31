//
//  STAboutViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/30.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STAboutViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingGroup.h"

@interface STAboutViewController ()
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation STAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame=CGRectZero;
    [self.view addSubview:webView];
    
    //1.具体数据
    STSettingItem *mark=[STSettingArrowItem itemWithTitle:@"评分支持" destVcClass:nil];
    mark.option=^{
        NSString *appid=@"73456";
        NSString *str=[NSString stringWithFormat:@"items-apps://itunes.apple.com/cn/app/id%@?mt=8",appid];
        NSURL *url=[NSURL URLWithString:str];
        
        [[UIApplication sharedApplication]openURL:url];
    };
    
    STSettingItem *call=[STSettingArrowItem itemWithTitle:@"客户电话" destVcClass:nil];
    call.subtitle=@"10010";
    call.option=^{
        NSURL *url=[NSURL URLWithString:@"tel://10010"];
//        [[UIApplication sharedApplication]openURL:url];
        
//        NSURL *url=[NSURL URLWithString:@"telprompt://10010"];
//        [[UIApplication sharedApplication]openURL:url];
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=@[mark,call];
    [self.data addObject:group];
    
    //2.header
    UIImageView *headerView=[[UIImageView alloc]init];
    headerView.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    headerView.image=[UIImage imageNamed:@"aboutHeader"];
    self.tableView.tableHeaderView=headerView;
    
    
}



@end
