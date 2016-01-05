//
//  MainView.m
//  PoseCamera
//
//  Created by YXQ on 15/12/20.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQPicturesShowView.h"
#import "YXQConstant.h"
#import "YXQNavTabController.h"
#import "YXQWaterFall.h"

@interface YXQPicturesShowView ()<UIScrollViewDelegate>

@end

@implementation YXQPicturesShowView

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    YXQWaterFall *zp = [[YXQWaterFall alloc] init];
    zp.title = @"自拍";
    zp.cellContents = @[@"zp1_v_small.jpg", @"zp2_h_small.jpg", @"zp3_h_small.jpg", @"zp4_v_small.jpg",@"zp5_v_small.jpg", @"zp6_h_small.jpg", @"zp7_v_small.jpg", @"zp8_v_small.jpg"];
    zp.cellSizes = @[
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)]
                     ];
    [zp setTabTitle:zipai];
    
    YXQWaterFall *wy = [[YXQWaterFall alloc] init];
    wy.title = @"文艺";
    wy.cellContents = @[@"wy1_v_small.jpg", @"wy2_h_small.jpg", @"wy3_h_small.jpg", @"wy4_v_small.jpg",@"wy5_v_small.jpg", @"wy6_h_small.jpg", @"wy7_h_small.jpg", @"wy8_v_small.jpg", @"wy9_v_small.jpg",@"wy10_h_small.jpg", @"wy11_h_small.jpg", @"wy12_v_small.jpg", @"wy13_v_small.jpg", @"wy14_h_small.jpg",@"wy15_h_small.jpg", @"wy16_h_small.jpg", @"wy17_h_small.jpg", @"wy18_h_small.jpg",@"wy19_h_small.jpg", @"wy20_h_small.jpg", @"wy21_h_small.jpg"];
    wy.cellSizes = @[
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)]
                     ];
    [wy setTabTitle:wenyi];
    
    YXQWaterFall *cy = [[YXQWaterFall alloc] init];
    cy.title = @"创意";
    cy.cellContents = @[@"cy1_h_small.jpg", @"cy2_v_small.jpg", @"cy3_v_small.jpg", @"cy4_h_small.jpg",@"cy5_h_small.jpg", @"cy6_v_small.jpg", @"cy7_v_small.jpg", @"cy8_h_small.jpg", @"cy9_v_small.jpg"];
    cy.cellSizes = @[
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)]
                     ];
    [cy setTabTitle:chuangyi];
    
    YXQWaterFall *jp = [[YXQWaterFall alloc] init];
    jp.title = @"街拍";
    jp.cellContents = @[@"jp1_h_small.jpg", @"jp2_v_small.jpg", @"jp3_v_small.jpg", @"jp4_h_small.jpg",@"jp5_v_small.jpg", @"jp6_v_small.jpg", @"jp7_v_small.jpg", @"jp8_v_small.jpg", @"jp9_v_small.jpg", @"jp10_v_small.jpg"];
    jp.cellSizes = @[
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)]
                     ];
    [jp setTabTitle:jiepai];
    
    YXQWaterFall *ys = [[YXQWaterFall alloc] init];
    ys.title = @"影视";
    ys.cellContents = @[@"ys1_h_small.jpg", @"ys2_v_small.jpg", @"ys3_v_small.jpg", @"ys4_h_small.jpg",@"ys5_v_small.jpg", @"ys6_v_small.jpg", @"ys7_v_small.jpg", @"ys8_v_small.jpg", @"ys9_v_small.jpg",@"ys10_v_small.jpg", @"ys11_v_small.jpg", @"ys12_v_small.jpg", @"ys13_v_small.jpg", @"ys14_v_small.jpg",@"ys15_v_small.jpg", @"ys16_v_small.jpg", @"ys17_v_small.jpg", @"ys18_v_small.jpg",@"ys19_v_small.jpg"];
    ys.cellSizes = @[
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(300, 225)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)],
                     [NSValue valueWithCGSize:CGSizeMake(225, 300)]
                     ];
    [ys setTabTitle:yingshi];
    
    YXQNavTabController *navTabController = [[YXQNavTabController alloc] init];
    navTabController.subViewControllers = @[zp, wy, cy, jp, ys];
    navTabController.mainViewBounces = YES;
    navTabController.selectedToIndex = TABITEMSNUM;
    [navTabController addParentController:self];
}

@end
