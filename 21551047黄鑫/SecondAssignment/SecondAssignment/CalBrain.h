//
//  CalBrain.h
//  SecondAssignment
//
//  Created by Xin on 14/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalBrain : NSObject

+ (void)runWithYear: (int)year;
+ (void)runWithYear: (int)year
              month: (int)month;
- (instancetype)initWithYear: (NSInteger)year
                       month: (NSInteger)month;

@end
