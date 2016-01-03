//
//  secondTableCell.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "secondTableCell.h"
#import "PostModel.h"

@implementation secondTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;// cell选中样式
        
        self.borderimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, ScreenWidth/4.5, ScreenHeight/8)];
        self.picimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, VIEW_WIDTH(_borderimage)-10, VIEW_HEIGHT(_borderimage)-10)];
        
        self.photo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, ScreenWidth-20, ScreenHeight/4.5)];
        self.mylabel = [[UILabel alloc] initWithFrame:CGRectMake(0.36*ScreenWidth, 0.165*ScreenHeight, ScreenWidth/1.75, ScreenHeight/19)];
        
        //[self.picimage setBackgroundColor:[UIColor blackColor]];
        [self.photo setBackgroundColor:[UIColor clearColor]];
        [self.mylabel setBackgroundColor:[UIColor whiteColor]];
        [self.borderimage setImage:[UIImage imageNamed:@"bian.jpg"]];
        
        _photo.contentMode = UIViewContentModeScaleAspectFill;
        _photo.layer.cornerRadius = 3;
        _photo.layer.masksToBounds = YES;
        _mylabel.layer.cornerRadius = 3;
        _mylabel.layer.masksToBounds = YES;
        _mylabel.alpha = 0.6;
        
        [_photo addSubview:_borderimage];
        [_photo addSubview:_mylabel];
        [_borderimage addSubview:_picimage];
        [self.contentView addSubview:_photo];
        
        [self addObserver:self forKeyPath:@"model" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"model"]) {
        [self.picimage setImage:[UIImage imageNamed:_model.stamp]];
        [self.mylabel setText:_model.content];
        
        NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld.png", (long)_model.infoId]];
        UIImage *ima = [[UIImage alloc] initWithContentsOfFile:path];
        [self.photo setImage:ima];
    }
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
