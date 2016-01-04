//
//  ViewController.h
//  eluosi
//
//  Created by admin on 12-8-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "blocks.h"
#import "block.h"

@interface ViewController : UIViewController{
    IBOutlet UIView *nextblockview;
    IBOutlet UILabel *label;
    blocks *allblock;
    block *oneblock;
    block *nextoneblock;
    
    int completenum;//已消行数
    NSTimeInterval speed;
    NSTimer *timer;
    NSArray *blockpicarr;//存放7种小方块
    NSMutableArray *blockimgarr;
    int kindnum;//方块有几种
    
    int i;
    int j;
    int k;
    int sizex;//横向格子数
    int sizey;//纵向格子数
    NSMutableArray *wholearr;//存放所有格子
    int movecountx;//记录移动中的方块移到第几行了
    int movecounty;
    int startx;
    int starty;
    NSMutableArray *oneshapearr;//存放一个形状的方块们
    NSMutableArray *nextshapearr;//下一个方块
    NSString *blockspos;//一个形状的方块们的位置索引
    NSString *nextblockspos;//下一个方块
    int blocksize;//方块尺寸
    int maxnum;//每个形状可能的最多方块数（普通版都是4个，变异版有1个和5个）
    
    int nowblock;
    int nextblock;
    UIImageView *imgview;
    int rotationcount;
    int rightmax;//用于右移时判断是否边界
    int bottommax;//检测是否碰最底
    BOOL isbottom;//指示方块们是否碰到底部方块
    BOOL hasfull;//本轮是否有满行
    BOOL isfull;
}

@property(nonatomic,retain)blocks *allblock;
@property(nonatomic,retain)block *oneblock;

-(IBAction)rotationblocks:(id)sender;
-(IBAction)rightleftmoveblocks:(id)sender;

@end
