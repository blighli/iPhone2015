//
//  Pipe.h
//  FlapFlap
//
//  Created by dilemmaxk on 15/12/15.
//  Copyright © 2015年 dilemmaxk. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(NSInteger, PipeStyle) {
  PipeStyleTop,
  PipeStyleBottom,
};

@interface Pipe : SKSpriteNode

+ (Pipe *)pipeWithHeight:(CGFloat)height withStyle:(PipeStyle)style;

- (void)setPipeCategory:(uint32_t)pipe playerCategory:(uint32_t)player;

@end
