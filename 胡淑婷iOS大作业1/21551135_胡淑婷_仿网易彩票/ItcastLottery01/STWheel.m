//
//  STWheel.m
//  转盘
//
//  Created by 123 on 15/12/4.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STWheel.h"
#import "STWheelButton.h"

@interface STWheel()
- (IBAction)startChoose;

@property (weak, nonatomic) IBOutlet UIImageView *centerView;
@property(nonatomic,weak)STWheelButton *selectedBtn;
@property(nonatomic,strong)CADisplayLink *link;
@end
@implementation STWheel

+(instancetype)wheel
{
    return [[[NSBundle mainBundle]loadNibNamed:@"STWheel" owner:nil options:nil]lastObject];
}
/**
 在这个方法中。取得的属性才是有值的
 */
-(void)awakeFromNib
{
    self.centerView.userInteractionEnabled=YES;
    
    //加载大图片
    UIImage *bigImage= [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *bigImageSelected= [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    NSLog(@"%f",[UIScreen mainScreen].scale);//为啥不是2
    
    //从大图片中裁剪出对应星座的图片
    CGFloat smallW=bigImage.size.width/12*2;
    CGFloat smallH=bigImage.size.height*2;
    
    //添加12个按钮
    for (int index=0; index<12; index++) {
        STWheelButton *btn=[STWheelButton buttonWithType:UIButtonTypeCustom];
        
        CGRect smallRect=CGRectMake(index*smallW, 0, smallW, smallH);
        //CGImageCreateWithImageInRect只认像素
        CGImageRef smallImage=CGImageCreateWithImageInRect(bigImage.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        
        CGImageRef smallImageSelected=CGImageCreateWithImageInRect(bigImageSelected.CGImage, smallRect);
        [btn setImage:[UIImage imageWithCGImage:smallImageSelected] forState:UIControlStateSelected];
        
//        btn.imageView.backgroundColor=[UIColor blueColor];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        btn.frame=CGRectMake(0, 0, 68, 143);
        //设置锚点和位置
        btn.layer.anchorPoint=CGPointMake(0.5, 1);
                    btn.layer.position=CGPointMake(self.centerView.frame.size.width*0.5, self.centerView.frame.size.height*0.5);
        
        //设置旋转角度（绕着锚点进行旋转）
        CGFloat angle=(30*index)/180.0*M_PI;
        btn.transform=CGAffineTransformMakeRotation(angle);
        
        //监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self.centerView addSubview:btn];
        
        if (index==0) {
            [self btnClick:btn];
        }
    }
}

//-(instancetype)initWithCoder:(NSCoder *)aDecoder
//{
//    if (self=[super initWithCoder:aDecoder]) {
//        
//    }
//    return self;
//}
/**
 监听按钮点击
 */
-(void)btnClick:(STWheelButton *)btn
{
    self.selectedBtn.selected=NO;
    btn.selected=YES;
    self.selectedBtn=btn;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    for (UIButton *btn in self.centerView.subviews) {
        btn.layer.position=CGPointMake(self.centerView.frame.size.width*0.5, self.centerView.frame.size.height*0.5);
    }
}
/**
 开始不停地旋转
 */
-(void)startRotating
{
    if(self.link)return;
    
    //1秒内刷新60次
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link=link;
}
-(void)stopRotatng
{
    [self.link invalidate];
    self.link=nil;
}
-(void)update
{
    self.centerView.transform=CGAffineTransformRotate(self.centerView.transform, M_PI/200);
}
/**
 开始选号
 */
- (IBAction)startChoose
{
    [self stopRotatng];
    
    CABasicAnimation *anim=[CABasicAnimation animation];
    anim.keyPath=@"transform.rotation";
    anim.toValue=@(2*M_PI*3);
    anim.duration=2;
    
    anim.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate=self;
    [self.centerView.layer addAnimation:anim forKey:nil];
    
    self.userInteractionEnabled=NO;
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled=YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}
@end
