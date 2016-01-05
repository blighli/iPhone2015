//
//  CLLuckyLabel.m
//  my2048
//
//  Created by 王国军 on 15/12/17.
//  Copyright (c) 2015年 王国军. All rights reserved.
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
        
        NSLog(@"=====%d====",self.tag);
//        self.backgroundColor = [UIColor colorWithRed:16/255.0 green:124/255.0 blue:95/255.0 alpha:0.7];
//        self.backgroundColor = [UIColor redColor];
        
//         self.backgroundColor = [UIColor colorWithRed:(self.text.intValue * 50)% 255/255.0 green:(self.text.intValue * 10)% 255/255.0 blue:(self.text.intValue * 10)% 255/255.0 alpha:0.7];
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:40];
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
