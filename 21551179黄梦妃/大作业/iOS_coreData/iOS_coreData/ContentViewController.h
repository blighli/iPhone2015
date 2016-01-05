//
//  ContentViewController.h
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Incident;

@protocol ContentViewControllerDelegate;


@interface ContentViewController : UIViewController
@property (nonatomic, weak) id <ContentViewControllerDelegate> delegate;

- (instancetype)initWithIncident:(Incident *)incident;
@end

@protocol ContentViewControllerDelegate

/**
 *  添加事件内容
 */
- (void)addInCidentWithContent:(NSString *)content;

- (void)updateInCident:(Incident *)incident;

@end