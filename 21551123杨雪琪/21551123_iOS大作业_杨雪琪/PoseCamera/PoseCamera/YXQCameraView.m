//
//  YXQCameraView.m
//  PoseCamera
//
//  Created by YXQ on 15/12/29.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import "YXQCameraView.h"
#import "YXQPicturesShowView.h"
#import "YXQConstant.h"
#import "YXQImgEntity.h"
#import "UIImage+MyImage.h"

@implementation YXQCameraView

- (void)viewWillAppear:(BOOL)animated {
    //隐藏导航栏
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    YXQImgEntity *imgEntity = [YXQImgEntity sharedModel];
    if (imgEntity.imgIndex == -1) {
        [_changeSlider setHidden:YES];
    }else{
        [_changeSlider setHidden:NO];
        switch (imgEntity.tabTitle) {
            case zipai:
                _startImage = [UIImage imageNamed:zipaiYuanArr[imgEntity.imgIndex]];
                _endImage = [UIImage imageNamed:zipaiXianArr[imgEntity.imgIndex]];
                break;
            case wenyi:
                _startImage = [UIImage imageNamed:wenyiYuanArr[imgEntity.imgIndex]];
                _endImage = [UIImage imageNamed:wenyiXianArr[imgEntity.imgIndex]];
                break;
            case chuangyi:
                _startImage = [UIImage imageNamed:chuangyiYuanArr[imgEntity.imgIndex]];
                _endImage = [UIImage imageNamed:chuangyiXianArr[imgEntity.imgIndex]];
                break;
            case jiepai:
                _startImage = [UIImage imageNamed:jiepaiYuanArr[imgEntity.imgIndex]];
                _endImage = [UIImage imageNamed:jiepaiXianArr[imgEntity.imgIndex]];
                break;
            case yingshi:
                _startImage = [UIImage imageNamed:yingshiYuanArr[imgEntity.imgIndex]];
                _endImage = [UIImage imageNamed:yingshiXianArr[imgEntity.imgIndex]];
                break;
        }
         _middleImage = [UIImage mergeImage:_startImage withImage:_endImage];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [_changeSlider setValue:0];
    [_showSlidePicture setImage:nil];
}

- (IBAction)picButtonPressed:(UIButton *)sender {
    YXQPicturesShowView *picturesShowView = [[YXQPicturesShowView alloc] init];
    [self.navigationController pushViewController:picturesShowView animated:YES];
}

- (IBAction)changePicture:(UISlider *)sender {
    float value = [_changeSlider value];
    if (value <= 0.4) {
        [_showSlidePicture setImage:_startImage];
        [_showSlidePicture setAlpha:1 - value * 2];
    }else if((value > 0.4) && (value <= 0.8)){
        [_showSlidePicture setImage:_middleImage];
        [_showSlidePicture setAlpha:value / 3];
    }else if((value > 0.8) && (value < 1)){
        [_showSlidePicture setImage:_endImage];
        [_showSlidePicture setAlpha:value / 2];
    }else{
        [_showSlidePicture setImage:_endImage];
        [_showSlidePicture setAlpha:1.0];
    }
}

@end
