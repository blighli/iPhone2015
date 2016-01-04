//
//  ALWebViewController.h
//  ALWebViewExample
//
//  Created by alezai on 15/12/18.
//  Copyright © 2015年 alezai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALWebViewController : UIViewController

@property (strong, nonatomic) NSURL *url;

@property (nonatomic) BOOL allowsBackForwardNavigationGestures;

@property (strong, nonatomic) UIColor *tintColor;

- (instancetype)initWithURL:(NSURL *)url;

@end
