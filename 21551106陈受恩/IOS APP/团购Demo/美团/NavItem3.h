//
//  NavItem3.h
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavItem3 : UIView
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
+(instancetype)makeItem3;
-(void)addTarget:(id)target action:(SEL)action;
@end
