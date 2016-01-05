//
//  ALZArticleTableCell.h
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Article;

@interface ALZArticleTableCell : UITableViewCell

- (void)bindDataWithArticle:(Article *)article;

@end
