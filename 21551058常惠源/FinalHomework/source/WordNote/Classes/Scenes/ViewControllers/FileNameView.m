//
//  FileNameView.m
//  WordNote
//
//  Created by 常惠源 on 12/22/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "FileNameView.h"

@implementation FileNameView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addfileNameField:frame];
    }
    return self;
}

- (void)addfileNameField:(CGRect)frame{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.alpha = 0.7;
    [self addSubview:view];
    self.fileNameField = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, frame.size.width - 20, 40)];
    self.fileNameField.textAlignment = NSTextAlignmentCenter;
    [self.fileNameField becomeFirstResponder];
    self.fileNameField.placeholder = @"自定义分类名";
    self.fileNameField.font = [UIFont systemFontOfSize:14];
    self.fileNameField.backgroundColor = [UIColor whiteColor];
    view.backgroundColor = [UIColor blackColor];
    [self addSubview:self.fileNameField];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (self) {
        [self removeFromSuperview];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
