//
//  ALZArticleTableCell.m
//  ALZhihuDaily
//
//  Created by alezai on 16/1/1.
//  Copyright © 2016年 alezai. All rights reserved.
//

#import "ALZArticleTableCell.h"
#import "Article.h"
#import <UIImageView+AFNetworking.h>

@interface ALZArticleTableCell ()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) Article *article;

@end

@implementation ALZArticleTableCell

#pragma mark - Interface
- (void)bindDataWithArticle:(Article *)article{
    self.article = article;
    self.titleLabel.text = article.title;
    [self.iconImageView setImageWithURL:[NSURL URLWithString:article.images[0]]];
}

#pragma mark - Life cycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.iconImageView];
        
        [self setSubViewConstrains];
    }
    return self;
}

- (void)setSubViewConstrains{
    kWeakSelf(weakSelf);
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(10);
        make.right.equalTo(weakSelf.iconImageView.mas_left).offset(-20);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(70);
        make.top.equalTo(weakSelf.titleLabel.mas_top);
        make.bottom.equalTo(weakSelf).with.offset(-10);
        make.right.equalTo(weakSelf).with.offset(-20);
    }];
}

#pragma mark - Getter and Setter
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

@end
