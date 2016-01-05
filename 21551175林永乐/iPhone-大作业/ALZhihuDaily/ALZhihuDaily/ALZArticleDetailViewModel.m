//
//  ALZArticleDetailViewModel.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/3.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticleDetailViewModel.h"
#import "ArticleDetail.h"

@interface ALZArticleDetailViewModel ()

@property (assign, nonatomic) NSInteger ID;
@property (strong, nonatomic) ArticleDetail *article;

@end

@implementation ALZArticleDetailViewModel

+ (instancetype)viewModelWithID:(NSInteger)ID{
    ALZArticleDetailViewModel *viewModel = [ALZArticleDetailViewModel new];
    viewModel.ID = ID;
    return viewModel;
}

#pragma mark - Interface
- (void)loadContentWithCallBack:(ALZComplectionCallback)callBack{
    
    kWeakSelf(weakSelf);
    NSString *urlString = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/%ld",self.ID];
    
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        weakSelf.article = [ArticleDetail mj_objectWithKeyValues:responseObject];
        callBack(nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(error);
    }];
}

- (NSString *)htmlString{
    if (!_htmlString) {
        _htmlString = [self htmlStringWithCss:self.article.body css:self.article.css[0]];
    }
    return _htmlString;
}

- (ALZArticleHeaderViewModel *)headerViewModel{
    if (!_headerViewModel) {
        _headerViewModel = [ALZArticleHeaderViewModel new];
        _headerViewModel.imageURL = [NSURL URLWithString:self.article.image];
        _headerViewModel.title = self.article.title;
        _headerViewModel.imageSource = self.article.image_source;
    }
    return _headerViewModel;
}

#pragma mark - private
- (NSString *)htmlStringWithCss:(NSString *)html css:(NSString *)css{
    NSString *str;
    NSString *headCssStr = [NSString stringWithFormat:@"<head>\n\t<link rel = \"stylesheet\" href=\"%@\" />\n</head>\n "
                            "<meta name=\"viewport\" content=\"initial-scale=1.0\"/>"
                            ,css];
    str = [headCssStr stringByAppendingString:html];
    return str;
}

@end
