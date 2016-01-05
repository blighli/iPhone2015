//
//  ViewController.m
//  BeefNotGo
//
//  Created by 幽儿 on 15/12/29.
//  Copyright © 2015年 幽儿. All rights reserved.
//

#import "ViewController.h"
#import "NestCircle.h"

int map[9][9];
NestCircle *allNest[9][9];
NestCircle *clickPoint;
int hasCircle=0;
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image=[UIImage imageNamed:@"white.png"];
    self.allButtonArray=[NSMutableArray arrayWithCapacity:9];
    for(int i=0;i<9;i++){
        NSMutableArray *array=[NSMutableArray arrayWithCapacity:9];
        [self.allButtonArray addObject:array];
        for(int j=0;j<9;j++){
            UIButton *btn=[[UIButton alloc]init];
            if(i%2==0){
                btn.frame=CGRectMake(28*j+20, 28*i+170, 28, 28);
            }
            else{
                btn.frame=CGRectMake(28*j+34, 28*i+170, 28, 28);
            }
            [btn setImage:image forState:UIControlStateNormal];
            [self.view addSubview:btn];
            [array addObject:btn];
            [btn addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
            NestCircle *n1=[[NestCircle alloc]init];
            n1.row=i;
            n1.col=j;
            n1.path=-100;
            allNest[i][j]=n1;
        }
    }
    self.beef=[[NestCircle alloc]init];
    UIImage *beefLeft=[UIImage imageNamed:@"left.png"];
    UIImage *beefRight=[UIImage imageNamed:@"right.png"];
    self.beefImageView=[[UIImageView alloc]initWithFrame:CGRectMake(28*4+20, 28*3+170, 30, 56)];
    self.beefImageView.animationImages=[NSArray arrayWithObjects:beefLeft,beefRight, nil];
    self.beefImageView.animationDuration=1.0;
    [self.view addSubview:self.beefImageView];
    [self.beefImageView startAnimating];
    [self reInit];
}

-(void) reInit
{
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            map[i][j]=0;
            UIImage *image=[UIImage imageNamed:@"white.png"];
            [self.allButtonArray[i][j] setImage:image forState:UIControlStateNormal];
        }
    }
    self.pathNumber=0;
    self.isGameOver=0;
    self.beef.row=4;
    self.beef.col=4;
    self.beef.path=888;
    map[4][4]=1;
    self.beefImageView.frame=CGRectMake(28*4+20, 28*3+170, 30, 56);
    [self createNestWall];
    [self calCostPath];
    [self printPath];
}

-(void) clickMe:(id)sender
{
    UIButton *btn=(UIButton*)sender;
    UIImage *image=[UIImage imageNamed:@"yellow.png"];
    [btn setImage:image forState:UIControlStateNormal];
    int row=[self getButtonRow:btn];
    int col=[self getButtonCol:btn];
    [self updateCostRow:row col:col];
    self.pathNumber++;
    self.isGameOver=[self beefAutoGo];
    if (self.isGameOver==1&&self.beef.row==row&&self.beef.col==col) {
        [self performSelector:@selector(showWinAlertView) withObject:nil afterDelay:0.1];
        return;
    }
    else if (self.isGameOver==1){
        
    }
    else{
        if (self.isGameOver==-1) {
            [self performSelector:@selector(showLoseAlertView) withObject:nil afterDelay:0.1];
            return;
        }
        [self calCostPath];
        [self printPath];
    }
}

-(void) showWinAlertView
{
    NSString *msg=[NSString stringWithFormat:@"你抓住蜜蜂的步数:%d次",self.pathNumber];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:msg message:@"恭喜，你抓住蜜蜂了！" delegate:self cancelButtonTitle:@"退出游戏？" otherButtonTitles:@"再来一次？", nil];
    [alert show];
}

-(void) showLoseAlertView
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"好可惜，蜜蜂逃跑了！" message:@"你失败啦，加油！" delegate:self cancelButtonTitle:@"退出游戏？" otherButtonTitles:@"再试一次？", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        exit(1);
    }
    else{
        [self runAgain];
    }
}

-(void) runAgain
{
    [self reInit];
}

-(int) getButtonRow:(UIButton*)btn
{
    int y=btn.frame.origin.y;
    int row=(y-170)/28;
    return row;
}

-(int) getButtonCol:(UIButton*)btn
{
    int x=btn.frame.origin.x;
    int y=btn.frame.origin.y;
    int row=(y-170)/28;
    int col=0;
    if (row%2==0) {
        col=(x-20)/28;
    }
    else{
        col=(x-34)/28;
    }
    return col;
}

-(void) updateCostRow:(int) row col:(int)col
{
    NestCircle *loc=allNest[row][col];
    map[loc.row][loc.col]=1;
    clickPoint=loc;
    [self clearCostPath];
    [self calCostPath];
    [self printPath];
}

-(int) beefAutoGo
{
    NestCircle *best=[self getBestNest];
    if(best!=NULL){
        int i=self.beef.row;
        int j=self.beef.col;
        if (clickPoint.row==allNest[i][j].row&&clickPoint.col
            ==allNest[i][j].col) {
//          map[i][j]已然为1，什么也不用做
        }
        else{
            map[i][j]=0;
        }
        self.beef.row=best.row;
        self.beef.col=best.col;
        i=self.beef.row;
        j=self.beef.col;
        map[i][j]=1;
        if(i%2==0){
            self.beefImageView.frame=CGRectMake(28*j+20, 28*(i-1)+170, 30, 56);
        }
        else{
            self.beefImageView.frame=CGRectMake(28*j+34, 28*(i-1)+170, 30, 56);
        }
        if (i==0||i==8||j==0||j==8) {
            return -1;//🐝已经到边界，游戏失败
        }
    }
    else{
        return 1;//当前🐝已经被围住并且只要点击🐝所在的点游戏就会赢
    }
    return 0;
}

-(NestCircle*) getBestNest
{
    NestCircle *best=nil;
    int max=0;
    best=[self getMaxCost:&max];
    if (best!=nil) {
        return best;
    }
    else if(hasCircle==1){
        return best;
    }
    NSArray *Surround=[self.beef getAllConnectNest];
    int i=0;
    for (i=0; i<6; i++) {
        NestCircle *temp=(NestCircle*)[Surround objectAtIndex:i];
        if (map[temp.row][temp.col]==0) {
            best=temp;
            break;
        }
    }
    for (int j=i+1; j<6; j++) {
        NestCircle *temp=(NestCircle*)[Surround objectAtIndex:j];
        if (map[temp.row][temp.col]==0&&[temp compare:best]==1) {
            best=temp;
        }
    }
    if (best!=NULL) {
        printf("Beef's best location: row is %d, col is %d\n",best.row,best.col);
    }
    return best;
}

-(NestCircle*) getMaxCost:(int*)pMax
{
    if (hasCircle==0) {
        return nil;
    }
    int i=self.beef.row;
    int j=self.beef.col;
    NestCircle *p=allNest[i][j];
    NSArray *allConnectNest=[p getAllConnectNest];
    p=(NestCircle*)[allConnectNest objectAtIndex:0];
    int index=0;
    int wallNum=0;
    int max=p.cost;
    NestCircle *p1=nil;
    for (i=0; i<6; i++) {
        p=(NestCircle*)[allConnectNest objectAtIndex:i];
        if (p.cost<100) {
            max=p.cost;
            index=i;
            p1=p;
            break;
        }
    }
    for (i=0; i<6; i++) {
        p=(NestCircle*)[allConnectNest objectAtIndex:i];
        if (p.cost==100) {
            wallNum++;
            continue;
        }
        if (max<p.cost) {
            max=p.cost;
            index=i;
        }
    }
    if (wallNum<6) {
        *pMax=p.cost;
        p=(NestCircle*)[allConnectNest objectAtIndex:index];
        return p;
    }
    else{
        *pMax=-1;
        return nil;
    }
}

-(void) createNestWall{
    int wallNumber=arc4random()%40+10;
    int num=0;
    while (num<wallNumber) {
        int row=arc4random()%9;
        int col=arc4random()%9;
        if (row!=4&&col!=4&&map[row][col]==0) {
            num++;
            map[row][col]=1;
            UIImage *image=[UIImage imageNamed:@"yellow.png"];
            [self.allButtonArray[row][col] setImage:image forState:UIControlStateNormal];
        }
    }
}

-(void)clearCostPath
{
    for (int i=0; i<9; i++) {
        for (int j=0;j<9; j++) {
            allNest[i][j].path=-100;
            allNest[i][j].cost=-100;
        }
    }
}

-(void)calCostPath
{
    [self clearCostPath];
    
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [allNest[i][j] calculateCost];
        }
    }
    
//    左上角
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [allNest[i][j] calculatePath];
            [allNest[j][i] calculatePath];
        }
    }
    
//    右上角
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [allNest[i][8-j] calculatePath];
            [allNest[j][8-i] calculatePath];
        }
    }
    
//    左下角
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [allNest[8-i][j] calculatePath];
            [allNest[8-j][i] calculatePath];
        }
    }
    
//    右下角
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [allNest[8-i][8-j] calculatePath];
            [allNest[8-j][8-i] calculatePath];
        }
    }
    
    hasCircle=[self.beef isInCircle];
}

-(void) printPath{
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            int a = allNest[i][j].path;
            if (a < 0) {
                a = -a;
            }
            if (i % 2 == 1) {
                printf("  ");
            }
            if (i == self.beef.row && j == self.beef.col) {
                printf("%4d ", self.beef.path);
            }
            else {
                if (a < 100) {
                    printf("%4d ", a);
                }
                else {
                    printf("%d ", a);
                }
            }
            
        }
        printf("\n");
    }
    printf("\n\n");
    [self printBeefConnectCost];
}

-(void) printBeefConnectCost
{
    NSArray *beefAllConnect=[self.beef getAllConnectNest];
    int i=0;
    for (i=0; i<6; i++) {
        NestCircle *temp=(NestCircle*)[beefAllConnect objectAtIndex:i];
        printf("%2d ",temp.cost);
    }
    printf("\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
