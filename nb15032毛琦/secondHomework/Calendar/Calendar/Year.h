//
//  Year.h
//  Calendar
//
//  Created by 毛毛 on 15/10/26.
//  Copyright © 2015年 毛毛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YearCal : NSObject
{
    NSInteger year;
}
@property NSInteger year;

-(id)initWithYear:(NSInteger)y;

-(void) outputYear;

@end