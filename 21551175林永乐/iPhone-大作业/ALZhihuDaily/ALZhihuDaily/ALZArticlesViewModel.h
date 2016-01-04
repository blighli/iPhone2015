//
//  ALZArticlesViewModel.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Article.h"

@class LaunchImage;

@interface SectionSeparate : NSObject

@property (strong, nonatomic) NSString *title;
@property (assign, nonatomic) CGFloat locationY;
@property (assign, nonatomic) NSInteger count;

@end

@interface ALZArticlesViewModel : NSObject

typedef void(^ALZComplectionCallback)(NSError *error);

@property (strong, readonly, nonatomic) NSMutableArray *separateArray;
@property (strong, readonly, nonatomic) LaunchImage *launchImage;

- (void)requestLaunchImage:(ALZComplectionCallback)callback;
- (void)refreshWithCallback:(ALZComplectionCallback)callback;
- (void)loadNextWithCallback:(ALZComplectionCallback)callback;
- (Article *)articleAtIndex:(NSIndexPath *)indexPath;
- (NSUInteger)numberOfSection;
- (NSUInteger)numberOfArticlesInSection:(NSUInteger)section;
- (NSString *)sectionTitleAtIndex:(NSUInteger)index;

- (NSArray *)topStories;

@end
