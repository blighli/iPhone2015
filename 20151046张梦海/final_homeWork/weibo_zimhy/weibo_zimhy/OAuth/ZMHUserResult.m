//
//  ZMHUserResult.m
//  weibo_zimhy
//
//  Created by menghaizhang on 15/12/30.
//  Copyright © 2015年 menghaizhang. All rights reserved.
//

#import "ZMHUserResult.h"

@implementation ZMHUserResult
- (int)messageCount
{
    return _cmt + _dm + _mention_cmt + _mention_status;
}

- (int)totoalCount
{
    return self.messageCount + _status + _follower;
}
@end
