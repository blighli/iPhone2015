//
//  FxLandscapeCell.h
//  FxHejinbo
//
//  Created by hejinbo on 15/6/26.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseInfo.h"

@interface FxLandscapeCell : UIView 

@property(nonatomic, strong) BaseInfo   *cellInfo;
@property(nonatomic, assign) id         owner;

- (void)setCellData:(BaseInfo *)info;

@end
