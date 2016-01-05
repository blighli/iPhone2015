//
//  ZMHStatusResult.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHStatusResult.h"
#import "ZMHStatus.h"

@implementation ZMHStatusResult
// 告诉MJ框架，数组里的字典转换成哪个模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[ZMHStatus class]};
}
@end
