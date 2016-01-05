//
//  JYStatusFrame.m
//  顾金跃_微博
//
//  Created by 123 on 15/10/23.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import "JYStatusFrame.h"
#import "JYStatus.h"
#import "JYUser.h"

//cell的边框宽度
#define JYStatusCellBorder 8



@implementation JYStatusFrame
/*
 获得微博模型数据之后,根据微博数据计算所有子控件的frame
 */
-(void)setStatus:(JYStatus *)status
{
    _status=status;
    
    //cell的宽度
    CGFloat cellW=[UIScreen mainScreen].bounds.size.width;
    
    //1.topView
    CGFloat topViewW=cellW;
    CGFloat topViewX=0;
    CGFloat topViewY=0;
    CGFloat topViewH=0;
    
    //2.头像
    CGFloat iconViewW=35;
    CGFloat iconViewX=JYStatusCellBorder;
    CGFloat iconViewY=JYStatusCellBorder;
    CGFloat iconViewH=35;
    _iconViewF=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    
    //3.昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + JYStatusCellBorder;
    CGFloat nameLabelY = iconViewY;
    CGSize nameLabelSize = [status.user.name sizeWithFont:JYStatusNameFont];
    _nameLabelF=CGRectMake(nameLabelX, nameLabelY, nameLabelSize.width, nameLabelSize.height);

          
    //4.会员图标
    if(status.user.mbtype)
    {
        CGFloat vipViewW=14;
        CGFloat vipViewH=nameLabelSize.height;
        CGFloat vipViewX=CGRectGetMaxX(_nameLabelF)+JYStatusCellBorder;
        CGFloat vipViewY=nameLabelY;
        _vipViewF=CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    }
    
    //5.时间
    CGFloat timeLabelX =nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF)+2;
    CGSize timeLabelSize = [status.created_at sizeWithFont:JYStatusTimeFont];
    _timeLabelF=(CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    //6.来源
    CGFloat sourceLabelX =CGRectGetMaxX(_timeLabelF)+JYStatusCellBorder;
    CGFloat sourceLabelY = timeLabelY;
    
    CGSize sourceLabelSize = [status.source sizeWithFont:JYStatusSourceFont];
    _sourceLabelF=(CGRect){{sourceLabelX,sourceLabelY},sourceLabelSize};
    
    //7.微博的正文内容
    
    CGFloat contentLabelX =iconViewX;
    CGFloat contentLabelY=MAX(CGRectGetMaxY(_iconViewF),CGRectGetMaxY(_timeLabelF))+JYStatusCellBorder;
    
    CGFloat contentLabelMaxW=topViewW-2*JYStatusCellBorder;
    
    CGSize contentLabelSize = [status.text sizeWithFont:JYStatusContentFont constrainedToSize:CGSizeMake (contentLabelMaxW,MAXFLOAT)];
    _contentLabelF=(CGRect){{contentLabelX,contentLabelY},contentLabelSize};
    
    
    //8.配图
    if(status.thumbnail_pic)
    {
        CGFloat photoViewW=90;
        CGFloat photoViewH=90;
        CGFloat photoViewX=contentLabelX;
        CGFloat photoViewY=CGRectGetMaxY(_contentLabelF)+JYStatusCellBorder;
        _photoViewF=CGRectMake(photoViewX, photoViewY, photoViewW, photoViewH);

        //计算topViewF的高度
         topViewH=CGRectGetMaxY(_photoViewF)+JYStatusCellBorder;
    }
    else
    {
        //计算topViewF的高度
         topViewH=CGRectGetMaxY(_contentLabelF)+JYStatusCellBorder;
    }
    
    _topViewF=CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    //9.计算工具条
    CGFloat statusToolbarX=topViewX;
    CGFloat statusToolbarY=CGRectGetMaxY(_topViewF);
    CGFloat statusToolbarW=topViewW;
    CGFloat statusToolbarH=35;
    _statusToolBarF=CGRectMake(statusToolbarX, statusToolbarY, statusToolbarW, statusToolbarH);
    
    //计算cell的高度
    self.cellHeight=CGRectGetMaxY(_statusToolBarF);
    
}
@end
