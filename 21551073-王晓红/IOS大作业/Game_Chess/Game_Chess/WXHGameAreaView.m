//
//  WXHGameAreaView.m
//  Game_Chess
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 wxh. All rights reserved.
//


#import "WXHGameAreaView.h"
#import "WXHNode.h"
#import "WXHDefine.h"
#import "WXHEnum.h"
#import "WXHUtils.h"

#define kNodeWidth (kScreenWidth - 40) / 8


@implementation WXHGameAreaView
{
    int blackNum;
    int whiteNum;
    
    UILabel *blackLabel;
    UILabel *whiteLabel;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

- (void)awakeFromNib
{
    blackLabel =(UILabel*)[self viewWithTag:-1000];
    whiteLabel =(UILabel*)[self viewWithTag:-1001];
    [self onCreateNodes];
}

// 监听棋子点击
- (void)onNodeClick:(WXHNode*)node
{
   
     NSLog(@"testttttt");
     [[NSNotificationCenter defaultCenter]postNotificationName:WXHPlayerDownNodeNotification object:node];
     NSLog(@"test== %s",__func__);
}

// 创建棋子到棋盘上
- (void)onCreateNodes
{
    int k=0;
    for (int i=0; i<kSize; i++) {
        for (int j=0; j<kSize; j++) {
            WXHNode *node = [[WXHNode alloc]initWithFrame:CGRectMake(10+kNodeWidth*j, 10+kNodeWidth*i, kNodeWidth, kNodeWidth)];
            node.tag = ++k;
            [node addTarget:self action:@selector(onNodeClick:) forControlEvents:UIControlEventTouchUpInside];
            node.layer.masksToBounds = YES;
            node.layer.cornerRadius = node.frame.size.width/2;
            [self addSubview:node];
        }
    }
}

// 初始化棋盘上棋子状态
- (void)onInitNodesWithPlayer:(WXHParent*)player
{
    int k=0;
    for (int i=0; i<kSize; i++) {
        for (int j=0; j<kSize; j++) {
            WXHNode *node = (WXHNode*)[self viewWithTag:++k];
            node.nodeState = KCLEAR;
        }
    }
    
    ((WXHNode*)[self viewWithTag:28]).nodeState = KBLACK;
    ((WXHNode*)[self viewWithTag:29]).nodeState = KWHITE;
    ((WXHNode*)[self viewWithTag:36]).nodeState = KWHITE;
    ((WXHNode*)[self viewWithTag:37]).nodeState = KBLACK;
    
    [player setHintState:self];
}

// 计算棋盘上白黑棋子个数
- (void)onCalculateNodeNum
{
    blackNum = 0;
    whiteNum = 0;
    for (int i=1; i<=kSize*kSize; i++) {
        WXHNode *node = (WXHNode*)[self viewWithTag:i];
        if (node.nodeState == KBLACK) {
            blackNum++;
        }
        if (node.nodeState == KWHITE) {
            whiteNum++;
        }
    }
    blackLabel.text = [NSString stringWithFormat:@"%d",blackNum];
    whiteLabel.text = [NSString stringWithFormat:@"%d",whiteNum];
}

// 判断获胜
- (void)onJudgeWinForPlayer:(WXHParent*)player OtherPlayer:(WXHParent*)OtherPlayer
{
    [self onCalculateNodeNum];
    if (0 == blackNum) {
        _gameState = GAMEOVER;
        kAlert(kWhiteWin);
        return;
    }
    if (0 == whiteNum) {
        _gameState = GAMEOVER;
        kAlert(kBlackWin);
        return;
    }
    if ([[player getCurrentAllowDownNodesInView:self] count]== 0 && [[OtherPlayer getCurrentAllowDownNodesInView:self] count]== 0) {
        [self onCalculateNodeNum];
        if (blackNum > whiteNum) {
            _gameState = GAMEOVER;
            kAlert(kBlackWin);
            return;
        }
        if (whiteNum > blackNum) {
            _gameState = GAMEOVER;
            kAlert(kWhiteWin);
            return;
        }
        if (whiteNum == blackNum) {
            _gameState = GAMEOVER;
            kAlert(kDoubleWin);
            return;
        }
        
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    //画棋盘
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    for (int i=0; i<=kSize; i++) {     //画横线
        CGContextSetLineWidth(ctx, (i == 0 || i==kSize)?5:2.0);
        CGContextSetStrokeColorWithColor(ctx, [[UIColor purpleColor] CGColor]);
        CGContextMoveToPoint(ctx, 10,10+kNodeWidth*i);
        CGContextAddLineToPoint(ctx, 10+kNodeWidth*kSize, 10+kNodeWidth*i);
        CGContextStrokePath(ctx);
    }
    
    
    for (int i=0; i<=kSize; i++) {      //画竖线
        CGContextSetLineWidth(ctx, (i == 0 || i==kSize)?5:2.0);
        CGContextSetStrokeColorWithColor(ctx, [[UIColor purpleColor] CGColor]);
        CGContextMoveToPoint(ctx, 10+kNodeWidth*i,10);
        CGContextAddLineToPoint(ctx, 10+kNodeWidth*i, 10+kNodeWidth*kSize);
        CGContextStrokePath(ctx);
    }
    
}

@end
