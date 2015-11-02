//
//  MyCal.h
//  homework_2
//
//  Created by zhukun on 15/10/25.
//  Copyright (c) 2015年 zhukun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCal : NSObject{

    int year;
    int month;
    
}
-(void) setMonthAndYearWithToday;
-(void) printfSingleMonthWithOutParams;
-(void) printfSingleMonthDataWithMonth:(int)month;
+(void) printfSingleMonthDataWithMonth:(int)month AndYear:(int)year;
+ (void) printfDataWithYear:(int)year;



@end
