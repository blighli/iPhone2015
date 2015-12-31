//
//  UIImage+Extension.m
//  QQ聊天布局
//
//  Created by 123 on 15/10/31.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**返回一张可以随意拉伸不变形的图片*/
+(UIImage *)resizableImage:(NSString *)name
{
    UIImage *normal=[UIImage imageNamed:name];
    CGFloat w=normal.size.width*0.5;
    CGFloat h=normal.size.height*0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(h, w, h, w)];
}
@end
