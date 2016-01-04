//
//  ALWebViewToolbar.m
//  ALWebViewExample
//
//  Created by alezai on 15/12/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import "ALWebViewToolbar.h"

@interface ALWebViewToolbar ()

@property (strong, readwrite, nonatomic) UIToolbar *toolbar;

@end

@implementation ALWebViewToolbar

#pragma mark - Life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.toolbartranslucent = YES;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self addSubview:self.toolbar];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-0-[toolbar]-0-|" options:0 metrics:nil views:@{@"toolbar" : self.toolbar}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[toolbar]-0-|" options:0 metrics:nil views:@{@"toolbar" : self.toolbar}]];
}

#pragma mark - Inteface
- (void)loadDidStart{
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self.toolbar setItems:@[self.backButtonItem, self.forwardButtonItem, flexibleItem, self.stopButtonItem]];
}

- (void)loadDidFinish{
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self.toolbar setItems:@[self.backButtonItem, self.forwardButtonItem, flexibleItem, self.refreshButtonItem]];
}

#pragma mark - Event response
- (void)goFoward{
    if (self.delegate) {
        [self.delegate webViewToolbarGoForward:self];
    }
}

- (void)goBack{
    if (self.delegate) {
        [self.delegate webViewToolbarGoBack:self];
    }
}

- (void)refresh{
    if (self.delegate) {
        [self.delegate webViewToolbarRefresh:self];
    }
}

- (void)stop{
    if (self.delegate) {
        [self.delegate webViewToolbarStop:self];
    }
}

#pragma mark - Getter and Setter
- (UIToolbar *)toolbar{
    if (_toolbar == nil) {
        _toolbar = [UIToolbar new];
        _toolbar.translatesAutoresizingMaskIntoConstraints = NO;
        _toolbar.translucent = self.toolbartranslucent;
        UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [_toolbar setItems:@[self.backButtonItem, self.forwardButtonItem, flexibleItem, self.refreshButtonItem]];
    }
    return _toolbar;
}

- (UIBarButtonItem *)forwardButtonItem{
    if (_forwardButtonItem == nil) {
        _forwardButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"\U000025B6\U0000FE0E" style:UIBarButtonItemStylePlain target:self action:@selector(goFoward)];
        _forwardButtonItem.enabled = NO;
    }
    return _forwardButtonItem;
}

- (UIBarButtonItem *)backButtonItem{
    if (_backButtonItem == nil) {
        _backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"\U000025C0\U0000FE0E" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
        _backButtonItem.enabled = NO;
    }
    return _backButtonItem;
}

- (UIBarButtonItem *)refreshButtonItem{
    if (_refreshButtonItem == nil) {
        _refreshButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh)];
    }
    return _refreshButtonItem;
}

- (UIBarButtonItem *)stopButtonItem{
    if (_stopButtonItem == nil) {
        _stopButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(stop)];
    }
    return _stopButtonItem;
}

- (void)setToolbartranslucent:(BOOL)toolbartranslucent{
    _toolbartranslucent = toolbartranslucent;
    self.toolbar.translucent = _toolbartranslucent;
}

- (void)setToolbarBackgroundColor:(UIColor *)toolbarBackgroundColor{
    _toolbarBackgroundColor = toolbarBackgroundColor;
    self.toolbar.backgroundColor = _toolbarBackgroundColor;
}

- (void)setToolbarTintColor:(UIColor *)toolbarTintColor{
    _toolbarTintColor = toolbarTintColor;
    self.toolbar.tintColor = _toolbarTintColor;
}

@end
