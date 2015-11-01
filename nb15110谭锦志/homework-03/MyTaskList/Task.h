//
//  TaskList.h
//  MyTaskList
//
//  Created by apanoo on 15/11/1.
//  Copyright © 2015年 apanoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Task : NSObject

@property (nonatomic, copy, readonly) NSString *title, *time;

-(id)initWithTitle:(NSString*) title;

-(NSString*) text;

@end
