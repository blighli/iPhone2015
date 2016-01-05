//
//  SortViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/17.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "SortViewController.h"
#import "Sort.h"
#import "UIView+Extension.h"
#import "Cities.h"

@interface SortButton : UIButton
@property (nonatomic, strong) Sort *sort;
@end

@implementation SortButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//        [self setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
//        [self setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateHighlighted];
    }
    return self;
}

- (void)setSort:(Sort *)sort
{
    _sort = sort;
    
    [self setTitle:sort.label forState:UIControlStateNormal];
}
@end

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *sorts = [Cities sorts];
    NSUInteger count = sorts.count;
    CGFloat btnW = 100;
    CGFloat btnH = 30;
    CGFloat btnX = 15;
    CGFloat btnStartY = 15;
    CGFloat btnMargin = 15;
    CGFloat height = 0;
    for (NSUInteger i = 0; i<count; i++) {
        SortButton *button = [[SortButton alloc] init];
        // 传递模型
        button.sort = sorts[i];
        button.width = btnW;
        button.height = btnH;
        button.x = btnX;
        button.y = btnStartY + i * (btnH + btnMargin);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
        height = CGRectGetMaxY(button.frame);
}
    
    // 设置控制器在popover中的尺寸
    CGFloat width = btnW + 2 * btnX;
    height += btnMargin;
    self.preferredContentSize = CGSizeMake(width, height);
}

- (void)buttonClick:(SortButton *)button
{
    // NSLog(@"%@++++",button.sort.label);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sortDidChanged" object:nil userInfo:@{@"sortName" : button.sort}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
