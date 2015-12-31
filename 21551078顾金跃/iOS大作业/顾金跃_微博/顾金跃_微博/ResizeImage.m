//
//  ResizeImage.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/24.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "ResizeImage.h"
@implementation ResizeImage

-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
