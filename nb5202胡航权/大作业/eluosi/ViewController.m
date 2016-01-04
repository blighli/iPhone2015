//
//  ViewController.m
//  eluosi
//
//  Created by udspj on 12-8-14.
//  Copyright (c) 2012年 不知霜舞哀伤. All rights reserved.
//

#import "ViewController.h"
#import "blocks.h"

@implementation ViewController

@synthesize allblock;
@synthesize oneblock;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    allblock = [[blocks alloc]init];
    [allblock build_blocks];//建立所有7种方块的数据
    
    oneblock = [[block alloc]init];
    
    completenum = 0;
    label.text = [NSString stringWithFormat:@"%d",completenum];
    
    blockpicarr = [[NSArray alloc]initWithObjects:@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png", nil];
    kindnum = [blockpicarr count];
    
    sizex = 10;
    sizey = 20;
    wholearr = [[NSMutableArray alloc]initWithCapacity:sizey];//建立10＊20的空格子堆
    for (i = 0; i < sizey; i++) {
        [wholearr addObject:[[NSMutableArray alloc]initWithCapacity:10]];
        for (j = 0; j < sizex; j++) {
            [[wholearr objectAtIndex:i] addObject:@"0"];
        }
    }
    blocksize = 20;
    
    nowblock = (arc4random() % (kindnum-1)) + 0;
    maxnum = 4;
    nextshapearr = [[NSMutableArray alloc] initWithCapacity:4];
    for (k = 0; k < maxnum; k++) {
        imgview = [[UIImageView alloc]init];
        [nextshapearr addObject:imgview];
        [nextblockview addSubview:[nextshapearr objectAtIndex:k]];
    }
    startx = 5;
    starty = 5;
//    blockimgarr = [[NSMutableArray alloc] initWithCapacity:7];
//    for (i = 0; i < kindnum; i++) {
//        [blockimgarr addObject:[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, blocksize, blocksize)]];
//        [[blockimgarr objectAtIndex:i] setImage:[UIImage imageNamed:[blockpicarr objectAtIndex:i]]];
//    }
    oneshapearr = [[NSMutableArray alloc] initWithCapacity:4];
    [self performSelector:@selector(randomgetblocks)];
    
    speed = 0.2;
    timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(moveblocks) userInfo:Nil repeats:YES];
}

-(void)randomgetblocks{//随机获取某种方块
    movecountx = 5;
    movecounty = 0;
    rotationcount = 0;
    isbottom = NO;
    
    switch (nowblock) {
        case 0:
            oneblock = [allblock get_block_blue];
            break;
        case 1:
            oneblock = [allblock get_block_orange];
            oneblock = [allblock get_block_blue];
            break;
        case 2:
            oneblock = [allblock get_block_skyblue];
            oneblock = [allblock get_block_blue];
            break;
        case 3:
            oneblock = [allblock get_block_green];
            oneblock = [allblock get_block_blue];
            break;
        case 4:
            oneblock = [allblock get_block_purple];
            oneblock = [allblock get_block_blue];
            break;
        case 5:
            oneblock = [allblock get_block_yellow];
            oneblock = [allblock get_block_blue];
            break;
        case 6:
            oneblock = [allblock get_block_red];
            oneblock = [allblock get_block_blue];
            break;
        default:
            break;
    }
    blockspos = [oneblock.block_rotation objectAtIndex:rotationcount];
    
    [oneshapearr removeAllObjects];
    for (k = 0; k < oneblock.block_num; k++) {
        imgview = [[UIImageView alloc]init];
        [imgview setImage:[UIImage imageNamed:[blockpicarr objectAtIndex:nowblock]]];
        [oneshapearr addObject:imgview];
        [self.view addSubview:[oneshapearr objectAtIndex:k]];
    }
    [self performSelector:@selector(changeblockpos)];
    
    nextblock = (arc4random() % (kindnum-1)) + 0;//同时更新下一个方块
    switch (nextblock) {
        case 0:
            nextoneblock = [allblock get_block_blue];
            break;
        case 1:
            nextoneblock = [allblock get_block_orange];
            break;
        case 2:
            nextoneblock = [allblock get_block_skyblue];
            break;
        case 3:
            nextoneblock = [allblock get_block_green];
            break;
        case 4:
            nextoneblock = [allblock get_block_purple];
            break;
        case 5:
            nextoneblock = [allblock get_block_yellow];
            break;
        case 6:
            nextoneblock = [allblock get_block_red];
            break;
        default:
            break;
    }
    nextblockspos = [nextoneblock.block_rotation objectAtIndex:0];
    for (k = 0; k < nextoneblock.block_num; k++) {
        if (k >= nextoneblock.block_num) {
            [[nextshapearr objectAtIndex:k] setImage:Nil];
        }else{
            i = [[nextblockspos substringWithRange:NSMakeRange(k * 4, 1)] intValue];
            j = [[nextblockspos substringWithRange:NSMakeRange(k * 4 + 2, 1)] intValue];
            [[nextshapearr objectAtIndex:k] setImage:[UIImage imageNamed:[blockpicarr objectAtIndex:nextblock]]];
            [[nextshapearr objectAtIndex:k] setFrame:CGRectMake(blocksize*i, blocksize*j, blocksize, blocksize)];
        }
    }
    nowblock = nextblock;
}

-(BOOL)checkblockspos{
    for (k = 0; k < oneblock.block_num; k++) {
        i = [[blockspos substringWithRange:NSMakeRange(k * 4, 1)] intValue];
        j = [[blockspos substringWithRange:NSMakeRange(k * 4 + 2, 1)] intValue];
//        if ([[[wholearr objectAtIndex:movecounty+j] objectAtIndex:movecountx+i] isEqualToString:@"0"]) {
//            
//        }else{
//            return NO;
//        }
        if ([[[wholearr objectAtIndex:movecounty+j] objectAtIndex:movecountx+i] isEqual:@"0"]) {
        }else{
            return NO;
        }
    }
    return YES;
}

-(void)moveblocks{//方块正常下落，并检查是否有方块已落底，落地后加入wholearr
    movecounty ++;
    if (movecounty > sizey - 2) {
        isbottom = YES;
    }
    else{
        if([self checkblockspos]){
            
        }else{
            isbottom = YES;
        }
    }
    if (isbottom) {
        for (k = 0; k < oneblock.block_num; k++) {
            i = [[blockspos substringWithRange:NSMakeRange(k * 4, 1)] intValue];
            j = [[blockspos substringWithRange:NSMakeRange(k * 4 + 2, 1)] intValue];
            [[wholearr objectAtIndex:movecounty-1+j] replaceObjectAtIndex:movecountx+i withObject:[oneshapearr objectAtIndex:k]];
        }
        [self performSelector:@selector(randomgetblocks)];
        [self performSelector:@selector(removewholearrandgetscore)];
    }else{
        [self performSelector:@selector(changeblockpos)];
    }
}

-(void)changeblockpos{//通用，更新方块们的位置信息
    rightmax = 0;
    for (k = 0; k < oneblock.block_num; k++) {
        i = [[blockspos substringWithRange:NSMakeRange(k * 4, 1)] intValue];
        j = [[blockspos substringWithRange:NSMakeRange(k * 4 + 2, 1)] intValue];
        [[oneshapearr objectAtIndex:k] setFrame:CGRectMake(startx+blocksize*(movecountx+i), starty+blocksize*(movecounty+j), blocksize, blocksize)];
        if (rightmax < i) {
            rightmax = i;
        }
    }
}

-(IBAction)rotationblocks:(id)sender{//按钮旋转方块们
    rotationcount ++;
    if (rotationcount > [oneblock.block_rotation count]-1) {
        rotationcount = 0;
    }
    blockspos = [oneblock.block_rotation objectAtIndex:rotationcount];
    //[self performSelector:@selector(changeblockpos)];
    if (movecountx > (sizex - rightmax - 1)) {//翻转后，修正右边的超出部分
        movecountx = sizex - rightmax - 1;
    }
    [self performSelector:@selector(changeblockpos)];
}

-(IBAction)rightleftmoveblocks:(id)sender{//按钮左右移动方块们
    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"左"] && movecountx > 0) {
        movecountx --;
        if([self checkblockspos]){
            [self performSelector:@selector(changeblockpos)];
        }else{
            movecountx += 1;
        }
    }
    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"右"] && movecountx < (sizex - rightmax - 1)) {
        movecountx ++;
        if([self checkblockspos]){
            [self performSelector:@selector(changeblockpos)];
        }else{
            movecountx -= 1;
        }
    }
}

-(void)removewholearrandgetscore{//检测是否有满行，并移除已满的某一行，更新分数
    isfull = NO;
    hasfull = NO;
    for (i = 0; i < sizey; i++) {
        for (j = 0; j < sizex; j++) {
            if ([[[wholearr objectAtIndex:i] objectAtIndex:j] isEqual:@"0"]) {
                break;//每行只要发现一个为0的，就跳出，肯定消不掉
            }else{
                if (j == sizex - 1) {//如果该行中sizex-1个全都不是0,就消掉
                    isfull = YES;
                    hasfull = YES;
                    for (k = 0; k <sizex; k++) {
                        [[[wholearr objectAtIndex:i] objectAtIndex:k] removeFromSuperview];
                        [[wholearr objectAtIndex:i] replaceObjectAtIndex:k withObject:@"0"];
                    }
                    //[wholearr exchangeObjectAtIndex:i withObjectAtIndex:0];
                }
            }
        }
        if (isfull) {
            [wholearr insertObject:[wholearr objectAtIndex:i] atIndex:0];
            [wholearr removeObjectAtIndex:i+1];
            isfull = NO;
            completenum ++;//计分
            label.text = [NSString stringWithFormat:@"%d",completenum];
        }
    }
    if (hasfull) {//如果该轮有消行，重新排列所有方块
        for (i = 0; i < sizey; i++) {
            for (j = 0; j < sizex; j++) {
                if ([[[wholearr objectAtIndex:i] objectAtIndex:j] isEqual:@"0"]) {
                    
                }else{
                    [[[wholearr objectAtIndex:i] objectAtIndex:j] setFrame:CGRectMake(startx+blocksize*j, starty+blocksize*i, blocksize, blocksize)];
                }
            }
        }
    }
}





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
