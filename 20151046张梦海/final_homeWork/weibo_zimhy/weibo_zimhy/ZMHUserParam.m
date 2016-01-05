//
//  ZMHUserParam.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHUserParam.h"
#import "ZMHAccountTool.h"
#import "ZMHAccount.h"

@implementation ZMHUserParam
+ (instancetype)param
{
    ZMHUserParam *param = [[self alloc] init];
    
    //[ZMHAccountTool account]
    //= [ZMHAccountTool account].access_token;
    ZMHAccount *account  = [ZMHAccountTool account] ;
    param.access_token = account.access_token ;
    
    return param;
}
@end
