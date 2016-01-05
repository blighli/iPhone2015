//
//  ALZArticleDetailViewModel.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALZArticleHeaderViewModel.h"

typedef void(^ALZComplectionCallback)(NSError *error);

@interface ALZArticleDetailViewModel : NSObject

+ (instancetype)viewModelWithID:(NSInteger)ID;

@property (strong, nonatomic) NSString *htmlString;
@property (strong, nonatomic) ALZArticleHeaderViewModel *headerViewModel;

- (void)loadContentWithCallBack:(ALZComplectionCallback)callBack;

@end
