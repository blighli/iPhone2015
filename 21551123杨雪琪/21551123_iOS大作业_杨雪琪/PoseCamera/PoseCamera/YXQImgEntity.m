//
//  YXQImgEntity.m
//  PoseCamera
//
//  Created by YXQ on 16/1/2.
//  Copyright © 2016年 YXQ. All rights reserved.
//

#import "YXQImgEntity.h"

@implementation YXQImgEntity

//定义全局静态变量
static YXQImgEntity* dataModel = nil;

//定义一个类方法进行访问
+ (YXQImgEntity *)sharedModel
{
    if (!dataModel) {
        dataModel = [[YXQImgEntity alloc] init];
        dataModel.imgIndex = -1;
        dataModel.tabTitle = -1;
    }
    return dataModel;
}

- (id)init
{
    if (self = [super init]) {
        dataModel.imgIndex = -1;
        dataModel.tabTitle = -1;
    }
    return self;
}

- (id)allocWithZone:(struct _NSZone *)zone
{
    if (!dataModel) {
        dataModel.imgIndex = -1;
        dataModel.tabTitle = -1;
    }
    return dataModel;
}

@end
