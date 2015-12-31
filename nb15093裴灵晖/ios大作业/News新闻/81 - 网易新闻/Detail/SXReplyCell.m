//
//  SXReplyCell.m
//  81 - 网易新闻
//
//  Created by peilinghui on 15/12/23.
//  Copyright © 2015年 peilinghui. All rights reserved.
//

#import "SXReplyCell.h"

@interface SXReplyCell ()

/** 用户名称 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/** 用户ip信息 */
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
/** 用户的点赞数 */
@property (weak, nonatomic) IBOutlet UILabel *supposeLabel;


@end

@implementation SXReplyCell

/** set方法数据分发 */
- (void)setReplyModel:(SXReplyModel *)replyModel
{
    _replyModel = replyModel;
    if (_replyModel.name == nil) {
        _replyModel.name = @"";
    }
    self.nameLabel.text = _replyModel.name;
    self.addressLabel.text = _replyModel.address;
    
    NSRange rangeAddress = [_replyModel.address rangeOfString:@"&nbsp"];
    if (rangeAddress.location != NSNotFound) {
        self.addressLabel.text = [_replyModel.address substringToIndex:rangeAddress.location];
    }
    
    self.sayLabel.text = _replyModel.say;
    
    NSRange rangeSay = [_replyModel.say rangeOfString:@"<br>"];
    if (rangeSay.location != NSNotFound) {
        NSMutableString *temSay = [_replyModel.say mutableCopy];
        [temSay replaceOccurrencesOfString:@"<br>" withString:@"\n" options:NSCaseInsensitiveSearch range:NSMakeRange(0, temSay.length)];
        self.sayLabel.text = temSay;
    }
    self.supposeLabel.text = _replyModel.suppose;
}


@end
