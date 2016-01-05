//
//  YTMemoCell.m
//  IOS作业
//
//  Created by Lynn on 15/12/30.
//  Copyright © 2015年 xu. All rights
//

#import "YTMemoCell.h"
#import "YTMemoFrame.h"
#import "YTMemo.h"

@interface YTMemoCell()
@property (nonatomic,strong)UIView *divider;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *timeLabel;

@property (weak, nonatomic) UILabel *subtitleLabel;

@end

@implementation YTMemoCell

- (void)awakeFromNib {
    // Initialization code
    UIView *divider = [[UIView alloc]init];
    divider.backgroundColor = [UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1];
    
    divider.alpha = 0.2;
    [self.contentView addSubview:divider];
    
    self.divider = divider;
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


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Memo";
    YTMemoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[YTMemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

        // 标题
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = YTTitleFont;
        titleLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        // 正文
        UILabel *subtitleLabel = [[UILabel alloc] init];
        subtitleLabel.numberOfLines = 0;
        subtitleLabel.font = YTTextFont;
        [self.contentView addSubview:subtitleLabel];
        self.subtitleLabel = subtitleLabel;
        
        // 时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.numberOfLines = 0;
        timeLabel.font = YTTextFont;
        titleLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        // 分割线
        UIView *divider = [[UIView alloc]init];
        divider.backgroundColor = [UIColor colorWithRed:51.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:0.5];

        [self.contentView addSubview:divider];
        
        self.divider = divider;
    }
    return self;
}

/**
 *  在这个方法中设置子控件的frame和显示数据
 */
- (void)setMemoFrame:(YTMemoFrame *)memoFrame
{
    _memoFrame = memoFrame;
    
    // 1.设置数据
    [self settingData];
    
    // 2.设置frame
    [self settingFrame];
}

/**
 *  设置数据
 */
- (void)settingData
{
    // 数据
    YTMemo *memo = self.memoFrame.memo;
    
    // 标题
    self.titleLabel.text = memo.title;
    
    // 正文
    self.subtitleLabel.text = memo.substitle;
    
    // 时间
    self.timeLabel.text = memo.time;
  
}

/**
 *  计算文字尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  设置frame
 */
- (void)settingFrame
{
    
    // 标题
    self.titleLabel.frame = self.memoFrame.titleF;
    
    // 正文
    self.subtitleLabel.frame = self.memoFrame.subtitleF;
    
    // 时间
    self.timeLabel.frame = self.memoFrame.timeF;
}



@end
