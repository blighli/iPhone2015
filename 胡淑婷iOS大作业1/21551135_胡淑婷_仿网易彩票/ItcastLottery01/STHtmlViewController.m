//
//  STHtmlViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STHtmlViewController.h"
#import "STHtml.h"

@interface STHtmlViewController ()<UIWebViewDelegate>

@end

@implementation STHtmlViewController

-(void)loadView
{
    self.view=[[UIWebView alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题
    self.title=self.html.title;
    
    UIWebView *webView=(UIWebView *)self.view;
    webView.delegate=self;
    
    //创建URL
    NSURL *url=[[NSBundle mainBundle]URLForResource:self.html.html withExtension:nil];
    
    //创建请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //发送请求加载网页
    [webView loadRequest:request];
    
    //设置左上角的关闭按钮
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}

-(void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//网页加载完毕的时候调用
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //跳到id对应的网页标签
    
    //1.拼接JavaScript代码
    NSString *js=[NSString stringWithFormat:@"window.location.href='#%@';",self.html.ID];
    //2.执行JavaScript代码
    [webView stringByEvaluatingJavaScriptFromString:js];
}
@end
