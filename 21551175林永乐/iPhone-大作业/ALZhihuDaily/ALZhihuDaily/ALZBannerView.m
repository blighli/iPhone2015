//
//  ALZBannerView.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZBannerView.h"
#import "ALBannerView.h"
#import "TopArticle.h"
#import <UIImageView+AFNetworking.h>

@interface ALZBannerView () <ALCircleScrollViewDelegate>

@property (strong, nonatomic) NSArray *articlesArray;

@end

@implementation ALZBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (void)bindDataWithViewModel:(id)viewModel{
    self.articlesArray = viewModel;
    [self reloadData];
}

#pragma mark - ALCircleScrollViewDelegate
- (NSUInteger)numberOfViewsInScrollView:(UIScrollView *)scrollView{
    return self.articlesArray.count;
}

- (UIView *)scrollView:(UIScrollView *)scrollView viewAtIndex:(NSUInteger)index{
    TopArticle *article = [self.articlesArray objectAtIndex:index];
    ALBannerView *bannerView = [[ALBannerView alloc] init];
    [bannerView.imageView setImageWithURL:[NSURL URLWithString:article.image]];
    bannerView.titleLabel.text = article.title;
    return bannerView;
}

- (void)scrollView:(UIScrollView *)scrollView didSelectedAtIndex:(NSUInteger)index{
    if (self.TapCallBack) {
        TopArticle *article = self.articlesArray[index];
        self.TapCallBack(article.ID);
    }
}

#pragma mark - Getter and Setter

@end
