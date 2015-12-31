//
//  NavItem3.m
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "NavItem3.h"
@interface NavItem3()
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation NavItem3

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)makeItem3{
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem3" owner:self options:nil]firstObject];
    
}
-(void)addTarget:(id)target action:(SEL)action{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];}

@end
