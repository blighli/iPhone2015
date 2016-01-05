//
//  ContentView.m
//  WordNote
//
//  Created by 常惠源 on 12/26/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import "ContentView.h"

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubviewsFrame:frame];
    }
    return self;
}
- (void)addSubviewsFrame:(CGRect)frame{
    self.textTitleField = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, frame.size.width - 20, 40)];
    self.textTitleField.backgroundColor = [UIColor whiteColor];
    self.textTitleField.borderStyle = UITextBorderStyleRoundedRect;
    self.textTitleField.placeholder = @"请输入标题";
    
    self.textTitleField.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:self.textTitleField];
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(self.textTitleField.frame.origin.x, self.textTitleField.frame.origin.y + self.textTitleField.frame.size.height + 10, self.textTitleField.frame.size.width, frame.size.height - (self.textTitleField.frame.origin.y + self.textTitleField.frame.size.height + 10) - 10)];
//    self.textView.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:244 / 255.0 blue:211 / 255.0 alpha:1];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.font = [UIFont systemFontOfSize:16];
    [self.textView.layer setCornerRadius:10];
    
    self.textView.layer.borderColor = [[UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0]CGColor];
    self.textView.layer.borderWidth = 0.5;
    self.textView.layer.cornerRadius = 8.0f;
    [self.textView.layer setMasksToBounds:YES];
    
    [self addSubview:self.textView];
    
}

@end
