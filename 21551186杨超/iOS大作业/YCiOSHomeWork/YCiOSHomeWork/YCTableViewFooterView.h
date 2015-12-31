//
//  YCTableViewFooterView.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

//自己做不了的事，交给index控制器做，index控制器要接受这个协议
@protocol YCTableViewFooterViewDelegate <NSObject>
@required
- (void)postNextPage;
@end

@interface YCTableViewFooterView : UIView
@property (nonatomic,strong) id<YCTableViewFooterViewDelegate> delegate;
+ (instancetype)tableViewFooterView;
@end
