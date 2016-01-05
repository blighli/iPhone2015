//
//  DetailFriendCell.h
//  WeChat
//
//  Created by greeting on 15/10/16.
//  Copyright © 2015年 com.greeting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsCell.h"

@interface DetailFriendCell : UITableViewCell

@property (nonatomic,weak) XMPPJID * Jid;

-(void)setInit;

@end
