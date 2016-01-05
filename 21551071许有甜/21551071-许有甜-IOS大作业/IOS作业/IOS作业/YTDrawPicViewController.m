//
//  YTDrawPicViewController.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights reserved.
//

#import "YTDrawPicViewController.h"
#import "UIImage+Extension.h"
#import "YTDrawPicView.h"
#import "MBProgressHUD+YT.h"

@interface YTDrawPicViewController ()
@property (strong, nonatomic) YTDrawPicView *drawView;
@property (strong, nonatomic) UISlider *lineWSlider;
@end

@implementation YTDrawPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizableImage:@"bg"]];
    
    CGFloat viewX = 20;
    CGFloat viewY = 75;
    CGFloat viewW = 335;
    CGFloat viewH = 580;
    
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(viewX, viewY, viewW, viewH);
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizableImage:@"navBg"]];
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    
    CGFloat subviewW = 315;
    
    CGFloat subviewH = 40;
    CGFloat padding = 10;
    UIView *subview = [[UIView alloc]init];
    subview.frame = CGRectMake(padding, padding, subviewW, subviewH);
    subview.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizableImage:@"navBg"]];
    subview.layer.cornerRadius = 5;
    [view addSubview:subview];
    
    
    // 添加按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 105, 40);
    [self setBtnStyle:backBtn];
    [backBtn setTitle:@"回退" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [subview addSubview:backBtn];
    
    // 重画
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(105, 0, 105, 40);
    [self setBtnStyle:clearBtn];
    [clearBtn setTitle:@"重画" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(clearBtntnClicked) forControlEvents:UIControlEventTouchUpInside];
    [subview addSubview:clearBtn];
    
    // 保存
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(210, 0, 105, 40);
    saveBtn.layer.cornerRadius = 5;
    [self setBtnStyle:saveBtn];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [subview addSubview:saveBtn];
    
    _drawView = [[YTDrawPicView alloc]init];
    _drawView.frame = CGRectMake(padding, subviewH + padding + padding, subviewW, 470 - subviewH);
    _drawView.backgroundColor = [UIColor whiteColor];
    _drawView.layer.cornerRadius = 10;
    _drawView.clipsToBounds = YES;
    [view addSubview:_drawView];
    
    UIView *toolView = [[UIView alloc]init];
    toolView.frame = CGRectMake(padding, 500, subviewW, 70);
    toolView.backgroundColor = [UIColor colorWithPatternImage:[UIImage resizableImage:@"bg"]];
    toolView.layer.cornerRadius = 5;
    toolView.clipsToBounds = YES;
    [view addSubview:toolView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 55, 30);
    label.text = @"画笔大小";
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor blackColor];
    [toolView addSubview:label];
    
    _lineWSlider = [[UISlider alloc] init];
    _lineWSlider.value = 5;
    _lineWSlider.minimumValue = 1;
    _lineWSlider.maximumValue = 10;
    _lineWSlider.minimumTrackTintColor = [UIColor colorWithRed:51/255 green:255/255 blue:255/255 alpha:1];
    _lineWSlider.thumbTintColor = [UIColor colorWithRed:51/255 green:255/255 blue:255/255 alpha:1];
    _lineWSlider.frame = CGRectMake(60, 0, 250, 30);
    [_lineWSlider addTarget:self action:@selector(sliderValueChanged) forControlEvents:UIControlEventValueChanged];
    [_lineWSlider setValue:5];
    [toolView addSubview:_lineWSlider];
    self.drawView.lineWidth = self.lineWSlider.value;
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(0, 35, 55, 30);
    label1.text = @"画笔颜色";
    label1.font = [UIFont systemFontOfSize:13];
    label1.textColor = [UIColor blackColor];
    [toolView addSubview:label1];
    
    // 黑色
    UIButton *blackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blackBtn.frame = CGRectMake(65, 40, 40, 20);
    blackBtn.backgroundColor = [UIColor blackColor];
    NSLog(@"===%p",blackBtn);
    [blackBtn addTarget:self action:@selector(colorBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:blackBtn];
    self.drawView.lineColor = blackBtn.backgroundColor;
    
    // 红色
    UIButton *redBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    redBtn.frame = CGRectMake(115, 40, 40, 20);
    redBtn.backgroundColor = [UIColor redColor];
    [redBtn addTarget:self action:@selector(colorBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:redBtn];

    // 绿色
    UIButton *greenBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    greenBtn.frame = CGRectMake(165, 40, 40, 20);
    greenBtn.backgroundColor = [UIColor greenColor];
    [greenBtn addTarget:self action:@selector(colorBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:greenBtn];
    
    // 蓝色
    UIButton *blueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    blueBtn.frame = CGRectMake(215, 40, 40, 20);
    blueBtn.backgroundColor = [UIColor blueColor];
    [blueBtn addTarget:self action:@selector(colorBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:blueBtn];
    
    // 黄色
    UIButton *yellowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowBtn.frame = CGRectMake(265, 40, 40, 20);
    yellowBtn.backgroundColor = [UIColor yellowColor];
    [yellowBtn addTarget:self action:@selector(colorBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:yellowBtn];
}

- (void)colorBtnClicked:(UIButton *)btn
{
    
    self.drawView.lineColor = btn.backgroundColor;
    NSLog(@"colorBtnClicked====%p",btn.backgroundColor);
}

- (void)sliderValueChanged
{
    NSLog(@"%f",self.lineWSlider.value);
    self.drawView.lineWidth = self.lineWSlider.value;
}
- (void)backBtnClicked
{
    [self.drawView back];
    
}

- (void)clearBtntnClicked
{
    [self.drawView clear];
    
}

- (void)saveBtnClicked
{
    // 截图
    UIImage *image = [UIImage captureWithView:self.drawView];
    
    // 保存到图片
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

/**
 保存图片操作之后就会调用
 */
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) { // 保存失败
        [MBProgressHUD showError:@"保存失败"];
    } else { // 保存成功
        [MBProgressHUD showSuccess:@"保存成功"];
    }
}


- (void)setBtnStyle:(UIButton *)btn
{
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizableImage:@"bg"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizableImage:@"navBg"] forState:UIControlStateHighlighted];
}


@end
