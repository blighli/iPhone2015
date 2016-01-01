//
//  QQToolsView.h
//  QQ
//
//  Created by greeting on 15/9/16.
//  Copyright (c) 2015年 greeting. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageFrameModel;
typedef enum
{
    MessageToolsViewTypeSpeak,
    MessageToolsViewTypeEmotion,
    MessageToolsViewtypeMore
}MessageToolsViewType;


@interface MessageToolsView : UIImageView
@property(nonatomic,weak) XMPPJID *Jid;
@end
