//
//  InfoModel.h
//  ThirdAssignment
//
//  Created by linchaolin on 28/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoModel : NSObject <NSCoding>

@property (nonatomic, strong) NSString *info;
@property (nonatomic, strong) NSString *mid;

+ (instancetype)modelWithInfo: (NSString *)info;
- (instancetype)initWithInfo: (NSString *)info;

@end
