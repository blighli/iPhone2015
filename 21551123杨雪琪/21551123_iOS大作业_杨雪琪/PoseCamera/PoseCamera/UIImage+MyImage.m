//
//  UIImage+MyImage.m
//  PoseCamera
//
//  Created by YXQ on 16/1/2.
//  Copyright © 2016年 YXQ. All rights reserved.
//

#import "UIImage+MyImage.h"

@implementation UIImage (MyImage)

+ (UIImage *)mergeImage:(UIImage *)first withImage:(UIImage *)second
{
    CGImageRef firstImageRef = first.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    
    CGImageRef secondImageRef = second.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    
    UIGraphicsBeginImageContext(mergedSize);
    [first drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [second drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
