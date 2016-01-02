//
//  YXQCameraView.h
//  PoseCamera
//
//  Created by YXQ on 15/12/29.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXQCameraView : UIViewController

@property (strong, nonatomic) UIImage *startImage;
@property (strong, nonatomic) UIImage *endImage;
@property (strong, nonatomic) UIImage *middleImage;
@property (weak, nonatomic) IBOutlet UIButton *picButton;
@property (weak, nonatomic) IBOutlet UISlider *changeSlider;
@property (weak, nonatomic) IBOutlet UIImageView *showSlidePicture;

- (IBAction)picButtonPressed:(UIButton *)sender;
- (IBAction)changePicture:(UISlider *)sender;


@end
