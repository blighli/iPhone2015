//
//  ALBannerView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALBannerView.h"

@implementation ALBannerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        __weak typeof(self) weakSelf = self;
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        UIView *blackView = [UIView new];
        blackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        [self addSubview:blackView];
        [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf);
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).with.offset(20);
            make.right.equalTo(weakSelf).with.offset(-40);
            make.bottom.equalTo(weakSelf).with.offset(-40);
        }];
        
        self.detailLabel = [UILabel new];
        self.detailLabel.font = [UIFont boldSystemFontOfSize:10];
        self.detailLabel.textAlignment = NSTextAlignmentRight;
        self.detailLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.titleLabel.mas_bottom).with.offset(5);
            make.right.equalTo(weakSelf).with.offset(-20);
            make.bottom.equalTo(weakSelf).with.offset(-5);
        }];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        __weak typeof(self) weakSelf = self;
        self.imageView = [UIImageView new];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf).with.offset(20);
            make.right.equalTo(weakSelf).with.offset(-40);
            make.bottom.equalTo(weakSelf).with.offset(-20);
        }];
    }
    return self;
}

@end
