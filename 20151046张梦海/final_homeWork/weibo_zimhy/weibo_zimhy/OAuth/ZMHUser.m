//
//  ZMHUser.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHUser.h"

@implementation ZMHUser
- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    _vip = mbtype > 2;
}
@end
