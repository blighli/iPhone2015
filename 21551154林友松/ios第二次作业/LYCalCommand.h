//
//  LYCalCommand.h
//  ios第二次作业
//
//  Created by lysongzi on 15/11/10.
//  Copyright © 2015年 lysongzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYCalCommand : NSObject

@property (nonatomic,assign) int month;
@property (nonatomic,assign) int year;

+ (void) printNoSuchCommand;
- (void) printMonth;
- (void) printYear;
@end
