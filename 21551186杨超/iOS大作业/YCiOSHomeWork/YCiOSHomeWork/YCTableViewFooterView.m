//
//  YCTableViewFooterView.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCTableViewFooterView.h"

@interface YCTableViewFooterView ()
@property (weak, nonatomic) IBOutlet UIButton *btnLoadNextPage;
- (IBAction)btnLoadNextPage:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *viewLoading;

@end

@implementation YCTableViewFooterView

//从xib中加载tableViewFooterView
+ (instancetype)tableViewFooterView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YCTableViewFooterView" owner:nil options:nil] lastObject];
}

//点击加载下一页，下一页在另一个viewController中，因此需要代理方法
- (IBAction)btnLoadNextPage:(id)sender {
    self.btnLoadNextPage.hidden = YES;
    self.viewLoading.hidden = NO;

    //等待一秒钟之后执行
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(postNextPage)]) {
            [self.delegate postNextPage];
        }
        self.btnLoadNextPage.hidden = NO;
        self.viewLoading.hidden = YES;
    });
    
}
@end
