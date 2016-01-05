//
//  YTDrawPic.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTDrawPicView.h"
@interface YTDrawPicView()
@property (nonatomic, strong) NSMutableArray *paths;

@end

@implementation YTDrawPicView

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
}
- (NSMutableArray *)paths
{
    if (_paths == nil) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)clear
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)back
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1.获得当前的触摸点
    UITouch *touch = [touches anyObject];
    CGPoint startPos = [touch locationInView:touch.view];
    
    NSLog(@"touchesBegan=====%p",self.lineColor);
    
    // 2.创建一个新的路径
    UIBezierPath *currenPath = [UIBezierPath bezierPath];
    currenPath.lineCapStyle = kCGLineCapRound;
    currenPath.lineJoinStyle = kCGLineJoinRound;
    currenPath.lineWidth = self.lineWidth;

    // 设置起点
    [currenPath moveToPoint:startPos];
    
    // 3.添加路径到数组中
    [self.paths addObject:currenPath];
    
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:touch.view];
    
    UIBezierPath *currentPath = [self.paths lastObject];
    [currentPath addLineToPoint:pos];
    
    [self setNeedsDisplay];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded");
}

- (void)drawRect:(CGRect)rect
{
    
    
    for (UIBezierPath *path in self.paths) {
        [self.lineColor set];
        [path stroke];
    }
}

@end
