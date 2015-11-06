//
//  Add_part.h
//  Homework_3
//
//  Created by YunhanXu on 15/11/1.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeadViewDelegate <NSObject>
@optional
-(void)addPartDidClickedAddBtn:(NSString *)addString;
@end

@interface Add_part : UIView
@property (nonatomic,weak) id<HeadViewDelegate> delegate;
+(instancetype )add_part;
@end
