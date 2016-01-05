//
//  ZMHPhotosView.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHPhoto.h"
#import "UIImageView+WebCache.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

#import "ZMHPhotosView.h"
#import "ZMHPhotoView.h"

@implementation ZMHPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //        self.backgroundColor = [UIColor redColor];
        
        // 添加9个子控件
        
        [self setUpAllChildView];
        
    }
    return self;
}


// 添加9个子控件
- (void)setUpAllChildView
{
    for (int i = 0; i < 9; i++) {
        
        ZMHPhotoView *imageV = [[ZMHPhotoView alloc] init];
        
        imageV.tag = i;
        // 添加点按手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        
        [self addSubview:imageV];
    }
}

#pragma mark - 点击图片的时候调用
- (void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *tapView = tap.view;
    // ZMHPhoto -> MJPhoto
    int i = 0;
    NSMutableArray *arrM = [NSMutableArray array];
    for (ZMHPhoto *photo in _pic_urls) {
        
        MJPhoto *p = [[MJPhoto alloc] init];
        NSString *urlStr = photo.thumbnail_pic.absoluteString;
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        p.url = [NSURL URLWithString:urlStr];
        p.index = i;
        p.srcImageView = tapView;
        [arrM addObject:p];
        i++;
    }
    
    
    // 弹出图片浏览器
    // 创建浏览器对象
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    // MJPhoto
    brower.photos = arrM;
    brower.currentPhotoIndex = tapView.tag;
    [brower show];
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    // 4
    _pic_urls = pic_urls;
    
    int count = self.subviews.count;
    
    for (int i = 0; i < count; i++) {
        
        ZMHPhotoView *imageV = self.subviews[i];
        
        if (i < _pic_urls.count) { // 显示
            imageV.hidden = NO;
            
            // 获取ZMHPhoto模型
            ZMHPhoto *photo = _pic_urls[i];
            
            imageV.photo = photo;
            
            
        }else{
            imageV.hidden = YES;
        }
        
    }
    
}

// 计算尺寸
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    int col = 0;
    int rol = 0;
    int cols = _pic_urls.count==4?2:3;
    // 计算显示出来的imageView
    for (int i = 0; i < _pic_urls.count; i++) {
        col = i % cols;
        rol = i / cols;
        UIImageView *imageV = self.subviews[i];
        x = col * (w + margin);
        y = rol * (h + margin);
        imageV.frame = CGRectMake(x, y, w, h);
    }
    
    
}

@end
