//
//  CLLuckyLabel.m
//  my2048
//
//  Created by LYH on 15/12/29.
//  Copyright © 2015年 LYH. All rights reserved.
//

#import "CLLuckyLabel.h"

@implementation CLLuckyLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:246/255.0 green:124/255.0 blue:95/255.0 alpha:0.7];
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.cornerRadius=30.0;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
