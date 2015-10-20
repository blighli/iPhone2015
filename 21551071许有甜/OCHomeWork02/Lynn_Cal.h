//
//  Lynn_Cal.h
//  OCHomeWork02
//
//  Created by zhu on 15/10/18.
//  Copyright © 2015年 xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lynn_Cal : NSObject
@property (strong,nonatomic)NSArray *months;

- (void) printMonth:(NSDateComponents*)comp;
- (void) printYear:(NSDateComponents*)comp;

@end
