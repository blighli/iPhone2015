//
//  ALZArticlesViewModel.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticlesViewModel.h"
#import "Articles.h"
#import "NSDate+Expand.h"
#import "LaunchImage.h"

@implementation SectionSeparate

@end

@interface ALZArticlesViewModel ()

@property (strong, nonatomic) NSMutableArray *articlesArray;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSDateFormatter *formatter;
@property (strong, readwrite, nonatomic) NSMutableArray *separateArray;
@property (assign, nonatomic) BOOL isToday;
@property (strong, readwrite, nonatomic) LaunchImage *launchImage;

@end

@implementation ALZArticlesViewModel

#pragma mark - Interface

- (void)requestLaunchImage:(ALZComplectionCallback)callback{
    kWeakSelf(weakSelf);
    [[AFHTTPSessionManager manager] GET:@"http://news-at.zhihu.com/api/4/start-image/720*1184" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        weakSelf.launchImage = [LaunchImage mj_objectWithKeyValues:responseObject];
        callback(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
    }];
}

- (void)refreshWithCallback:(ALZComplectionCallback)callback{
    kWeakSelf(weakSelf);
    
    [[AFHTTPSessionManager manager] GET:@"http://news-at.zhihu.com/api/4/news/latest" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        weakSelf.articlesArray = [NSMutableArray new];
        Articles *articles = [Articles mj_objectWithKeyValues:responseObject];
        [weakSelf.articlesArray removeAllObjects];
        [weakSelf.articlesArray addObject:articles];
        [weakSelf.separateArray addObject:[self separateWithArticles:articles]];
        weakSelf.date = [weakSelf.formatter dateFromString:articles.date];
        weakSelf.isToday = YES;
        
        callback(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
    }];
}

- (void)loadNextWithCallback:(ALZComplectionCallback)callback{
    kWeakSelf(weakSelf);
    NSString *urlStr = [NSString stringWithFormat:@"http://news.at.zhihu.com/api/4/news/before/%@",[self preDateStr]];
    
    [[AFHTTPSessionManager manager] GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        Articles *articles = [Articles mj_objectWithKeyValues:responseObject];
        [weakSelf.articlesArray addObject:articles];
        [weakSelf.separateArray addObject:[self separateWithArticles:articles]];
        callback(nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callback(error);
    }];
}

- (Article *)articleAtIndex:(NSIndexPath *)indexPath{
    Articles *articles = self.articlesArray[indexPath.section];
    Article *article = articles.stories[indexPath.row];
    return article;
}

- (NSUInteger)numberOfSection{
    return self.articlesArray.count;
}

- (NSUInteger)numberOfArticlesInSection:(NSUInteger)section{
    Articles *articles = self.articlesArray[section];
    return articles.stories.count;
}

- (NSString *)sectionTitleAtIndex:(NSUInteger)index{
    Articles *articles = self.articlesArray[index];

    return [self dateStringWithDateString:articles.date];
}

- (NSArray *)topStories{
    Articles *articles = [self.articlesArray firstObject];
    return articles.top_stories;
}

#pragma mark - private
- (NSString *)preDateStr{
    if (self.isToday) {
        self.isToday = NO;
    }else{
        self.date = [self.date preDate];
    }
    return [self.formatter stringFromDate:self.date];
}

- (SectionSeparate *)separateWithArticles:(Articles *)articles{
    SectionSeparate *sep = [SectionSeparate new];
    if (self.separateArray.count == 0) {
        sep.locationY = 160.0;
        sep.title = @"今日热闻";
    }else{
        SectionSeparate *preSep = [self.separateArray lastObject];
        sep.locationY = preSep.locationY + preSep.count * 80.0 + 40.0;
        sep.title = [self dateStringWithDateString:articles.date];
    }
    sep.count = articles.stories.count;

    return sep;
}

- (NSString *)dateStringWithDateString:(NSString *)dateString{
    NSDate *date = [self.formatter dateFromString:dateString];
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *com = [cal components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    return [NSString stringWithFormat:@"%ld月%ld日 %@",com.month, com.day, [self weekdayStringWithNum:com.weekday]];
}

- (NSString *)weekdayStringWithNum:(NSInteger)num{
    NSString *weekdayString;
    switch (num) {
        case 7:
            weekdayString = @"星期一";
            break;
        case 1:
            weekdayString = @"星期二";
            break;
        case 2:
            weekdayString = @"星期三";
            break;
        case 3:
            weekdayString = @"星期四";
            break;
        case 4:
            weekdayString = @"星期五";
            break;
        case 5:
            weekdayString = @"星期六";
            break;
        case 6:
            weekdayString = @"星期日";
            break;
            
        default:
            break;
    }
    return weekdayString;
}

#pragma mark - Getter and Setter
- (NSDateFormatter *)formatter{
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        [_formatter setDateFormat:@"yyyyMMdd"];
    }
    return _formatter;
}

- (NSMutableArray *)separateArray{
    if (!_separateArray) {
        _separateArray = [NSMutableArray new];
    }
    return _separateArray;
}

@end
