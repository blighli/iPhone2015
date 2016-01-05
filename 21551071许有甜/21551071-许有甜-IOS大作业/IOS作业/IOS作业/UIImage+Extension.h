//
//  UIImage+Extension.h
//  iOS大作业
//
//  Created by Lynn on 15/12/23.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 *  返回一张可任意伸缩不变形的图片
 */
+ (UIImage *)resizableImage:(NSString *)name;

/**
 *  截图保存
 */
+ (instancetype)captureWithView:(UIView *)view;
@end
