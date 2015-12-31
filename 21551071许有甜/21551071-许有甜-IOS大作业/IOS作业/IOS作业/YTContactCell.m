//
//  YTContactCell.m
//  iOS大作业
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights

#import "YTContactCell.h"
#import "YTContact.h"
@interface YTContactCell()

@property (nonatomic,strong)UIView *divider;
@end
@implementation YTContactCell

-(void)setContact:(YTContact *)contact
{
    _contact = contact;
    _contact.name = contact.name;
    _contact.phone = contact.phone;
    
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString* ID = @"contactCell";
    YTContactCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YTContactCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}


/**
 *  构造方法(在初始化对象的时候会调用)
 *  一般在这个方法中添加需要显示的子控件
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 分割线
        UIView *divider = [[UIView alloc]init];
        divider.backgroundColor = [UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:0.5];
        
        [self.contentView addSubview:divider];
        
        self.divider = divider;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat dividerX = 2;
    CGFloat dividerH = 1;
    CGFloat dividerY = self.frame.size.height - dividerH;
    CGFloat dividerW = self.frame.size.width -4;
    
    self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
