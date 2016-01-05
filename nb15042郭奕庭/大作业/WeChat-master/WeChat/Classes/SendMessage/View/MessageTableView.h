//
//  QQTableView.h
//  QQ
//
//  Created by greeting on 15/9/16.
//  Copyright (c) 2015年 greeting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageToolsView.h"

@interface MessageTableView : UITableView

@property(nonatomic,weak) XMPPJID *Jid;
@property(nonatomic,strong) NSFetchedResultsController *resultController;

@end
