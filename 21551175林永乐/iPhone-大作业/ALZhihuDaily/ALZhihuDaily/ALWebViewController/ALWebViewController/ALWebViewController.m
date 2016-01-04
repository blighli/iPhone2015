//
//  ALWebViewController.m
//  ALWebViewExample
//
//  Created by alezai on 15/12/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "ALWebViewController.h"
#import "ALWebViewToolbar.h"
#import <WebKit/WebKit.h>

@interface ALWebViewController () <WKNavigationDelegate, ALWebViewToolbarDelegate>

@property (strong, nonatomic) WKWebView *webView;
@property (strong, readwrite, nonatomic) UIProgressView *progressView;
@property (strong, nonatomic) NSLayoutConstraint *navBarHeightConstraint;
@property (strong, nonatomic) ALWebViewToolbar *toolbarContainer;
@property (strong, nonatomic) NSLayoutConstraint *toolbarHeightConstraint;
@property (strong, nonatomic) UILabel *errorMsg;

@end

@implementation ALWebViewController

- (instancetype)initWithURL:(NSURL *)url{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.navigationController.navigationBar.hidden) {
        self.navigationController.navigationBar.hidden = NO;
    }
    
    [self.view addSubview:self.webView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView" : self.webView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView" : self.webView}]];
    
    
    [self.view addSubview:self.progressView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[progressView]-0-|" options:0 metrics:nil views:@{@"progressView" : self.progressView}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-0-[progressView(2)]" options:0 metrics:nil views:@{@"topGuide" : self.topLayoutGuide, @"progressView" : self.progressView}]];
    
    
    [self.view addSubview:self.toolbarContainer];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[toolbarContainer]-0-|" options:0 metrics:nil views:@{@"toolbarContainer" : self.toolbarContainer}]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[toolbarContainer]-0-|" options:0 metrics:nil views:@{@"toolbarContainer" : self.toolbarContainer}]];
    self.toolbarHeightConstraint = [NSLayoutConstraint constraintWithItem:self.toolbarContainer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:44];
    [self.toolbarContainer addConstraint:self.toolbarHeightConstraint];

    [self loadWebContent];
}

- (void)loadWebContent{
    if (self.url) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
        return;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"URL" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"URL"];

}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [self showLoading];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self stopLoading];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
    [self stopLoading];
    
    if (error.code == NSURLErrorCancelled) {
        return;
    }
    
    [self showError:error];
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [self stopLoading];
    
    if (error.code == NSURLErrorCancelled) {
        return;
    }
    
    [self showError:error];
}

#pragma mark - ALWebViewToolbarDelegate
- (void)webViewToolbarGoBack:(ALWebViewToolbar *)toolbar{
    [self.webView goBack];
}

- (void)webViewToolbarGoForward:(ALWebViewToolbar *)toolbar{
    [self.webView goForward];
}

- (void)webViewToolbarRefresh:(ALWebViewToolbar *)toolbar{
    if (!self.webView.URL) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
    }else{
        [self.webView reload];
    }
}

- (void)webViewToolbarStop:(ALWebViewToolbar *)toolbar{
    [self.webView stopLoading];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if([change[NSKeyValueChangeNewKey] isKindOfClass:[NSNumber class]]) {
            [self progressChanged:change[NSKeyValueChangeNewKey]];
        }
    }else if ([keyPath isEqualToString:@"canGoBack"]){
        self.toolbarContainer.backButtonItem.enabled = self.webView.canGoBack;
        if (self.navigationController) {
            self.navigationController.interactivePopGestureRecognizer.enabled = !self.webView.canGoBack;
        }
        
    }else if ([keyPath isEqualToString:@"canGoForward"]){
        self.toolbarContainer.forwardButtonItem.enabled = self.webView.canGoForward;
        
    }else if ([keyPath isEqualToString:@"URL"]){
        
        
    }
}

#pragma mark - Private
- (void)showLoading{
    if (self.errorMsg) {
        [self.errorMsg removeFromSuperview];
        self.errorMsg = nil;
    }
    [self progressChanged:@0.2];
    [self.toolbarContainer loadDidStart];
}

- (void)stopLoading{
    [self.toolbarContainer loadDidFinish];
}

- (void)showError:(NSError *)error{
    self.errorMsg.text = error.localizedDescription;
}

- (void)progressChanged:(NSNumber *)newValue{
    self.progressView.progress = newValue.floatValue;
    
    if (self.progressView.progress == 1) {
        self.progressView.progress = 0;
        [UIView animateWithDuration:0.2 animations:^{
            self.progressView.alpha = 0;
        }];
    }else if (self.progressView.alpha == 0){
        [UIView animateWithDuration:0.2 animations:^{
            self.progressView.alpha = 1;
        }];
    }
}

#pragma mark - Getter and Setter
- (WKWebView *)webView{
    if (_webView == nil) {
        _webView = [WKWebView new];
        _webView.translatesAutoresizingMaskIntoConstraints = NO;
        _webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (UIProgressView *)progressView{
    if (_progressView == nil) {
        _progressView = [UIProgressView new];
        _progressView.translatesAutoresizingMaskIntoConstraints = NO;
        _progressView.trackTintColor = [UIColor clearColor];
    }
    return _progressView;
}

- (ALWebViewToolbar *)toolbarContainer{
    if (_toolbarContainer == nil) {
        _toolbarContainer = [ALWebViewToolbar new];
        _toolbarContainer.translatesAutoresizingMaskIntoConstraints = NO;
        _toolbarContainer.delegate = self;
    }
    return _toolbarContainer;
}

- (UILabel *)errorMsg{
    if (_errorMsg == nil) {
        _errorMsg = [UILabel new];
        _errorMsg.translatesAutoresizingMaskIntoConstraints = NO;
        _errorMsg.textAlignment = NSTextAlignmentCenter;
        _errorMsg.numberOfLines = 0;
        [self.webView.scrollView addSubview:_errorMsg];
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        CGFloat width = screenSize.width - 60;
        [_errorMsg addConstraint:[NSLayoutConstraint constraintWithItem:_errorMsg attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:width]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30-[errorMsg]|" options:0 metrics:nil views:@{@"errorMsg" : _errorMsg}]];
        [self.webView.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[errorMsg]" options:0 metrics:nil views:@{@"errorMsg" : _errorMsg}]];
    }
    return _errorMsg;
}

- (void)setAllowsBackForwardNavigationGestures:(BOOL)allowsBackForwardNavigationGestures{
    _allowsBackForwardNavigationGestures = allowsBackForwardNavigationGestures;
    self.webView.allowsBackForwardNavigationGestures = _allowsBackForwardNavigationGestures;
}

- (void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    self.toolbarContainer.toolbarTintColor = _tintColor;
}

@end
