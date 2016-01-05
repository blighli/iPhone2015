//
//  YXQPictureSureView.m
//  PoseCamera
//
//  Created by YXQ on 15/12/30.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQPictureSureView.h"
#import "YXQConstant.h"

@implementation YXQPictureSureView

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:bgColor];
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 125, 80, 250, 250)];
    container.layer.shadowOffset = CGSizeMake(0, 0);
    container.layer.shadowOpacity = 0.8;
    container.layer.shadowRadius = 10.0;
    container.layer.shadowColor = [UIColor blackColor].CGColor;
    container.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:container.bounds cornerRadius:10.0] CGPath];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.layer.cornerRadius = 10;
    imageView.layer.masksToBounds = YES;
    imageView.frame = container.bounds;
    _imgInfo = [YXQImgEntity sharedModel];
    NSString *imageName = @"";
    switch (_imgInfo.tabTitle) {
        case zipai:
            imageName = zipaiYuanArr[_imgInfo.imgIndex];
            break;
        case wenyi:
            imageName = wenyiYuanArr[_imgInfo.imgIndex];
            break;
        case chuangyi:
            imageName = chuangyiYuanArr[_imgInfo.imgIndex];
            break;
        case jiepai:
            imageName = jiepaiYuanArr[_imgInfo.imgIndex];
            break;
        case yingshi:
            imageName = yingshiYuanArr[_imgInfo.imgIndex];
            break;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    [imageView setImage:image];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [container addSubview:imageView];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(SCREEN_WIDTH / 2 - 25, SCREEN_HEIGHT - 150, 50, 50);
    [sureBtn addTarget:self action:@selector(showView:) forControlEvents:UIControlEventTouchUpInside];
    [sureBtn setImage:[UIImage imageNamed:@"sure"] forState:UIControlStateNormal];
    
    [self.view addSubview:container];
    [self.view addSubview:sureBtn];
}

- (void)showView:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
