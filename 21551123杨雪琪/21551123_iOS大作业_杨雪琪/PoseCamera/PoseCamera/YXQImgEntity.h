//
//  YXQImgEntity.h
//  PoseCamera
//
//  Created by YXQ on 16/1/2.
//  Copyright © 2016年 YXQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXQConstant.h"

@interface YXQImgEntity : NSObject

@property(nonatomic, assign) enum tabTitles tabTitle;
@property(nonatomic, assign) NSInteger imgIndex;
+ (YXQImgEntity*)sharedModel;

@end
