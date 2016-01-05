//
//  YCTableViewHeaderView.m
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import "YCTableViewHeaderView.h"

@interface YCTableViewHeaderView ()

@property (weak, nonatomic) IBOutlet UIButton *btnLoadPrevPost;
@property (weak, nonatomic) IBOutlet UIView *viewLoading;
- (IBAction)btnLoadPrevPost:(id)sender;

@end

@implementation YCTableViewHeaderView

//调用类方法使用xib加载一个headerView
+ (instancetype)tableViewHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YCTableViewHeaderView" owner:nil options:nil] lastObject];
}

- (IBAction)btnLoadPrevPost:(id)sender {
    self.btnLoadPrevPost.hidden = YES;
    self.viewLoading.hidden = NO;
    //等待一秒钟之后执行？
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(postPrevPage)]) {
            [self.delegate postPrevPage];
        }
        self.btnLoadPrevPost.hidden = NO;
        self.viewLoading.hidden = YES;
    });
}
@end
