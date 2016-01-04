//
//  ALZArticleViewController.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticleViewController.h"
#import "ALZArticleHeaderView.h"
#import "ALZArticleDetailViewModel.h"
#import "ALWebViewController.h"
#import <MBProgressHUD.h>
#import <WebKit/WebKit.h>
#import "ALZWebImageView.h"

@interface ALZArticleViewController () <WKNavigationDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIView *statusView;
@property (strong, nonatomic) ALZArticleHeaderView *headerView;
@property (strong, nonatomic) WKWebView *webView;
@property (strong, nonatomic) ALZArticleDetailViewModel *viewModel;
@property (assign, nonatomic) BOOL complected;
@property (strong, nonatomic) ALZWebImageView *webImageView;

@end

@implementation ALZArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kWeakSelf(weakSelf);
    
    [self.view addSubview:self.webView];
    [self.webView.scrollView addSubview:self.headerView];
    [self.view addSubview:self.statusView];
    [self.view addSubview:self.webImageView];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.viewModel loadContentWithCallBack:^(NSError *error) {
        [hud hide:YES];
        if (!error) {
            [weakSelf.headerView bindDataWithModel:weakSelf.viewModel.headerViewModel];
            [weakSelf.webView loadHTMLString:weakSelf.viewModel.htmlString baseURL:nil];
        }
    }];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)dealloc{
    self.webView.scrollView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 200) {
        self.statusView.hidden = NO;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    }else{
        self.statusView.hidden = YES;
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    self.complected = YES;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if (self.complected) {
        decisionHandler(WKNavigationActionPolicyCancel);
        ALWebViewController *webVC = [[ALWebViewController alloc] initWithURL:navigationAction.request.URL];
        webVC.tintColor = [UIColor colorWithRed:1/255.0 green:131/255.0 blue:209/255.0 alpha:1];
        [self.navigationController pushViewController:webVC animated:YES];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - UIGestureRecognizerDelegate
- (void)handleSingleTapInWebView:(UITapGestureRecognizer *)sender{
    CGPoint point =[sender locationInView:self.webView];
    
    NSString *strImgUrl = [NSString stringWithFormat:@"document.elementFromPoint(%f,%f).src;",point.x,point.y - 20];
    kWeakSelf(weakSelf);
    
    [self.webView evaluateJavaScript:strImgUrl completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        if (response) {
            weakSelf.webImageView.hidden = NO;
            [weakSelf.webImageView setImageWithUrl:response];
        }
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark - Getter and Setter
- (ALZArticleHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[ALZArticleHeaderView alloc] initWithHeigh:200];
        _headerView.autoSetInset = NO;
    }
    return _headerView;
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        _webView.scrollView.delegate = self;
        
        UITapGestureRecognizer *webTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapInWebView:)];
        webTap.delegate = self;
        [_webView.scrollView addGestureRecognizer:webTap];
    }
    return _webView;
}

- (ALZArticleDetailViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [ALZArticleDetailViewModel viewModelWithID:self.ID];
    }
    return _viewModel;
}

- (UIView *)statusView{
    if (!_statusView) {
        _statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
        _statusView.backgroundColor = [UIColor whiteColor];
        _statusView.hidden = YES;
    }
    return _statusView;
}

- (ALZWebImageView *)webImageView{
    if (!_webImageView) {
        _webImageView = [[ALZWebImageView alloc] initWithFrame:self.view.frame];
        _webImageView.hidden = YES;
    }
    return _webImageView;
}

@end
