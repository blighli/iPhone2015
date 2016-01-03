//
//  StampsCell.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "StampsCell.h"

@implementation StampsCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.borderimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.picimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, _borderimage.frame.size.width-10, _borderimage.frame.size.height-10)];
        
        //[self.myview setBackgroundColor:[UIColor lightGrayColor]];
        [_borderimage setImage:[UIImage imageNamed:@"bian.jpg"]];
        
        [self.borderimage addSubview:_picimage];
        [self.contentView addSubview:_borderimage];
        
    }
    return self;
}




@end
