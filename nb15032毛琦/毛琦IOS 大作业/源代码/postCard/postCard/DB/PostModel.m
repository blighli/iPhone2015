//
//  PostModel.m
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import "PostModel.h"

@implementation PostModel
- (instancetype)initWithId:(NSInteger)Id photo:(NSString *)photo locate:(NSString *)locate content:(NSString *)content stamp:(NSString *)stamp
{
    self = [super init];
    if (self) {
        _infoId = Id;
        _photo = photo;
        _locate = locate;
        _content = content;
        _stamp = stamp;
    }
    return self;
}
+ (PostModel *)postModelWithId:(NSInteger)Id photo:(NSString *)photo locate:(NSString *)locate content:(NSString *)content stamp:(NSString *)stamp
{
    PostModel *model = [[PostModel alloc] initWithId:Id photo:photo locate:locate content:content stamp:stamp];
    return model;
}
 

@end
