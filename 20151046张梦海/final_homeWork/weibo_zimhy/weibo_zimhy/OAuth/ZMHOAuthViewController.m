//
//  ZMHOAuthViewController.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/29.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHOAuthViewController.h"
#import "ZMHAccountTool.h"
#import "MBProgressHUD+MJ.h"
#import "ZMHTableViewController.h"
#import "CONFIG.h"
@interface ZMHOAuthViewController()<UIWebViewDelegate>
@end

@implementation ZMHOAuthViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 展示登陆的网页 -> UIWebView
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    // 加载网页
    
    // 一个完整的URL:基本URL + 参数
    // https://api.weibo.com/oauth2/authorize?client_id=&redirect_uri=
    
    
    // 拼接URL字符串
    NSString *urlStr = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@",ZMHAuthorizeBaseUrl,ZMHClient_id,ZMHRedirect_uri];
    
    // 创建URL
    NSURL *url = [NSURL URLWithString:urlStr];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 加载请求
    [webView loadRequest:request];
    
    // 设置代理
    webView.delegate = self;
    
}

#pragma mark -UIWebView代理
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    // 提示用户正在加载...
    [MBProgressHUD showMessage:@"正在加载..."];
}

// webview加载完成的时候调用
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

//  webview加载失败的时候调用
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

// 拦截webView请求
// 当Webview需要加载一个请求的时候，就会调用这个方法，询问下是否请求
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    
    // 获取code(RequestToken)
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) { // 有code=
        
        // code=81524df3190ea6e58e33c9a0eba1ac56
        // 0 + length
        
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        // 换取accessToken
        [self accessTokenWithCode:code];
        
        // 不会去加载回调界面
        return NO;
        
    }
    
    return YES;
}
/*
 
 必选	类型及范围	说明
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为authorization_code时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
 
 */
#pragma mark - 换取accessToken
- (void)accessTokenWithCode:(NSString *)code
{
    [ZMHAccountTool accountWithCode:code success:^{
        [UIApplication sharedApplication].keyWindow.rootViewController = [[ZMHTableViewController alloc] init ];
        
        // 进入主页或者新特性,选择窗口的根控制器
    } failure:^(NSError *error) {
        
    }];
    
}



@end
