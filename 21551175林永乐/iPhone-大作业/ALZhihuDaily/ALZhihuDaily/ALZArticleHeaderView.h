//
//  ALZArticleHeaderView.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALHeaderView.h"
#import "ALZArticleHeaderViewModel.h"

@interface ALZArticleHeaderView : ALHeaderView

- (void)bindDataWithModel:(ALZArticleHeaderViewModel *)model;

@end
