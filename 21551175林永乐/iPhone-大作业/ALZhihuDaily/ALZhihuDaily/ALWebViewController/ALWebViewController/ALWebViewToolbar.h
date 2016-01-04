//
//  ALWebViewToolbar.h
//  ALWebViewExample
//
//  Created by alezai on 15/12/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALWebViewToolbar;

@protocol ALWebViewToolbarDelegate <NSObject>

- (void)webViewToolbarGoBack:(ALWebViewToolbar *)toolbar;
- (void)webViewToolbarGoForward:(ALWebViewToolbar *)toolbar;
- (void)webViewToolbarRefresh:(ALWebViewToolbar *)toolbar;
- (void)webViewToolbarStop:(ALWebViewToolbar *)toolbar;

@end

@interface ALWebViewToolbar : UIView

@property (weak, nonatomic) id<ALWebViewToolbarDelegate> delegate;

@property (strong, readonly, nonatomic) UIToolbar *toolbar;

@property (strong, nonatomic) UIColor *toolbarTintColor;

@property (strong, nonatomic) UIColor *toolbarBackgroundColor;

@property (nonatomic, getter=isToolbarTranslucent) BOOL toolbartranslucent;

@property (strong, nonatomic) UIBarButtonItem *forwardButtonItem;

@property (strong, nonatomic) UIBarButtonItem *backButtonItem;

@property (strong, nonatomic) UIBarButtonItem *refreshButtonItem;

@property (strong, nonatomic) UIBarButtonItem *stopButtonItem;


- (void)loadDidStart;
- (void)loadDidFinish;

@end
