//
//  JYNewFeatureViewController.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/20.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYNewFeatureViewController.h"
#import "JYWBTabBarViewController.h"
#define JYNewFeatureImageCount 3
@interface JYNewFeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;
@end

@implementation JYNewFeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.添加UIScrollView
    [self setupScrollView];
    
    //2.添加pageControl
    [self setupPageControl];
}

-(void)setupScrollView
{
    
    //1.添加UIScrollView
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.delegate=self;
    scrollView.frame=self.view.bounds;
    [self.view addSubview:scrollView];
    
    //2.添加图片
    CGFloat imageW=self.view.frame.size.width;
    CGFloat imageH=self.view.frame.size.height;
    CGFloat imageY=0;
    for(int index=0; index<JYNewFeatureImageCount; index++)
    {
        //设置图片
        UIImageView *imageView=[[UIImageView alloc]init];
        NSString *name=[NSString stringWithFormat:@"new_feature_%d",index+1];
        imageView.image=[UIImage imageNamed:name];
        imageView.userInteractionEnabled=YES;
        //设置frame
        CGFloat imageX=index*imageW;
        imageView.frame=CGRectMake(imageX, imageY, imageW, imageH);
        
        [scrollView addSubview:imageView];
        
        //在最后一个图片上面添加按钮
        if(index==JYNewFeatureImageCount-1)
        {
            [self setupLastImageView:imageView];
        }
    }
    
    //设置滚动的内容(能滚动到哪里)
    //垂直方向不需要滚动,所以给了个0
    scrollView.contentSize=CGSizeMake(imageW*3, 0);
    //隐藏滚动条
    scrollView.showsHorizontalScrollIndicator=NO;
    //强制分页
    scrollView.pagingEnabled=YES;
    //不可以弹簧
    scrollView.bounces=NO;
}
-(void)setupPageControl
{
    //1.添加
    UIPageControl *pageControl=[[UIPageControl alloc]init];
    pageControl.numberOfPages=JYNewFeatureImageCount;
    pageControl.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-30);
    pageControl.bounds=CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled=NO;
    self.pageControl=pageControl;
    [self.view addSubview:pageControl];
    
    //2.设置圆点的颜色                           //平铺
//    pageControl.currentPageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_checked_point"]];
//    
//    pageControl.pageIndicatorTintColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"new_feature_pagecontrol_point"]];
    
    pageControl.currentPageIndicatorTintColor=[UIColor greenColor];
    pageControl.pageIndicatorTintColor=[UIColor grayColor];
}


//代理方法
//只要UIScrollView滚动了,就会调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //打印结构体
    //NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //1.取出水平方向上滚动的距离
    CGFloat offsetX=scrollView.contentOffset.x;
    //2.求出页码
    double pageDouble=offsetX/scrollView.frame.size.width;
    int pageInt=(int)(pageDouble+0.5);
    self.pageControl.currentPage=pageInt;
   // NSLog(@"%lf    %d",pageDouble,pageInt);
}


//添加最后一页的内容
-(void)setupLastImageView:(UIImageView *)imageView
{
    //1.添加开始按钮
    UIButton *startButton=[[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    //2.设置frame
    startButton.center=CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height*0.55);
    //尺寸(w,h)
    startButton.bounds=CGRectMake(0, 0, startButton.currentBackgroundImage.size.width+15, startButton.currentBackgroundImage.size.height);
    //3.设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    
    //4.添加checkbox
    UIButton *checkbox=[[UIButton alloc]init];
    //[checkbox setBackgroundColor:[UIColor grayColor]];
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkbox.titleLabel.font=[UIFont systemFontOfSize:16];
    checkbox.selected=YES;
    [checkbox setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    //中心点
    checkbox.center=CGPointMake(imageView.frame.size.width/2, imageView.frame.size.height*0.48);
    //尺寸(w,h)
    checkbox.bounds=startButton.bounds;
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    //文字左边留出10个空隙
    checkbox.titleEdgeInsets=UIEdgeInsetsMake(0, 4, 0, 0);
    [imageView addSubview:checkbox];
}

-(void)checkboxClick:(UIButton *)checkbox
{
    checkbox.selected=!checkbox.selected;
}

//开始微博
-(void)startClick
{
    //显示状态栏
    [UIApplication sharedApplication].statusBarHidden=NO;
    JYWBTabBarViewController *tabbar=[[JYWBTabBarViewController alloc]init];
    //切换窗口控制器
    self.view.window.rootViewController=tabbar;
}

//新特性控制器被移除了
-(void)dealloc
{
   
}
@end
