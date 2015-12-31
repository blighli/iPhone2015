//
//  YTHelpViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/29.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTHelpViewController.h"
#import "YTSettingItem.h"
#import "YTSettingGroup.h"
@interface YTHelpViewController ()

@end

@implementation YTHelpViewController

- (void)setupGroup
{
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectZero;
    [self.view addSubview:webView];
    
    // 数据
//    YTSettingItem *mark = [YTSettingItem itemWithTitle:@"评分支持" destVcClass:nil];
//    mark.option = ^{
//        NSString* appid = @"725296055";
//        NSString *str = [NSString stringWithFormat:@"itm-apps://itunes.apple.com/cn/app/id%@?mt=8",appid];
//        
//        NSURL *url = [NSURL URLWithString:str];
//        [[UIApplication sharedApplication] openURL:url];
//    };
    YTSettingItem *call = [YTSettingItem itemWithTitle:@"技术支持电话" destVcClass:nil];
    call.subtitle = @"18842608965";
    call.option = ^{
        NSURL *url = [NSURL URLWithString:@"tel://18842608965"];
        
        [webView loadRequest:[NSURLRequest requestWithURL:url]];
    };
    
    YTSettingGroup *group = [[YTSettingGroup alloc] init];
    group.items = @[call];
    [self.data addObject:group];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupGroup];
}

@end
