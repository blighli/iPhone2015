//
//  PostModel.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PostModel : NSObject
@property (nonatomic, assign) NSInteger infoId;
@property (nonatomic, strong) NSString *photo;
@property (nonatomic, strong) NSString *locate;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *stamp;

- (instancetype)initWithId:(NSInteger)Id photo:(NSString *)photo locate:(NSString *)locate content:(NSString *)content stamp:(NSString *)stamp;

+ (PostModel *)postModelWithId:(NSInteger)Id photo:(NSString *)photo locate:(NSString *)locate content:(NSString *)content stamp:(NSString *)stamp;
@end
