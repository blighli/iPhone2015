//
//  NavItem.h
//  meituan
//
//  Created by 陈受恩 on 15/12/8.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavItem : UIView
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
+(instancetype)makeItem1;
-(void)addTarget:(id)target action:(SEL)action;
@end

