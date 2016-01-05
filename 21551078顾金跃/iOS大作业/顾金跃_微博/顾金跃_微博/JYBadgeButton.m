//
//  JYBadgeButton.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/18.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYBadgeButton.h"

@implementation JYBadgeButton

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        self.hidden=YES;
        self.userInteractionEnabled=NO;
        [self setBackgroundImage:[self resizedImageWithName:@"main_badge_os7"] forState:UIControlStateNormal];
        self.titleLabel.font=[UIFont systemFontOfSize:10];
    }
    return self;
}

-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=[badgeValue copy];
    //设置提醒数字
    if(badgeValue)
    {
        self.hidden=NO;
        //设置数字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        //设置frame
        CGRect frame=self.frame;
        CGFloat badgeH=self.currentBackgroundImage.size.height;
        CGFloat badgeW=self.currentBackgroundImage.size.width;
        if(badgeValue.length>1)
        {
            //文字的尺寸
            CGSize badgeSize=[badgeValue sizeWithFont:self.titleLabel.font];
            badgeW=badgeSize.width+10;
        }
        frame.size.width=badgeW;
        frame.size.height=badgeH;
        self.frame=frame;
    }
    else
    {
        self.hidden=YES;
    }

}

-(UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
@end
