//
//  YCTableViewHeaderView.h
//  YCiOSHomeWork
//
//  Created by YC－MacBookPro on 15/12/14.
//  Copyright © 2015年 YC－MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

//加载上一页代理
@protocol YCTableViewHeaderViewDelegate <NSObject>
@required
- (void)postPrevPage;
@end

@interface YCTableViewHeaderView : UIView
+ (instancetype)tableViewHeaderView;
@property (nonatomic,strong) id<YCTableViewHeaderViewDelegate> delegate;
@end
