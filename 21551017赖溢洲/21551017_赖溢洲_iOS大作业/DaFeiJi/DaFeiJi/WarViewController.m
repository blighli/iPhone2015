//
//  WarViewController.m
//  DaFeiJi
//
//  Created by mac on 15-8-7.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "WarViewController.h"
#import "MyUIImageView.h"
@interface WarViewController ()

@end

@implementation WarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    topImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    
    topImageView.frame=CGRectMake(0, -480, 320, 480);
    [self.view addSubview:topImageView];
    
    
    
    BottomImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    
    BottomImageView.frame=CGRectMake(0, 0, 320, 480);
    [self.view addSubview:BottomImageView];

    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(bgMove) userInfo:nil repeats:YES];
    
    
//    战机
    
    heroImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"plane1.png"]];
    heroImageView.frame=CGRectMake(120, 400, 60, 60);
    [self.view addSubview:heroImageView];
    
    
    NSArray *array=[[NSArray alloc]initWithObjects:[UIImage  imageNamed:@"plane1.png"],[UIImage  imageNamed:@"plane2.png"], nil];
    
//    战机帧动画
    heroImageView.animationImages=array;
    heroImageView.animationDuration=0.2;
    heroImageView.animationRepeatCount=0;
    [heroImageView startAnimating];
    
//   创建敌机
    
    
    
    enemyArray=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<20; i++) {
        enemyImageView=[[MyUIImageView alloc] initWithImage:[UIImage imageNamed:@"diji.png"]];
        enemyImageView.frame=CGRectMake(0, -50, 50, 50);
        enemyImageView.isUsed=NO;
        [enemyArray  addObject:enemyImageView];
        [self.view addSubview:enemyImageView];
    }
    
//    敌机下落
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(dijiDown) userInfo:nil repeats:YES];
    
//    创建子弹
    zidanArray=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<30; i++) {
        zidanImageView=[[MyUIImageView alloc] initWithImage:[UIImage imageNamed:@"zidan.png"]];
        zidanImageView.frame=CGRectMake(-30, -30, 5, 5);
        zidanImageView.isUsed=NO;
        [zidanArray addObject:zidanImageView];
        [self.view addSubview:zidanImageView];
        
    }
    
    
//    子弹下落
    
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(zidanDown) userInfo:nil repeats:YES];
    
    
//    碰撞
    
 
    
}

-(void)bgMove
{
    topImageView.frame=CGRectMake(0, topImageView.frame.origin.y+5, 320, 480);
    BottomImageView.frame=CGRectMake(0, BottomImageView.frame.origin.y+5, 320, 480);
    
    if (topImageView.frame.origin.y>=480) {
        topImageView.frame=CGRectMake(0, -480, 320, 480);
    }
    if (BottomImageView.frame.origin.y>=480) {
         BottomImageView.frame=CGRectMake(0, -480, 320, 480);
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    touch=[touches anyObject];
     point=[touch locationInView:self.view];
    heroImageView.center=point;
    
    
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


-(void)dijiDown
{

    static int count=0;
    
    if (count%10==0) {
        for (int i=0; i<enemyArray.count; i++) {
            
            MyUIImageView *enemyImageView1=[enemyArray objectAtIndex:i];
            
          
            if (enemyImageView1.isUsed==NO) {
                enemyImageView1.frame=CGRectMake(arc4random()%270, -50, 50, 50);
                enemyImageView1.isUsed=YES;
                break;
            }
            
        }
    }

    count++;
    
    for (MyUIImageView *enemyImageView1 in enemyArray) {
        if (enemyImageView1.isUsed==YES) {
            enemyImageView1.frame=CGRectMake(enemyImageView1.frame.origin.x, enemyImageView1.frame.origin.y+5, 50, 50);
       
            
            
            
            if (enemyImageView1.frame.origin.y>480) {
                enemyImageView1.isUsed=NO;
            }
        
        }
    }

  

}

-(void)zidanDown
{
    static int count=0;
    if (count%10==0) {
        for (int i=0; i<zidanArray.count; i++) {
            MyUIImageView *zidanImageView1=[zidanArray objectAtIndex:i];
            
            if (zidanImageView1.isUsed==NO) {
                
                zidanImageView1.frame=CGRectMake(heroImageView.frame.origin.x+27, heroImageView.frame.origin.y-5, 10, 10);

                zidanImageView1.isUsed=YES;
                break;
            }
        }
    }
    count++;
    
    for (MyUIImageView *zidanImageView1 in zidanArray) {
        if (zidanImageView1.isUsed==YES) {
            zidanImageView1.frame=CGRectMake(zidanImageView1.frame.origin.x, zidanImageView1.frame.origin.y-5, 10, 10);
      
            
            if (zidanImageView1.frame.origin.y<-10) {
                zidanImageView1.isUsed=NO;
            }
        }
    }

    
    for (MyUIImageView *zidan in zidanArray) {
        if (zidan.isUsed==YES) {
            for (MyUIImageView *enemy in enemyArray) {
                if (enemy.isUsed==YES) {
                    if (CGRectIntersectsRect(zidan.frame, enemy.frame)) {
                        //
                      
                        zidan.frame=CGRectMake(-10, 0, 0, 0);
                        
                        zidan.isUsed=NO;
                
                        //
                        
                        
                     
                        
                        UIImageView *bg=[[UIImageView alloc]init];
                        bg.frame=enemy.frame;
                        
                        NSMutableArray *imageArray=[[NSMutableArray alloc]initWithCapacity:0];
                        for(int i=1;i<=5;i++){
                            
                            
                            NSString *Baozha=[NSString stringWithFormat:@"bz%d.png",i];
                            UIImage *Baozhaimage=[UIImage imageNamed:Baozha];
                          
                            [imageArray addObject:Baozhaimage];
                            [self.view addSubview:bg];
                            
                            bg.animationImages=imageArray;
                            bg.animationDuration=0.5;
                            bg.animationRepeatCount=1;
                            [bg startAnimating];
                            enemy.frame=CGRectMake(0, -100, 0, 0);
                            enemy.isUsed=NO;
                        }
                      
                       
                    }
                }
            }
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
