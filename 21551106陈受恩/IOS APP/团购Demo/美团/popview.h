//
//  popview.h
//  美团
//
//  Created by 陈受恩 on 15/12/9.
//  Copyright © 2015年 chenshouen. All rights reserved.
//1.声明协议 2.声明协议中的方法 3.声明一个遵行协议的id类型的指针 4.实现协议方法

#import <UIKit/UIKit.h>
@class popview;

@protocol MyPopviewDataSource <NSObject>
@required
//制定协议方法
//left tableview 行数
-(NSInteger)numberOfRowsInLeftTable:(popview *)popview ;
//left 标题
-(NSString *)popview:(popview *)popview titleForRow:(NSInteger)row;
//left 子数据
-(NSArray *)popview:(popview *)popview subDataForRow:(NSInteger)row;

@optional
///left 图标
-(NSString *)popview:(popview *)popview imageForRow:(NSInteger)row;

@end

@protocol MyPopviewDelegate <NSObject>

@required
//选择左侧表时调用
-(void)popview:(popview *)popview didSelectRowAtLeftTable:(NSUInteger)row;
@optional
//选择右侧表时调用
-(void)popview:(popview *)popview didSelectRowAtRightTable:(NSUInteger)row;

-(void)popview:(popview *)popview didSelectRowAtRightTable:(NSUInteger)subRow mainRow:(int)mainRow;
@end

@interface popview : UIView
+(popview*)makePopView;

@property (nonatomic,strong)NSArray *categoryArr;
@property(nonatomic,assign)id<MyPopviewDataSource>dataSource;
@property(nonatomic,assign)id<MyPopviewDelegate>delegate;

@end
