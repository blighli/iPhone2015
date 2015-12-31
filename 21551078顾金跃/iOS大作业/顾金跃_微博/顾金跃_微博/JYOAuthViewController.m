//
//  JYOAuthViewController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/21.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYOAuthViewController.h"
#import "AFNetworking.h"
#import "JYAccount.h"
#import "JYNewFeatureViewController.h"
#import "JYWBTabBarViewController.h"
#import "MBProgressHUD+MJ.h"
@interface JYOAuthViewController ()<UIWebViewDelegate>

@end

@implementation JYOAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.添加WebView
    UIWebView *webView=[[UIWebView alloc]init];
    webView.frame=self.view.bounds;
    webView.delegate=self;
    [self.view addSubview:webView];
    
    //2.加载授权页面
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=62846697&redirect_uri=http://www.163.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


//开始加载，开始发送请求的时候
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //显示提醒框
    [MBProgressHUD showMessage:@"正在载入新浪登录界面..."];
}
//加载完毕
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //关闭提醒框
    [MBProgressHUD hideHUD];
}
//加载失败
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //关闭提醒框
    [MBProgressHUD hideHUD];
}


//WebView代理方法
//当webview发送一个请求之前都会调用这个方法,询问代理可不可以加载这个页面(请求)
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"888888%@",request.URL);
    
    //1.请求的url路径
    NSString *urlStr=request.URL.absoluteString;
        
    //2.查找code＝在urlStr中的范围
    NSRange range=[urlStr rangeOfString:@"code="];
        
    if(range.location!=NSNotFound)
    {
        // NSLog(@"=======%@",urlStr);
        //3.截取code后面的请求标记(经过用户授权成功的)
        long loc=range.location+range.length;
        //不知道为什么返回的地址中有好几个都有code这个标记
        NSString *code=nil;
        if([urlStr substringFromIndex:loc].length>8)
        {
            code=[urlStr substringFromIndex:loc];
            NSLog(@"code-%@",code);
        }
            
        //4.发送POST请求给新浪,通过code换取一个accessToken
        [self accessTokenWithCode:code];
      
    }
    return YES;

}

-(void)accessTokenWithCode:(NSString *)code
{
    //ASI:HTTP终结者(淘汰了)
    //AFN:AFNetworking
    
    //1.创建请求管理对象
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    //说明服务器返回的是json数据
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    
    //2.封装请求参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"]=@"62846697";
    params[@"client_secret"]=@"f408b282e0856ad55936724aac17d56a";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=code;
    params[@"redirect_uri"]=@"http://www.163.com";
    
    //3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        //请求成功
        NSLog(@"请求成功%@",responseObject);
        
        //4.先将字典转为模型
        //这玩意二能让某个应用访问某个用户的数据
       //NSString *accessToken=responseObject[@"access_token"];
        
        JYAccount *account=[JYAccount accountWithDict:responseObject];
        
       //5.存储模型数据
        //归档
        NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *file=[doc stringByAppendingPathComponent:@"account.data"];
        [NSKeyedArchiver archiveRootObject:account toFile:file];
        
        //6.新特性/主页
        
        //1.取出沙盒中上一次使用的版本号
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString *lastVersion=[defaults stringForKey:@"lastVersion"];
        //NSLog(@"我看看上一次的版本号是什么:%@",lastVersion);
        
        //2.获得当前软件的版本号
        //NSLog(@"%@",[NSBundle mainBundle].infoDictionary);
        NSString *currentVersion=[NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
        //NSLog(@"我看看现在的版本号是什么:%@",currentVersion);
        if([currentVersion isEqualToString:lastVersion])
        {
            //显示状态栏
            [UIApplication sharedApplication].statusBarHidden=NO;
            self.view.window.rootViewController=[[JYWBTabBarViewController alloc]init];
        }
        else
        {
            //有新版本
            self.view.window.rootViewController=[[JYNewFeatureViewController alloc]init];
            //存储新版本
            [defaults setObject:currentVersion forKey:@"lastVersion"];
            [defaults synchronize];
        }
        
        //7.隐藏提醒框
        [MBProgressHUD hideHUD];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        //请求失败
        //NSLog(@"请求失败%@",error);
        [MBProgressHUD hideHUD];
    }];

}
@end
