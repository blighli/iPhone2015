//
//  ALZArticleHeaderView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticleHeaderView.h"
#import "ALBannerView.h"
#import <UIImageView+AFNetworking.h>
#import "ArticleDetail.h"

@interface ALZArticleHeaderView ()

@property (strong, nonatomic) ALBannerView *bannerView;

@end

@implementation ALZArticleHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bannerView];
        kWeakSelf(weakSelf);
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf);
        }];
    }
    return self;
}

- (void)bindDataWithModel:(ALZArticleHeaderViewModel *)model{
    [self.bannerView.imageView setImageWithURL:model.imageURL];
    self.bannerView.titleLabel.text = model.title;
    self.bannerView.detailLabel.text = model.imageSource;
}

#pragma makr - Getter and Setter
- (ALBannerView *)bannerView{
    if (!_bannerView) {
        _bannerView = [ALBannerView new];
    }
    return _bannerView;
}

@end
