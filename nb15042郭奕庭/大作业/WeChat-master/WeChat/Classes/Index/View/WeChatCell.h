//
//  MessageCell.h
//  WeChat
//
//  Created by greeting on 15/11/12.
//  Copyright © 2015年 com.greeting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeChatCell : UITableViewCell


+(instancetype)weChatCellWithTableView:(UITableView *)tableView AndDict:(NSDictionary *)dict;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier AndDict:(NSDictionary *)dict;

@end
