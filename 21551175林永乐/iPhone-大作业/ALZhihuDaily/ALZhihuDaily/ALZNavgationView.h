//
//  ALZNavgationView.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/4.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PNChart.h>

typedef void(^ButtonCallBack)(UIButton *);
typedef void(^LoadingBlock)();

@interface ALZNavgationView : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *menuButton;
@property (strong, nonatomic) ButtonCallBack buttonCallBack;
@property (strong, nonatomic) UIActivityIndicatorView *loadingView;
@property (strong, nonatomic) PNCircleChart *loadCircleView;

- (void)updateStateWithOffset:(CGFloat)contentOffset;
- (void)loading:(LoadingBlock)loadingBlock;
- (void)endLoading;

@end
