//
//  ZMHCover.h
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZMHCover;
@protocol ZMHCoverDelegate <NSObject>

@optional
// 点击蒙板的时候调用
- (void)coverDidClickCover:(ZMHCover *)cover;

@end
@interface ZMHCover : UIView


+(instancetype)show;

// 设置浅灰色蒙板
@property (nonatomic, assign) BOOL dimBackground;

@property (nonatomic, weak) id<ZMHCoverDelegate> delegate;

@end
