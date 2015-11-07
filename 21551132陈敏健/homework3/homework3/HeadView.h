//
//  HeadView.h
//  homework3
//
//  Created by 敏少eclipse on 15/11/1.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegate <NSObject>
@optional
-(void)headViewDidClickedAddBtn:(NSString *)bill;

@end

@interface HeadView : UIView
@property (nonatomic,weak) id<HeadViewDelegate> delegate;
+(instancetype )headView;
@end
