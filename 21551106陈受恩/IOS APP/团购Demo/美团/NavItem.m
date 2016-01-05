//
//  NavItem.m
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "NavItem.h"
@interface NavItem()
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation NavItem

+(instancetype)makeItem1{
    return [[[NSBundle mainBundle]loadNibNamed:@"NavItem" owner:self options:nil]firstObject];    
}
-(void)addTarget:(id)target action:(SEL)action{
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
