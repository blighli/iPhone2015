//
//  ALZBannerView.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALCircleScrollView.h"

typedef void(^ALCircleViewTapCallBack)(NSInteger);

@interface ALZBannerView : ALCircleScrollView

@property (strong, nonatomic) ALCircleViewTapCallBack TapCallBack;

- (void)bindDataWithViewModel:(id)viewModel;

@end
