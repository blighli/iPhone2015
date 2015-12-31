//
//  NewsViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/29.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "NewsViewController.h"
#import "UIBarButtonItem+WB.h"


@interface NewsViewController ()
@property (nonatomic, weak) UIWebView *webView;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"icon_back" target:self action:@selector(Canccel)];
    self.navigationController.navigationBarHidden=NO;
    // 添加webview
    [self setupWebview];
    // 加载网页
    [self loadWebViewUrl:self.url];
    
}
// 添加webview
- (void)setupWebview
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.bounds;
    [self.view addSubview:webView];
    self.webView = webView;
}
// 加载网页
- (void)loadWebViewUrl:(NSString *)strUrl
{
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}
// 后退
- (void)Canccel
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)dealloc
{
    // 释放webview内存
    [self.webView loadHTMLString:@"" baseURL:nil];
    [self.webView stopLoading];
    self.webView.delegate = nil;
    [self.webView removeFromSuperview];
    self.webView = nil;
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
