//
//  thirdCollectCell.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "thirdCollectCell.h"
#import "PostModel.h"

@implementation thirdCollectCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.borderimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.picimage = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 40, 40)];
        self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, _borderimage.frame.size.width-10, _borderimage.frame.size.height-10)];
        
        [self.photo setBackgroundColor:[UIColor lightGrayColor]];
        [_borderimage setImage:[UIImage imageNamed:@"bian.jpg"]];
        
        [self.borderimage addSubview:_photo];
        [self.photo addSubview:_picimage];
        [self.contentView addSubview:_borderimage];
        
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"model"]) {
        [self.picimage setImage:[UIImage imageNamed:_model.stamp]];
        NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld.png", (long)_model.infoId]];
        [self.photo setImage:[[UIImage alloc] initWithContentsOfFile:path]];
    }
}

@end
