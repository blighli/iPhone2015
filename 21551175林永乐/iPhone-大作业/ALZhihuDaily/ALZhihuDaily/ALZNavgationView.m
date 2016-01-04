//
//  ALZNavgationView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/4.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZNavgationView.h"

@interface ALZNavgationView ()

@end

@implementation ALZNavgationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1/255.0 green:131/255.0 blue:209/255.0 alpha:0];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.menuButton];
        [self addSubview:self.loadCircleView];
        [self addSubview:self.loadingView];
        
        [self setupSubViewConstrains];
    }
    return self;
    
}

- (void)setupSubViewConstrains{
    kWeakSelf(weakSelf);
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    
    [self.menuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf).offset(10);
        make.left.equalTo(weakSelf);
    }];
    
    [self.loadCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.titleLabel.mas_centerY);
        make.right.equalTo(weakSelf.titleLabel.mas_left).offset(-20);
        make.width.mas_equalTo(15);
        make.height.mas_equalTo(15);
    }];
    
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.loadCircleView.mas_centerY);
        make.right.equalTo(weakSelf.loadCircleView.mas_right);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
    }];
}

- (void)menuButtonClick:(UIButton *)sender{
    if (self.buttonCallBack) {
        self.buttonCallBack(sender);
    }
}

#pragma mark - Interface
- (void)loading:(LoadingBlock)loadingBlock{
    self.loadCircleView.hidden = YES;
    self.loadCircleView.current = @0;
    [self.loadingView startAnimating];
    loadingBlock();
}

- (void)endLoading{
    [self.loadingView stopAnimating];
}

- (void)updateStateWithOffset:(CGFloat)contentOffset{
    CGFloat percentage = contentOffset / 136.0;
    percentage = MAX(0, percentage);
    percentage = MIN(1, percentage);
    self.backgroundColor = [UIColor colorWithRed:1/255.0 green:131/255.0 blue:209/255.0 alpha:percentage];
    
    if (contentOffset < -20.0) {
        contentOffset = -contentOffset;
        CGFloat ration = (contentOffset - 20.0) / 50.0 * 100;
        [self.loadCircleView updateChartByCurrent:MIN(@100, [NSNumber numberWithFloat:ration])];
    }
}

#pragma mark - Getter and Setter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIButton *)menuButton{
    if (!_menuButton) {
        _menuButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_menuButton setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
        [_menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _menuButton.tintColor = [UIColor whiteColor];
    }
    return _menuButton;
}

- (PNCircleChart *)loadCircleView{
    if (!_loadCircleView) {
        _loadCircleView = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 0, 15, 15) total:@100 current:@0 clockwise:YES shadow:NO shadowColor:nil displayCountingLabel:NO overrideLineWidth:@1];
        _loadCircleView.backgroundColor = [UIColor clearColor];
        _loadCircleView.strokeColor = [UIColor whiteColor];
        [_loadCircleView strokeChart];
        _loadCircleView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    return _loadCircleView;
}

- (UIActivityIndicatorView *)loadingView{
    if (!_loadingView) {
        _loadingView = [UIActivityIndicatorView new];
    }
    return _loadingView;
}

@end
