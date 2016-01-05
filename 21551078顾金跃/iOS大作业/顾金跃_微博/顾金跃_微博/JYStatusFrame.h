//
//  JYStatusFrame.h
//  顾金跃_微博
//
//  Created by 123 on 15/10/23.
//  Copyright © 2015年 GJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//昵称的字体
#define JYStatusNameFont [UIFont systemFontOfSize:14]

//时间的字体
#define JYStatusTimeFont [UIFont systemFontOfSize:12]

//来源的字体
#define JYStatusSourceFont [UIFont systemFontOfSize:12]

//正文的字体
#define JYStatusContentFont [UIFont systemFontOfSize:13]

@class JYStatus;
@interface JYStatusFrame : NSObject

@property(nonatomic,strong)JYStatus *status;



//顶部的View
@property(nonatomic,assign,readonly) CGRect topViewF;

//头像
@property(nonatomic,assign,readonly) CGRect iconViewF;

//会员图标
@property(nonatomic,assign,readonly) CGRect vipViewF;

//配图
@property(nonatomic,assign,readonly) CGRect photoViewF;

//昵称
@property(nonatomic,assign,readonly) CGRect nameLabelF;

//时间
@property(nonatomic,assign,readonly) CGRect timeLabelF;

//来源
@property(nonatomic,assign,readonly) CGRect sourceLabelF;

//内容/正文
@property(nonatomic,assign,readonly) CGRect contentLabelF;


////************************************************
////被转发微博的view(父控件)
//@property(nonatomic,assign,readonly)CGRect retweetiewF;
////被转发微博作者的名称
//@property(nonatomic,assign,readonly)CGRect *retweetNameLabelF;
////被转发微博的正文/内容
//@property(nonatomic,assign,readonly)CGRect *retweetContentLabelF;
////被转发微博的配图
//@property(nonatomic,assign,readonly)CGRect retweetPhotoViewF;
//


//*************************************************
//微博的工具条
@property(nonatomic,assign,readonly)CGRect statusToolBarF;

//微博的高度
@property(nonatomic,assign)CGFloat cellHeight;

@end
